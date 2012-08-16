class MembersController < ApplicationController
  # GET /members/report
  # GET /members/report.json
  def report
    if params[:semester_id]
      @semester_to_report = params[:semester_id][:semester_id]
    elsif Semester.where('start_dt < ? and end_dt > ?', Time.now, Time.now).count > 0
      logger.debug 'No report parameter passed *****************************'
      @semester_to_report =  Semester.where('start_dt < ? and end_dt > ?', Time.now, Time.now).first.id
    elsif Semester.all.count != 0
      logger.debug 'No report parameter passed. No semester in progress *****************************'
      @semester_to_report =  Semester.order('end_dt DESC')[0]
    else
      logger.debug 'No semesters exist *****************************'
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
    @members = Member.all

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
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render json: @member, status: :created, location: @member }
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
end
