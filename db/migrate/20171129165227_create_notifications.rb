class CreateNotifications < ActiveRecord::Migration[5.1]
	def change
		create_table :notifications do |t|
			t.references :user, index: true, foreign_key: true
			t.references :subscribed_user, index: true, foreign_key: true
			t.references :post, index: true, foreign_key: true
			t.integer :identifier
			t.boolean :read
			t.string :type

			t.timestamps
		end
	end
end
