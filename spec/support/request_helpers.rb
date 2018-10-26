module Requests
  module JsonHelpers
    def json
      JSON.parse response.body
    end

    def auth_headers(user)
      { Authorization: JwtService.encode(user) }
    end
  end
end
