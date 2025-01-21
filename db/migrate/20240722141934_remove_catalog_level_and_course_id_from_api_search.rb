class RemoveCatalogLevelAndCourseIdFromApiSearch < ActiveRecord::Migration[7.1]
  def change
    remove_column :api_searches, :catalog_level, :string
    remove_column :api_searches, :course_id, :integer
  end
end
