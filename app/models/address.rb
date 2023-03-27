class Address < ApplicationRecord
  belongs_to :customer

  def full_adresses
    '〒' + postal_code + ' ' + address + ' ' + name
  end
end
