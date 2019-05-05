class Listing < ApplicationRecord
  belongs_to :breed
  enum sex:{female: 0, male: 1}
  validates :title, :breed_id, :sex, :price, :deposit, :date_of_birth, presence: true # presence is the validation rule, we didnt put :diet here, this means that the users do not necessarily input diet value
  has_one_attached :picture
end
