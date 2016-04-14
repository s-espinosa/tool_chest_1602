class ApplicationController < ActionController::Base
  helper_method :most_recent_tool, :current_tool_summary, :current_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def most_recent_tool
    if session[:most_recent_tool_id]
      Tool.find(session[:most_recent_tool_id])
    else
      Tool.last
    end
  end

  def current_tool_summary
    "#{session[:current_tool_count]} tools have been created with a potential revenue of #{session[:current_potential_revenue]}"
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
