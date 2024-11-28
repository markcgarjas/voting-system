module LoginVerifier
  extend ActiveSupport::Concern

  def save_session_token(user)
    token = Devise.friendly_token
    session[:user_token] = token
    user.update(session_token: token)
  end
end