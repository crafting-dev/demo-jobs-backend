# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  # Logs in the given user.
  def log_in(user)
    user_type = user.class.name.downcase
    session["#{user_type}_id"] = user.id
  end

  # Returns true if the given user is the current user.
  def current_user?(user)
    user_type = user.class.name.downcase
    user == current_user(user_type)
  end

  # Returns the currently logged in user.
  def current_user(user_type)
    return unless session["#{user_type}_id"]

    user_model = user_type.camelize.constantize
    @current_user ||= user_model.find(session["#{user_type}_id"])
  end

  # Returns true if the user is logged in.
  def logged_in?(user_type)
    !current_user(user_type).nil?
  end

  # Logs out the current user.
  def log_out(user_type)
    session.delete("#{user_type}_id")
    @current_user = nil
  end
end
