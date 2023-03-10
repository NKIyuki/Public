class Public::CustomersController < ApplicationController
  def show
    @customers = Customer.find(params[:id])
  end

  def edit
    @custome = Customer.find(params[:id])
  end

  def confirm
    @customers = Customer.all
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to public_customer_path(customer.id)
  end

  private
  def customer_params
    params.require(:customer).permit(:email,:is_deleted,:last_name,:first_name,:first_name_kana,:last_name_kana,:postal_code,:address,:telephone_number)
  end


end
