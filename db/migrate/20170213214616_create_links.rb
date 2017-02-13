class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.boolean :read, :default => false

      t.timestamps
    end

  end
end
