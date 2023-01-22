# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  def render_not_found = render plain: '404 Not Found', status: :not_found
end
