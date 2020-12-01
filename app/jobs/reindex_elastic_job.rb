class ReindexElasticJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Product.__elasticsearch__.create_index!
    Product.import
  end
end
