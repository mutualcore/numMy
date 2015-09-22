class CreateStaples < ActiveRecord::Migration
  def change
    create_table :staples do |t|
      t.string :name
    end
  end
end
