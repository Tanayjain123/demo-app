class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :body
      t.string :author
      t.datetime :published
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
