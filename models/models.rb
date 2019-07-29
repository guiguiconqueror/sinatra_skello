class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  scope :ordered_by_ratings, -> {order(rating: :desc)}

  def likethepost!
    self.rating += 1
  end
end

class Comment < ActiveRecord::Base
  belongs_to :post
end
