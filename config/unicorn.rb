worker_processes 4
timeout 4
preload_app true

before_fork do |server, worker|
  if defined?(Mongoid)
    Mongoid.default_session.disconnect
  end
end

after_fork do |server, worker|
  if defined?(Mongoid)
    Mongoid.default_session.cluster.refresh
  end
end