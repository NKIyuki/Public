class Order < ApplicationRecord

  
  enum status: {
    "入金待ち":0,
    "入金確認":1,
    "制作中":2,
    "発送準備中":3,
    "発送済み":4
  }
  
  enum payment_method: ["クレジットカード","銀行振込"]

  def change
  create_table :orders do |t|
    t.integer :customer_id,null:false
    t.string :postal_code,null:false
    t.string :address,null:false
    t.string :name,null:false
    t.integer :shipping_cost,null:false
    t.integer :total_payment,null:false
    t.integer :payament_method,null:false,default: 0
    t.integer :order_status,null:false,default: 0
    t.timestamps
    end
  end
end
