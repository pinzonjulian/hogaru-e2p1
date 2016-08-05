class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :message
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
