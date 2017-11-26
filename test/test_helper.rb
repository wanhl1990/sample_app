ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper

  # Add more helper methods to be used by all tests here...
  #

  def is_logged_in?
    !session[:user_id].nil?
  end

  def log_in_as(user)
    session[:user_id] = user.id
  end

  class ActionDispatch::IntergrationTest

    def log_in_as(user, password: 'password', remember_me: '1')
      post login_path, params: {session: {email: "wanhl1990@126.com", password: "wan123456", remember_me: '1'}}
    end
  end
end
