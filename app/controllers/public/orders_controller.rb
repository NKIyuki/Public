class Public::OrdersController < ApplicationController

  def new
    @orders = Order.new
    @addresses = current_customer.addresses.all
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
        @order.shipping_post_code = current_customer.post_code
        @order.shipping_address = current_customer.address
        @order.shipping_name = current_customer.last_name + current_member.first_name

    elsif params[:order][:address_option] == "1"
        ship = Address.find(params[:order][:customer_id])
        @order.shipping_post_code = ship.post_code
        @order.shipping_address = ship.address
        @order.shipping_name = ship.name

    elsif params[:order][:address_option] = "2"
        @order.shipping_post_code = params[:order][:shipping_post_code]
        @order.shipping_address = params[:order][:shipping_address]
        @order.shipping_name = params[:order][:shipping_name]
        else
            redirect_to new_public_order_path
        end

     @cart_items = current_customer.cart_items.all
     @order.member_id = current_customer.id
   end

   def create
     @order = Order.new(order_params)
     @order.customer_id = current_customer.id
     @order.save

     current_customer.cart_items.each do |cart_item|
       @order_details = OrderDetails.new
       @order_details.item_id = cart_item.item.id
       @order_details.amount = cart_item.amount
       @order_details.tax_included_price = (cart_item.item.proce*1.08).floor
       @order_details.order_id = @order_id
       @order_details.save
     end

     current_customer.cart_items.destroy_all
     redirect_to orders_conpletion_path
   end

   def conpletion

   end

  def show
    @orders = Orders.find(params[:id])
  end

  def index
    @orders = current_customer.orders
  end


  private

  def order_params
    parms.require(:order).permit(:postage, :payment_method, :shipping_name, :shipping_address,:shipping_post_code ,:customer_id,:total_payment,:status)

  end





end
