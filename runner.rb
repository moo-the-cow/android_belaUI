require 'json'

$setup = JSON.parse(File.read(__dir__ + '/setup.json'))

def in_array(array, search)
  array.each_with_index do |el, idx|
    return idx if el == search
  end
  return -1
end

def gen_ip_file(filename)
  file = File.open(filename, 'w')

  addrs = `ifconfig 2> /dev/null | grep 'inet ' | awk '{print $2}' | grep -v '127\|172'`
  addrs.each_line do |line|
    next if (line.match('127') || line.match('172'))
    #line = line.split(" ")
    #if (srci = in_array(line, 'src')) >= 0
      file.puts(line)
    #end
  end

  file.close()
end

gen_ip_file($setup['ips_file'])

srtla_send_cmd = [
  "#{$setup['srtla_path']}/srtla_send",
  "9000",                 # srtla_send listening port
  ARGV[2],                # srtla receiver's addr
  ARGV[3],                # srtla receiver's port
  $setup['ips_file']
]

belacoder_cmd = [
  "#{$setup['belacoder_path']}/belacoder",
  "-d",
  ARGV[1],                # audio delay
  "-b",
  $setup['bitrate_file'], # bitrate limits file
  "-l",
  ARGV[4],                # srt latency
]

if ARGV[5] and ARGV[5].length > 0
  # append -s streamid
  belacoder_cmd.push("-s")
  belacoder_cmd.push(ARGV[5])
end
belacoder_cmd.push(ARGV[0])                # pipeline
belacoder_cmd.push("127.0.0.1")            # srtla_send address
belacoder_cmd.push(9000)                 # srtla_send listening port

fork do
  while true do
    srtla_send_proc = IO.popen(srtla_send_cmd)
    Process.wait(srtla_send_proc.pid)

    sleep 0.5
  end
end

while true do
  belacoder_proc = IO.popen(belacoder_cmd)
  Process.wait(belacoder_proc.pid)

  sleep 0.5
end
