API_GITHUB_CONFIG = YAML.load_file("#{Rails.root}/config/api_config.yml")[Rails.env]
Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :developer unless Rails.env.production?
  provider :github, API_GITHUB_CONFIG['token'], API_GITHUB_CONFIG['key'], scope: 'user:email,user:public_repo'
end
