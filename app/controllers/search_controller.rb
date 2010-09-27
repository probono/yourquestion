class SearchController < ApplicationController
  
  def index
  end
  
  def by_tag
    @page = params[:page] || 1
    @questions = Question.sent.tagged_with(params[:tag]).paginate :per_page => 10, :page => @page
    
    respond_to do |format|
      format.html # by_tag.html.erb
      format.xml  { render :xml => @questions }
    end    
  end
  
end