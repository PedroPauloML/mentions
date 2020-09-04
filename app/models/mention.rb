class Mention < ApplicationRecord
  belongs_to(:mentioned, polymorphic: true)
  belongs_to(:mentioner, polymorphic: true)

  validates_presence_of(:mentioned_id, :mentioned_type, :mentioner_id, :mentioner_type)

  def to_text
    mentioner_class_name = self.mentioner_type.constantize.model_name.human
    mentioned_class_name = self.mentioned_type.constantize.model_name.human
    mentioned_name = self.mentioned.try(:name) || "?"
    "The #{mentioned_class_name} #{mentioned_name} was mentioned in #{mentioner_class_name}"
  end
end
