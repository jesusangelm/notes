class Note < ActiveRecord::Base

  validates :title, :body, presence: true

  belongs_to :user
  validates :user_id, presence: true

end
