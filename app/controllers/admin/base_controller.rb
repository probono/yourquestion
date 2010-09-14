class Admin::BaseController < ApplicationController
  
  layout 'admin'
  
  before_filter :admin_required
  
  protected
  
    def admin_required
      unless true
        flash[:error] = "No autenticado"
        redirect_to root_path
      end
    end
  
end