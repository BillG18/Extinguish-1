class CreateConcerns < ActiveRecord::Migration[5.1]
  def change
    create_table :concerns do |t|
      t.text :title

      t.timestamps
    end
  end
end
