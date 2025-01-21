class SectionSession < ActiveRecord::Migration[7.1]
  def change
    add_column :sections, :session, :string
  end
end
