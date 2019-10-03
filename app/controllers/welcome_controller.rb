# frozen-string-literal: true

class WelcomeController < ApplicationController
  protect_from_forgery prepend: true
  before_action :authenticate_user!
  def index; end
end
