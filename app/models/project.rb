#require 'elasticsearch/model'
class Project < ActiveRecord::Base
  #include Searchable
  include Elasticsearch::Model
  #include Elasticsearch::Model::Callbacks

  has_and_belongs_to_many :users
  has_many :tickets
  has_many :comments, as: :commentable

  mapping do
    indexes :name 
  end

  def as_indexed_json(options={})
    self.as_json(only: [:name], include: {
      tickets: {only: [:title, :description]},
      comments:  {only: [:content]},
      users: {only: [:name, :email]}
    })
  end

  class << self
    def custom_search(query)
      __elasticsearch__.search(query: multi_match_query(query))
    end

    def multi_match_query(query)
      {
        multi_match: {
          query: query,
          type: "phrase_prefix",
          fields: ["name", "tickets.title", "tickets.description", "comments.content", "users.name", "users.email"]
        }
      }
    end
  end
end
