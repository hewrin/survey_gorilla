class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :surveyname
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
