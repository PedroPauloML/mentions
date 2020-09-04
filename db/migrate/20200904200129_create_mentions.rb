class CreateMentions < ActiveRecord::Migration[6.0]
  def change
    create_table :mentions do |t|
      t.integer :mentioned_id
      t.string :mentioned_type
      t.integer :mentioner_id
      t.string :mentioner_type

      t.timestamps
    end
  end
end
