require 'jwt'

class Auth

  def self.create_token(user_object)
    payload = {user: JSON.parse(user_object.to_json)}
    token = JWT.encode(payload, "build", "HS256")
  end

  def self.decode_token(token)
    decode = JWT.decode(token, "build", true, {algorithm: "HS256"})
  end

end