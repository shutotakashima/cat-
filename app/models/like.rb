class Like < ApplicationRecord
  belongs_to :neko
  belongs_to :user

  validates_uniqueness_of :neko_id, scope: :user_id

end
