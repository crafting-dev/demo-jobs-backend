# frozen_string_literal: true

class SessionsController < ApplicationController
  # POST /login
  def create
    user = Employer.find_by(email: params[:email].downcase)
    user = Worker.find_by(email: params[:email].downcase) if user.nil?
    if user&.authenticate(params[:password])
      log_in user
      respond_json(user)
    else
      respond_json({ message: 'Invalid email/password combination' }, :unprocessable_entity)
    end
  end

  # DELETE /logout
  def destroy
    log_out if logged_in?
    head :no_content
  end
end
