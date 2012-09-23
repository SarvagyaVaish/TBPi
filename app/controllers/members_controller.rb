class MembersController < ApplicationController

  load_and_authorize_resource

  # GET /members/report
  # GET /members/report.json
  def report
    if params[:semester_id]
      @semester_to_report = params[:semester_id][:semester_id]
    elsif Semester.where('start_dt < ? and end_dt > ?', Time.now, Time.now).count > 0
      @semester_to_report =  Semester.where('start_dt < ? and end_dt > ?', Time.now, Time.now).first.id
    elsif Semester.all.count != 0
      @semester_to_report =  Semester.order('end_dt DESC')[0]
    else
      @semester_to_report = nil
      flash[:error] = "Cannot generate report! A semester has not been created."
    end

    logger.debug @semester_to_report

    respond_to do |format|
      format.html # report.html.erb
      format.json { render json: @members }
    end
  end

  # GET /members
  # GET /members.json
  def index
    @members = Member.order(sort_column)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @members }
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/new
  # GET /members/new.json
  def new
    @member = Member.new

    if params[:createAndAdd]
      @member.gtid = params[:gtid]
    end

    if params[:gtusername]
      @member.gtusername = params[:gtusername]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(params[:member])

    respond_to do |format|
      if @member.save
        if params[:createAndAdd] == 'true'
          Attendance.create(:member_id => @member.id, :event_id => params[:event_id], :status => 'Present', :points => 1)
          redirect_to event_path(params[:event_id])
          return
        else
          format.html { redirect_to @member, notice: 'Member was successfully created.' }
          format.json { render json: @member, status: :created, location: @member }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end

  private 
  def sort_column
    params["sort"] || "first_name"    
  end
end
