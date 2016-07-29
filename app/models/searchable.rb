module Searchable
  extend ActiveSupport::Concern
    included do 
      include ElasticSearch::Model
        mapping do
        end
        def self.search(s)
          puts "shrey"
        end
      end
    
end