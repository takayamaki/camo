# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  def render_not_found = render plain: '404 Not Found', status: :not_found

  rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid
  def render_record_invalid(error)
    errors = error.record.errors.map(&:full_message)

    render status: :unprocessable_entity,
           json: { errors: }
  end

  rescue_from ActiveRecord::RecordNotDestroyed, with: :render_record_not_destroyed
  def render_record_not_destroyed(error)
    errors = error.record.errors.map(&:full_message)

    render status: :unprocessable_entity,
           json: { errors: }
  end
end
