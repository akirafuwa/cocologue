class AddIndexToDiary < ActiveRecord::Migration[5.2]
  def change
    add_index :diaries, [:diary_date, :user_id], :name => 'unique_diary_per_date', :unique => true
  end
end
