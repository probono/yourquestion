class AdministrationsController < ApplicationController
  # GET /administrations
  # GET /administrations.xml
  def index
    @administrations = Administration.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @administrations }
    end
  end

  # GET /administrations/1
  # GET /administrations/1.xml
  def show
    @administration = Administration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @administration }
    end
  end

  # GET /administrations/new
  # GET /administrations/new.xml
  def new
    @administration = Administration.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @administration }
    end
  end

  # GET /administrations/1/edit
  def edit
    @administration = Administration.find(params[:id])
  end

  # POST /administrations
  # POST /administrations.xml
  def create
    @administration = Administration.new(params[:administration])

    respond_to do |format|
      if @administration.save
        format.html { redirect_to(@administration, :notice => 'Administration was successfully created.') }
        format.xml  { render :xml => @administration, :status => :created, :location => @administration }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @administration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /administrations/1
  # PUT /administrations/1.xml
  def update
    @administration = Administration.find(params[:id])

    respond_to do |format|
      if @administration.update_attributes(params[:administration])
        format.html { redirect_to(@administration, :notice => 'Administration was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @administration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /administrations/1
  # DELETE /administrations/1.xml
  def destroy
    @administration = Administration.find(params[:id])
    @administration.destroy

    respond_to do |format|
      format.html { redirect_to(administrations_url) }
      format.xml  { head :ok }
    end
  end
end
