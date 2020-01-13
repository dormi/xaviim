class IndexController < ApplicationController
	before_action :authenticate, except: [:index, :forbidden]

	def index
	end

	def site
	  logger.info "autenticated site #{session[:site]} read from #{request.remote_ip} with #{request.user_agent}"
	  if session[:site] == "bebanjo_code"
	  	render session[:site], layout: false
	  else
	  	render session[:site]
	  end
	end

	def forbidden
	end

	private 

	def authenticate
		authenticated = false

		if params[:key]
			if Dormifumi::Application.config.keys[params[:site]] == params[:key]
				authenticated = true
				session[:site] = params[:site]
			end
		end 

		if !session[:site].blank?
		  	if session[:site] == params[:site]
				authenticated = true
		  	end
		end

		if !authenticated
			logger.info "forbidden page!"
			render :forbidden
		end
	end	
end
