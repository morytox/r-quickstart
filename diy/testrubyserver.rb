#!/usr/bin/env ruby

require 'webrick'
include WEBrick

Dir.chdir(ARGV[1])

config = {}
config.update(:Port => 8080)
config.update(:BindAddress => ARGV[0])
config.update(:DocumentRoot => ARGV[1])

server = HTTPServer.new(config)

server.mount_proc '/exec' do |req, res|
  File.open('tmp.R', 'w') do |f|
    f.puts(req.query["data"])
  end
  res.body = `cd #{ARGV[1]};/sandbox/r/bin/R --vanilla < tmp.R`
end

['INT', 'TERM'].each {|signal|
  trap(signal) {server.shutdown}
}

server.start