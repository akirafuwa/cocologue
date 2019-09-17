class AddDiaryDateToDiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :diary_date, :date
  end
end
