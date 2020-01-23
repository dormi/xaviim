class IndexController < ApplicationController
  before_action :authenticate, only: :site

  def site
    logger.info "autenticated site #{params[:site]} read from #{request.remote_ip} with #{request.user_agent}"
    render "sites/#{params[:site]}"
  end

  private

    def authenticate
      if params[:key] && params[:key] == secret_key
        session[:site] = params[:site]
      end

      unless session[:site] == params[:site]
        logger.info "forbidden page!"
        render :forbidden
      end
    end

    def secret_key
      Rails.application.credentials.site_keys[params[:site].to_sym]
    end
end
