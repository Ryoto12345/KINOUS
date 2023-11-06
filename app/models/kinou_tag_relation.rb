class KinouTagRelation < ApplicationRecord
  belongs_to :kinou
  belongs_to :tag
end
