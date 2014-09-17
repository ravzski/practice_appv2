class CreateInitialTable < ActiveRecord::Migration
  def change
    
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.timestamps
    end

    create_table :comments do |t|
      t.string :content
      t.integer :task_id
      t.timestamps
    end


  end
end
