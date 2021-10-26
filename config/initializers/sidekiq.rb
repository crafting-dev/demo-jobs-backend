# frozen_string_literal: true

Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{ENV['REDIS_SERVICE_HOST']}:#{ENV['REDIS_SERVICE_PORT']}/12" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{ENV['REDIS_SERVICE_HOST']}:#{ENV['REDIS_SERVICE_PORT']}/12" }
end
