FastlyRails.configure do |c|
  c.api_key = ApplicationConfig["FASTLY_API_KEY"]
  c.max_age = 86_500
  c.service_id = ApplicationConfig["FASTLY_SERVICE_ID"]
  c.stale_if_error = 26_400
  c.purging_enabled = Rails.env.production?
end
