class CommentSerializer < ActiveModel::Serializer
    attributes :message
  
    belong_to :user
    
  end
  