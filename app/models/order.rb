class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer


  enum order_status: {
    #入金待ち
    waiting_for_payment:0,
    #入金確認
    payment_confirmation:1,
    #制作中
    under_construction:2,
    #発送準備中
    preparing_for_shipment:3,
    #発送済み
    sent:4
  }

  enum payment_method: { credit_card: 0, transfer: 1 }
end
