class AddCommentRefToComments < ActiveRecord::Migration[5.0]
  def change
    change_table :comments do |t|
      t.references :replycomment, index: true
    end
  end
end
