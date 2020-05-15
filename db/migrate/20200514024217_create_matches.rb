class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.string :name
      t.datetime :start_time

      t.timestamps
    end
  end
end
