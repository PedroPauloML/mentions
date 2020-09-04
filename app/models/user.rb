class User < ApplicationRecord
  has_many(:mentions, as: :mentioned, dependent: :destroy)

  validates_presence_of(:name)

  def name=(value)
    super(value)
    self.username = value.parameterize.gsub("-", "_")
  end
end
