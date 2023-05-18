class CharacterSerializer
  include JSONAPI::Serializer
  attributes :race, :gender, :age, :name, :description
end
