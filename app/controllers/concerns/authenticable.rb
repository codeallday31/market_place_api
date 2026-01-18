module Authenticable
  def current_user
    @current_user ||= find_user_from_token
  end

  protected

  def check_login
    head :forbidden unless current_user
  end

  private

  def find_user_from_token
    header = request.headers["Authorization"]
    return nil unless header

    token = header.split(" ").last

    begin
      decoded = JsonWebToken.decode(token)
      User.find_by(id: decoded&.dig("user_id"))
    rescue JWT::DecodeError
      nil
    end
  end
end
