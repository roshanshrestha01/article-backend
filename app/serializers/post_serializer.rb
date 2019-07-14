class PostSerializer < ActiveModel::Serializer
  attributes :id, :slug, :title, :link, :source

  has_many :comment
end
