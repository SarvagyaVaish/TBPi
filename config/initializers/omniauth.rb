OmniAuth.config.logger = Rails.logger

OmniAuth.config.on_failure = HomeController.action(:oauth_failure)

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :developer unless Rails.env.production?
	provider :google_oauth2, GOOGLE_ID, GOOGLE_SECRET
end 


