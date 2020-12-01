class ReindexElasticJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Product.__elasticsearch__.create_index!
    Product.import
  end

  # rescue_from(ActiveRecord::RecordNotFound) do |exception|
  #   puts "ActiveRecord::RecordNotFound"
  # end

end
