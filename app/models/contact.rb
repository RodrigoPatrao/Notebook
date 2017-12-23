class Contact < ActiveRecord::Base
  belongs_to :kind
  has_many :phones, dependent: :destroy, inverse_of: :contact
  has_one :address, dependent: :destroy

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true

  validates :name,
    presence: true,
    length: { minimum: 3 },
    format: { with: /\A[a-zA-Z\s]+\z/ }

  validates :email,
    presence: true,
    length: { maximum: 100 },
    format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
end
