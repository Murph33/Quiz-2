class Idea < ActiveRecord::Base
  belongs_to :user

  validates :title, uniqueness: true, presence: true
  validates :body , uniqueness: true, presence: true

  has_many :comments, dependent: :destroy

  has_many :joinings, dependent: :destroy
  has_many :joining_users, through: :joinings, source: :user

  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
end
