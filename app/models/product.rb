class Product < ApplicationRecord
	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks


  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['name^10', 'detail']
          }
        },
        highlight: {
          pre_tags: ['<em class="label label-highlight">'],
          post_tags: ['</em>'],
          fields: {
            name:   { number_of_fragments: 0 },
            detail: { fragment_size: 25 }
          }
        }
      }
    )
  end

end
