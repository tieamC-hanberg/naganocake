class Customer < ApplicationRecord
  has_many :cart_items
  has_many :deliveries
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def full_name
    self.last_name + " " + self.first_name
  end
  def full_name_kana
    self.last_name_kana + " " + self.first_name_kana
  end
  
  
  
  # include JpPrefecture
  # jp_prefecture :prefecture_code
  # def prefecture_name
  #   JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  # end

  # def prefecture_name=(prefecture_name)
  #   self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  # end

end
