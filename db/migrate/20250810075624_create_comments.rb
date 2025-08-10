class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.string :comment_text

      t.timestamps
    end
  end
end
