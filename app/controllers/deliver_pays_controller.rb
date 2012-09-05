class DeliverPaysController < ApplicationController
  
  before_filter :authenticate_user!

  # GET /deliver_pays/1
  # GET /deliver_pays/1.json
  def show
    @title = "Deliver and Pay"
    @deliver_pay = DeliverPay.find(params[:id])
    @order = @deliver_pay.order
    @flight = @order.flight
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @deliver_pay }
    end
  end

  # GET /deliver_pays/new
  # GET /deliver_pays/new.json
  def new
    @title = "New way"
    @deliver_pay = DeliverPay.new
    @order = Order.find(params[:order_id])
    @flight = Flight.find(@order.flight_id)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deliver_pay }
    end
  end

  # POST /deliver_pays
  # POST /deliver_pays.json
  def create
    @order = Order.find(params[:order_id])
    @deliver_pay = @order.build_deliver_pay(params[:deliver_pay])
    way = params[:deliver_pay][:deliver_way]
    params[:address].delete_if{|key, value| key != way}
    nested = params[:address][way]
    params[:address].replace(nested)
    puts params[:address]

    respond_to do |format|
      if @deliver_pay.save
        @address = @deliver_pay.build_address(params[:address])
        if @address.save
          format.html { redirect_to @deliver_pay, notice: 'Deliver pay was successfully created.' }
          format.json { render json: @deliver_pay, status: :created, location: @deliver_pay }
        else 
          format.html {render action: "new"}
          format.json {render json: @address.errors, status: :unprocessable_entity}
        end
      else
        format.html { render action: "new" }
        format.json { render json: @deliver_pay.errors, status: :unprocessable_entity }
      end
    end
  end

end
