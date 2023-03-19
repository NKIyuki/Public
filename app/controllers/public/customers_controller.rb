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
    customer = current_customer
    customer.update(customer_params)
    redirect_to customer_path(current_customer)
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:email,:is_deleted,:last_name,:first_name,:first_name_kana,:last_name_kana,:postal_code,:address,:telephone_number)
  end

  def reject_customer
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer
      if @customer.valisd_password?(params[:customer][:email]) && (@customer.is_deleted == false)
        redirect_to new_customer_registration_path
      end
    end
  end


end
