class FlightsController < ApplicationController
  def search
    @flight = Flight.new
    @title = "Search"

  end
  # GET /flights
  # GET /flights.json
  def index
    @title = "Fights"
    success = true
    error = Hash.new
    unless params[:flight][:leave_time] =~ /\d\d\/\d\d\/\d\d\d\d/ then
      success = false
      error[:leave_time] = "Please input the right leaving time(dd/mm/yyyy)"
    end
    if params[:flight][:leave_city] == "" or params[:flight][:arrive_city] == ""
      error[:city] = "Please input leaving city and arriving city"
    end

    if params[:tripType] == "O" and success then
      leaveTime = Date.strptime(params[:flight][:leave_time], '%m/%d/%Y')
      @flights = Flight.where("leave_city = ? AND arrive_city = ? AND cabin_class = ? 
      AND leave_time >= ? AND leave_time <= ?", params[:flight][:leave_city], 
      params[:flight][:arrive_city], params[:cabin_class], leaveTime -= 3, 
      leaveTime += 3).order(:leave_time).per_page_kaminari params[:page]
      if @flights == []
        error[:city] = "No flights, please input the right city"
      end
    elsif params[:tripType] == "R" and success then
      unless params[:return_time] =~ /\d\d\/\d\d\/\d\d\d\d/ then
        success = false
        #error[:arrive_time] = "Please input the arriving time(dd/mm/yyyy)"
        flash[:error] = "Please input the returning time(dd/mm/yyyy)"
      else
        leaveTime = Date.strptime(params[:flight][:leave_time], '%m/%d/%Y')
        returnTime = Date.strptime(params[:return_time], '%m/%d/%Y')
        @flights = Flight.where("leave_city = ? AND arrive_city = ? AND cabin_class = ? 
        AND leave_time >= ? AND leave_time <= ?", params[:flight][:leave_city], params[:flight][:arrive_city], 
        params[:cabin_class], leaveTime -= 3, leaveTime += 3).order(:leave_time).per_page_kaminari params[:page]
        @flights_return = Flight.where("leave_city = ? AND arrive_city = ? AND cabin_class = ? 
        AND leave_time >= ? AND leave_time <= ?", params[:arrive_city], params[:leave_city], 
        params[:cabin_class], returnTime -= 3, returnTime += 3).order(:leave_time).per_page_kaminari params[:page]
        if @flights_return == []
          error[:city] = "No returning flights, please input the city"
        end
      end
    end

    respond_to do |format|
      if success
        format.html
        format.json { render json: @flight }
      else
        format.html { redirect_to root_path(:error => error).html_safe}
        format.json {  }
      end
    end
  end

end
