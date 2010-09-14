class QuestionsController < ApplicationController

  def index
    @questions = Question.sent

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
    end
  end

  def show
    @question = Question.sent.find(params[:id])
    
    redirect_to :back unless @question
    
    @vote = @question.answer.votes.find_by_request_hash(request_hash) if @question.answer
    @me_too = @question.me_toos.find_by_request_hash(request_hash)  

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @question }
    end
  end


  def new
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question }
    end
  end

  def create
    @question = Question.new(params[:question])

    respond_to do |format|
      if @question.save
        format.html { redirect_to(@question, :notice => 'Question was successfully created.') }
        format.xml  { render :xml => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  def me_too
    @question = Question.pending.find(params[:id])
    @question.me_too!(request, request_hash) if @question
    redirect_to :back
  end

  
end
