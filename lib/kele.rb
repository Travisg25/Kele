require 'httparty'
require 'json'

class Kele
  include HTTParty
  include JSON
  include Roadmap

  def initialize(email, password)
    post_response = self.class.post(api_endpoint("sessions"), body: { "email": email, "password": password })
    @user_auth_token = post_response['auth_token']
    raise "Invalid Email or Password. Try Again." if @user_auth_token.nil?
  end

  def get_me
    response = self.class.get(api_endpoint("users/me"), headers: {"content_type" => 'application/json', "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def get_mentor_availability (mentor_id)
    id = mentor_id
    response = self.class.get(api_endpoint("mentors/#{id}/student_availability"), headers: {"content_type" => 'application/json', "authorization" => @auth_token })
    mentor_avail = JSON.parse(response.body)
  end

  def get_messages(page = nil)
    if page == nil
      response = self.class.get(api_endpoint("message_threads"), headers: { "authorization" => @auth_token})
    else
      response = self.class.get(api_endpoint("message_threads?page=#{page}"), headers: { "authorization" => @auth_token })
    end
    JSON.parse(response.body)
  end

  def create_message(recipient_id, token, subject, message)
    response = self.class.post(api_endpoint("messages"), body: { "sender": self.user["email"], "recipient_id": recipient_id, "token": token, "subject": subject, "stripped-text": stripped_text }, headers: {"authorization" => @auth_token })

  end

  private
    def api_endpoint(endpoint)
      "https://www.bloc.io/api/v1/#{endpoint}"
    end

end
