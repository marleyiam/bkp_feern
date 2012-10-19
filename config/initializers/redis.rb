if Rails.env.development?
  $redis = Redis.new
else
  $redis = Redis.new(ENV['REDISTOGO_URL'])
end