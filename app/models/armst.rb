class Armst < ApplicationRecord
  include ActiveModel::Validations
  # paginates_per 10

  validates :number, presence: true, uniqueness: true

  def decomp=(decomp)
    super ActiveSupport::JSON.encode(decomp)
  end

  def decomp
    ActiveSupport::JSON.decode(super)
  end
end
