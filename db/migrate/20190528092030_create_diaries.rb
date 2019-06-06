class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.text :content
      t.datetime :woke_up_at
      t.datetime :slept_at
      t.integer :activity
      t.integer :mood
      t.integer :appetite
      t.integer :walking
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
