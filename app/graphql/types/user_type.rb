class Types::UserType < Types::BaseObject
  description "A User"

  field :id, ID, null: true
  field :email, String, null: true
  field :is_superadmin, Boolean, null: true, camelize: false
end