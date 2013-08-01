API_CONFIG = YAML.load_file("#{Rails.root}/config/api_config.yml")[Rails.env]
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, API_CONFIG['key'], API_CONFIG['token']
end
