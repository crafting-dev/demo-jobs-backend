# frozen_string_literal: true

module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    user_type = user.class.name.downcase
    session["#{user_type}_id"] = user.id
  end

  # Returns true if the given user is the current user.
  def current_user?(user)
    user == current_user
  end

  # Returns the currently logged in user.
  def current_user
    employer_id = session[:employer_id]
    worker_id = session[:worker_id]

    return unless employer_id.nil? && worker_id.nil?

    @current_user ||= if employer_id.nil?
                        Worker.find(worker_id)
                      else
                        Employer.find(employer_id)
                      end
  end

  # Returns true if the user is logged in.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    user_type = current_user.class.name.downcase
    session.delete("#{user_type}_id")
    @current_user = nil
  end
end
