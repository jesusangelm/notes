class Note < ActiveRecord::Base

  validates :title, :body, presence: true
  validates :user_id, presence: true

  belongs_to :user

end
