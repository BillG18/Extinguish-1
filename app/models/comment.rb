class Comment < ActiveRecord::Base
    belongs_to :commentable, polymorphic: true
    has_many :comments, as: :commentable

    def comment_count
        count = comments.count
        comments.each { |comment| count += comment.comment_count }
        count
    end

end
