class Favorite < ActiveRecord::Base
	belongs_to :user
	belongs_to :tweet

	validates :user, presence: true
	validates :user_id, uniqueness: { scope: :tweet_id }
	validates :tweet, presence: true


	def favorited_by? user
		favorites.where(user_id: user.id).exists?
	end
end
