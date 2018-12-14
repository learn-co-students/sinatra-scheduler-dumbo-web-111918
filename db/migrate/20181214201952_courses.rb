class Courses < ActiveRecord::Migration[5.0]

  def change
    create_table :courses do |c|
      c.string :name
      c.string :professor
      c.integer :credits
    end
  end
end
