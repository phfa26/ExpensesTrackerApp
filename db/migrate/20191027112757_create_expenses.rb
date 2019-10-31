class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string "what"
      t.date "when"
      t.decimal "value"
      t.integer "category_id"
      t.integer "user_id"
      t.timestamps
    end
  end
end
