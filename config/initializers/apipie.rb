Apipie.configure do |config|
  config.app_name = 'Coinfalcon'
  config.translate = false
  config.default_locale = nil
  config.api_base_url = '/api'
  config.doc_base_url = '/apipie'
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api/**/*.rb"
end
