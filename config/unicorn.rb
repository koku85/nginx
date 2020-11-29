# require 'fileutils'
# preload_app true
# timeout 5
# worker_processes 4
# listen '/tmp/nginx.socket', backlog: 1024
#
# before_fork do |server,worker|
# 	FileUtils.touch('/tmp/app-initialized')
# end


# worker_processes 2
#
# listen  '/tmp/unicorn.sock'
# pid     '/tmp/unicorn.pid'
#
# log = '${my_app}/log/unicorn.log'
# stderr_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])
# stdout_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])
#
# preload_app true
# GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true
#
# before_fork do |server, worker|
# defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
#
# old_pid = "#{ server.config[:pid] }.oldbin"
# unless old_pid == server.pid
#   begin
#    sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
#    Process.kill :QUIT, File.read(old_pid).to_i
#    rescue Errno::ENOENT, Errno::ESRCH
#   end
# end
# end
#
# after_fork do |server, worker|
#     defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
# end


worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 15
preload_app true
worker_processes 4
listen 'unix:///tmp/nginx.socket', backlog: 1024

before_fork do |server,worker|
    FileUtils.touch('/tmp/app-initialized')
end
