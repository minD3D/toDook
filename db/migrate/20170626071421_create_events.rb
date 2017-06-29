class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|

      t.datetime :start_time
      t.datetime :end_time
      t.string :place
      t.text :content
      t.belongs_to :user
      t.timestamps
    end
  end
end
