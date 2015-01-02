Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.failure_app = lambda { |env| SessionsController.action(:new).call(env) }
	manager.default_strategies :password
end

Warden::Manager.serialize_into_session do |user|
	user.id
end

Warden::Manager.serialize_from_session do |id|
	User.find(id)
end

Warden::Strategies.add(:password) do
	def valid?
		params["user"]["email"] && params["user"]["password"]
	end
	
	def authenticate!
		user = User.joins(:institute)
		.where('institutes.subdomain = ? OR institutes.custom_domain = ? AND users.email = ?',
			subdomain, request.host, params["user"]["email"]).first
		if user && user.authenticate(params["user"]["password"])
			success! user
		else
			fail! "Invalid email or password"
		end
	end

  def subdomain
    ActionDispatch::Http::URL.extract_subdomains(request.host, 1)
  end
end