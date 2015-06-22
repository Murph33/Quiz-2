class Idea < ActiveRecord::Base
  belongs_to :user

  validates :title, uniqueness: true, presence: true
  validates :body , uniqueness: true, presence: true

  has_many :comments, dependent: :destroy

  has_many :joinings, dependent: :destroy
  has_many :joining_users, through: :joinings, source: :user

  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/  
end
