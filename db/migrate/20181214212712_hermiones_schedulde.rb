class HermionesSchedulde < ActiveRecord::Migration[5.0]
  def change
    create_table :classes do |t|
      t.integer :course_id
    end
  end
end
