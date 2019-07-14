class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :link, :source

  has_many :comment
end
