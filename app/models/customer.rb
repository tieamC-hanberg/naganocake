class Customer < ApplicationRecord
  has_many :cart_items
  has_many :deliveries
  has_many :orders
  
  validates :first_name,presence:true
  validates :last_name,presence:true
  validates :first_name_kana,presence:true
  validates :last_name_kana,presence:true
  validates :postcode,presence:true
  validates :address,presence:true
  validates :phone_number,presence:true
  
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
