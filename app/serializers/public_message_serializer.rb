class PublicMessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :is_travel_owner, :is_author
  has_one :author, serializer: SlimUserSerializer

  def author
    object.author
  end

  def is_author
    scope.current_user == object.author
  end
end
