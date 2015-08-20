class Comment < ActiveRecord::Base
  belongs_to :link
  belongs_to :user
  has_many :replies, dependent: :destroy
  acts_as_votable
end
