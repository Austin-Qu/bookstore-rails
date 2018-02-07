class CreateVisitors < ActiveRecord::Migration[5.1]
  def change
    create_table :visitors do |t|
      t.string :remote_ip
      t.datetime :visit_time

      t.timestamps
    end
  end
end
