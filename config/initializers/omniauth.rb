API_GITHUB_CONFIG = YAML.load_file("#{Rails.root}/config/github_omniauth.yml")[Rails.env]
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, API_GITHUB_CONFIG['key'], API_GITHUB_CONFIG['secret'], scope: 'user:email,user:public_repo'
end
