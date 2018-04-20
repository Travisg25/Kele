require 'httparty'
require 'json'

class Kele
  include HTTParty
  include JSON

  def initialize(email, password)
    post_response = self.class.post('/sessions', body: {
        email: email,
        password: password
      })
    @user_auth_token = post_response['auth_token']
    raise "Invalid Email or Password. Try Again." if @user_auth_token.nil?
  end

  def get_me
    response = self.class.get(api_endpoint("users/me"), headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def get_mentor_availability (mentor_id)
    id = mentor_id
    response = self.class.get("/mentors/#{id}/student_availability", headers: { "authorization" => @auth_token })
    mentor_avail = JSON.parse(response.body)
  end

  private
    def api_endpoint(endpoint)
      "https://www.bloc.io/api/v1/#{endpoint}"
    end

end
