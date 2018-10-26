class JwtService
  def self.encode(user)
    JWT.encode({ user_id: user.id }, self.secret)
  end

  def self.decode(token:)
    JWT.decode(token, self.secret).first
  end

  def self.secret
    Rails.application.secret_key_base
  end
end
