class Joining < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea

  validates :user_id, uniqueness: {scope: :idea_id}
  validate :not_user

  def not_user
    idea = Idea.find(idea_id)
    if user_id == idea.user_id
      errors.add(:user_id, "Can't join your own idea")
    end
  end
end
