class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @address = current_customer.addresses.all
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:select_address] == "1"
        @order = Address.find(params[:order][:customer_id])
        @order.postal_code = postal_code
        @order.address = address
        @order.name = name

    elsif params[:order][:select_address] = "2"
        @order.postal_code = params[:order][:postal_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
    else
            redirect_to new_public_order_path
    end

     @cart_items = current_customer.cart_items.all
     @order.customer_id = current_customer.id
  end

   def create
     @order = Order.new(order_params)
     @order.customer_id = current_customer.id
     @order.order_status=0
     @order.save

     current_customer.cart_items.each do |cart_item|
       @order_details = OrderDetail.new
       @order_details.item_id = cart_item.item.id
       @order_details.amount = cart_item.amount
       @order_details.price = (cart_item.item.price*1.08).floor
       @order_details.order_id = @order.id
       @order_details.save
     end

     current_customer.cart_items.destroy_all
     redirect_to orders_conpletion_path
   end

   def conpletion

   end

  def show
    @orders = Order.find(params[:id])
  end

  def index
    @orders = current_customer.orders
    @item = Item.all
  end


  private

  def order_params
    params.require(:order).permit(:shipping_cost, :payment_method, :name, :address,:postal_code ,:customer_id,:total_amount,:order_status,:total_payment,:payment_method)

  end





end
