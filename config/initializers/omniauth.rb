Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['key'], ENV['secret']
end