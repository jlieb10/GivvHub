class HomeController < ApplicationController
  def index
    if signed_in?
      user_type = current_user.class.pluralize.underscore
      # renders the current users dashboard
      # should be located in 
      #   developers/dashboard.html.erb for developers
      #   organizations/dashboard.html.erb for organizations
      render "#{user_type}/dashboard"
    else
      redirect_to action: 'new', controller: 'devise/registrations'
    end
  end


end
