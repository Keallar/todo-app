class CreateItem < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.text :description
      t.integer :status, default: 0, null: false
      t.datetime :completed_at
      t.belongs_to :list, index: true, foreign_key: true

      t.timestamps
    end
  end
end
