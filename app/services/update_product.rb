# Purpose: Update product service
class UpdateProduct
  def self.call(*args)
    new(*args).call
  end

  def initialize(product, params)
    @product = product
    @params = params
  end

  def call
    @product.update(@params)
    # raising some exceptions
  rescue ActiveRecord::RecordInvalid => e
    raise Exception.new(e.record.errors.full_messages)
  rescue => e
    raise Exception.new(e.message)
  end
end
