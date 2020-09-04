class Post < ApplicationRecord
  has_many(:mentions, as: :mentioner, dependent: :destroy)

  validates_presence_of(:content)

  after_save(:update_mentions)

  private

  def update_mentions
    pmp = PostMentionProcessor.new(self)
    pmp.process_mentions
  end
end
