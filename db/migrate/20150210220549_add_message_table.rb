class AddMessageTable < ActiveRecord::Migration
  def change
  	create_table :messages do |t|
  	   t.string :message
  	   t.belongs_to :user, index: true
  	   # t.belongs_to :from, class_name: "User", index: true
  	   t.belongs_to :to, class_name: "User", index: true
  	   t.timestamps null: false
  	end
  end
end
