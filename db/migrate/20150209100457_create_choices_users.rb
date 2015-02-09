class CreateChoicesUsers < ActiveRecord::Migration
  def change
    create_table :choices_users do |t|
      t.belongs_to :choice, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
