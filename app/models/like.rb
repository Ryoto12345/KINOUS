class Like < ApplicationRecord
  belongs_to :kinou
  belongs_to :user

  validates_uniqueness_of :kinou_id, scope: :user_id
end
