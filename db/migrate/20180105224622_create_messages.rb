class CreateMessages < ActiveRecord::Migration[5.0]
	def change
		create_table :messages do |t|
			t.string :body, null:false
			t.string :image
			t.references :group, foreign_key: true, index: true
			t.references :user, foreign_key: true, index: true
			t.timestamps
		end
	end
end
