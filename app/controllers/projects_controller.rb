class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  
  #before_filter :beautify, :only => [:index]
  def index
    
    if params[:q].present?
      @projects = Project.custom_search(params[:q]).results

    else
      @projects = Project.all
    end

    #if params[:search_term].present?
     # @projects = Project.where("name like '%#{params[:search_term]}%'")
    #else 
     # @projects = Project.all
    #end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @tickets=@project.tickets
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new
    @users = User.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
   # @project.save
  #  @users=params[:user][:user_id]
   # @users.each { |use|
    #  @user = User.find(use)
    # @project.users.create(:user => params[:user]) << @user
    #}


    respond_to do |format|
      if @project.save
        ProjectMailer.delay_for(1.minute).project_create_mail(@project)
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        ProjectMailer.delay_for(1.minute).project_update_mail(@project)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :ok }
    end
  end

 
end
