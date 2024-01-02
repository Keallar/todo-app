class AddRefernceUserToLists < ActiveRecord::Migration[7.0]
  def change
    add_reference :lists, :user, index: true, foreign_key: true
  end
end
