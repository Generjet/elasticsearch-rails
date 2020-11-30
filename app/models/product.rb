require 'elasticsearch/model'

class Product < ApplicationRecord
	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks

  after_save :set_elastic_index
  after_update :set_elastic_index
  # after_destroy :set_elastic_index
  # after_rollback :set_elastic_index
  # after_commit :set_elastic_index

  # after_create do
  #   system("bundle exec rake environment elasticsearch:import:model CLASS='Product'")
  #   # self.__elasticsearch__.create_index!
  #   # self.import
  # end

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

  private

  def set_elastic_index
    Product.__elasticsearch__.create_index!
    Product.import
  end

end
