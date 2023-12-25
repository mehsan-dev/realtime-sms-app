class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.string :to
      t.text :body
      t.string :status
      t.text :error_message

      t.timestamps
    end
  end
end
