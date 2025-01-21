class AddEmailAndPhoneNumberToGraders < ActiveRecord::Migration[7.1]
  def change
    add_column :graders, :email, :string
    add_column :graders, :phone_number, :string
  end
end
