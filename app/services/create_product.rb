# service for create product

class CreateProduct
  def self.call(*args)
    new(*args).call
  end

  def initialize(params)
    @params = params
  end

  def call
    Product.create(@params)
    # raising some exceptions
  rescue ActiveRecord::RecordInvalid => e
    raise Exception.new(e.record.errors.full_messages)
  rescue => e
    raise Exception.new(e.message)
  end
end
