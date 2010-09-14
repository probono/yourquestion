class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  

  protected 
  
    def request_hash
      @request_hash || @request_hash = Digest::MD5.hexdigest([request.user_agent, request.remote_ip].compact.join("\n"))
    end  
    
end
