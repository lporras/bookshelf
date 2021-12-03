class Mutations::CreateAuthor < GraphQL::Schema::Mutation
  null true

  #argument :first_name, String, required: false, camelize: false
  #argument :last_name, String, required: false, camelize: false
  #argument :yob, Int, required: false
  #argument :is_alive, Boolean, required: false, camelize: false
  argument :author, Types::AuthorInputType, required: true

  def resolve(author:)
    Author.create author.to_h
  end

  def self.accessible?(context)
    context[:current_user]&.is_superadmin?
  end
end