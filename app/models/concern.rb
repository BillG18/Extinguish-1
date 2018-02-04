class Concern < ActiveRecord::Base
    acts_as_votable
    has_many :comments, as: :commentable
    
    def comment_count
        count = comments.count
        comments.each { |comment| count += comment.comment_count }
        count
    end
end

