class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def change
  create_table :admins do |t|
    t.string :email,null:false
    t.string :encrypted_password,null:false
    t.timestamps
   end
  end
end
