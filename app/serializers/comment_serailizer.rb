class CommentSerializer < ActiveModel::Serializer
    attributes :message
  
    belongs_to :user
    
  end
  