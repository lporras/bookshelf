class Types::QueryType < Types::BaseObject
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :test_field, String, null: false,
    description: "An example field added by the generator" do
    argument :name, String, required: true
  end
  def test_field(name:)
    Rails.logger.info context[:time]
    "Hello #{name}!"
  end

  field :author, Types::AuthorType, null: true, description: "One author" do
    argument :id, ID, required: true
  end

  def author(id:)
    Author.where(id: id).first
  end

  field :authors, [Types::AuthorType], null: false

  def authors
    Author.all
  end

  field :login, String, null: false, description: "Login a user" do
    argument :email, String, required: true
    argument :password, String, required: true
  end

  def login(email:, password:)
    if user = User.where(email: email).first&.authenticate(password)
      user.sessions.create.key
    end
  end

  field :current_user, Types::UserType, null: false, description: "The currently logged user"

  def current_user
    context[:current_user]
  end
end
