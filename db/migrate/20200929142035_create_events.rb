class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :eventdate
      t.string :eventdescription
      t.string :eventlocation
      t.string :eventname
      t.timestamps
    end
  end
end
