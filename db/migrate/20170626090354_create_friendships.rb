class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships, id: false do |t|
      t.belongs_to :user
      t.belongs_to :friend
      t.timestamps
    end
  end
end
