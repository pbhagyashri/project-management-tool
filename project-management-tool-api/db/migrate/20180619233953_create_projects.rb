class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.text :summary
      t.text :user_id

      t.timestamps
    end
  end
end
