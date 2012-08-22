class EventsController < ApplicationController
  
  autocomplete :member, :gtid
  # before_filter RubyCAS::Filter

  # GET /add_attendee/1
  # GET /add_attendee/1.json
  def remove_attendee
    member = Member.find(params[:attendee_id])
    event = Event.find(params[:id])
    Attendance.where(:member_id => member.id, :event_id => event.id).first.destroy

    flash[:notice] = 'Attendee removed'

    respond_to do |format|
      format.html { redirect_to :action => 'show' }
      format.json { render json: @events }
    end
  end

  # PUT /add_attendee/1
  # PUT /add_attendee/1.json
  def add_attendee
    gtid = params[:attendee][:gtid]
    points = params[:attendee][:points]
    member = Member.where(:gtid => gtid).first
    if !member.nil?
      @event = Event.find(params[:id])
      if @event.members.where(:gtid => gtid).count == 0
        Attendance.create(:member_id => member.id, :event_id => params[:id], :status => 'Present', :points => points)
      else
        flash[:error] = 'Member is already attending the event'
      end
    else
      redirect_to :controller => 'members', :action => 'new', :gtid => gtid, :event_id => params[:id], :points => points, :createAndAdd => true
      return
      flash[:error] = 'GTID does not exist in DB'
    end

    respond_to do |format|
      format.html { redirect_to :action => 'show' }
      format.json { render json: @events }
    end
  end

  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @members = @event.members

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
