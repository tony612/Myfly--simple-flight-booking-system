class DeliverPaysController < ApplicationController
  # GET /deliver_pays
  # GET /deliver_pays.json
  def index
    @deliver_pays = DeliverPay.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deliver_pays }
    end
  end

  # GET /deliver_pays/1
  # GET /deliver_pays/1.json
  def show
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
    @deliver_pay = DeliverPay.new
    @order = Order.find(params[:order_id])
    @flight = Flight.find(@order.flight_id)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deliver_pay }
    end
  end

  # GET /deliver_pays/1/edit
  def edit
    @deliver_pay = DeliverPay.find(params[:id])
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

  # PUT /deliver_pays/1
  # PUT /deliver_pays/1.json
  def update
    @deliver_pay = DeliverPay.find(params[:id])

    respond_to do |format|
      if @deliver_pay.update_attributes(params[:deliver_pay])
        format.html { redirect_to @deliver_pay, notice: 'Deliver pay was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deliver_pay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deliver_pays/1
  # DELETE /deliver_pays/1.json
  def destroy
    @deliver_pay = DeliverPay.find(params[:id])
    @deliver_pay.destroy

    respond_to do |format|
      format.html { redirect_to deliver_pays_url }
      format.json { head :no_content }
    end
  end
end
