class Breed < ApplicationRecord
  has_many :listing #here we don't add dependent: : destroy, it's because we don't want some one to stupidly delete our breeds.
end
