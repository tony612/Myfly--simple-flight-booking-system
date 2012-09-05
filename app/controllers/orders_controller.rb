class OrdersController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @title = "Order"
    @order = Order.find(params[:id])
    @flight = Flight.find(@order.flight_id)
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @title = "New Order"
    @order = Order.new
    @flight = Flight.find(params[:flight_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
    @title = "Edit order"
  end
  
  def update
    @order = Order.find(params[:id])
    respond_to do |format|
       if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { respond_with_bip(@order) }
      else
        format.html { render action: "edit" }
        format.json { respond_with_bip(@order) }
      end
    end
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
    user = current_user
    user.orders << @order
    respond_to do |format|
      if @order.save
        format.html { redirect_to new_deliver_pay_path(:order_id => @order.id), notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new", :flight_id => params[:order][:flight_id] }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def index
    @user = current_user
    @orders = current_user.orders
  end
end
