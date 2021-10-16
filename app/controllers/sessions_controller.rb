# frozen_string_literal: true

class SessionsController < ApplicationController
  def create_employer
    employer = Employer.find_by(email: params[:email].downcase)
    if employer&.authenticate(params[:password])
      session[:employer_id] = employer.id
      respond_json(employer)
    else
      respond_json({ message: 'Invalid email/password combination' }, :unprocessable_entity)
    end
  end

  def destroy_employer
    session.delete(:employer_id) unless current_employer.nil?
    head :no_content
  end

  def create_worker
    worker = Worker.find_by(email: params[:email].downcase)
    if worker&.authenticate(params[:password])
      session[:worker_id] = worker.id
      respond_json(worker)
    else
      respond_json({ message: 'Invalid email/password combination' }, :unprocessable_entity)
    end
  end

  def destroy_worker
    session.delete(:worker_id) unless current_worker.nil?
    head :no_content
  end

  private

  # Returns the currently logged in employer.
  def current_employer
    return unless session[:employer_id]

    @current_employer ||= Employer.find(session[:employer_id])
  end

  # Returns the currently logged in worker.
  def current_worker
    return unless session[:worker_id]

    @current_worker ||= Worker.find(session[:worker_id])
  end
end
