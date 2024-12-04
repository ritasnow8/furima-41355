class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :block, :building_name, :telephone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "はハイフンを含めてください" }
    validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください" }
    validates :municipality, :block, :telephone_number
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: "は10桁または11桁の数字で入力してください" }
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      municipality: municipality,
      block: block,
      building_name: building_name,
      telephone_number: telephone_number,
      order_id: order.id
    )
  end
end