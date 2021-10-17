# frozen_string_literal: true

class SessionsController < ApplicationController
  # POST /login_employer
  def create_employer
    employer = Employer.find_by(email: params[:email].downcase)
    if employer&.authenticate(params[:password])
      log_in(employer)
      respond_json(employer)
    else
      respond_json({ message: 'Invalid email/password combination' }, :unprocessable_entity)
    end
  end

  # DELETE /logout_employer
  def destroy_employer
    log_out('employer') if logged_in?('employer')
    head :no_content
  end

  # POST /login_worker
  def create_worker
    worker = Worker.find_by(email: params[:email].downcase)
    if worker&.authenticate(params[:password])
      log_in(worker)
      respond_json(worker)
    else
      respond_json({ message: 'Invalid email/password combination' }, :unprocessable_entity)
    end
  end

  # DELETE /logout_worker
  def destroy_worker
    log_out('worker') if logged_in?('worker')
    head :no_content
  end
end
