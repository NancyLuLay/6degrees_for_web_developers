ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
  permit_params :first_name,
                :last_name,
                :email,
                :password,
                :password_confirmation,
                :profile_picture,
                :current_company,
                :current_position,
                :current_website,
                :location,
                :summary,
                :github,
                :phone_number

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    actions
  end

  filter :first_name
  filter :last_name
  filter :email
  filter :github

  show do
    panel 'User Details' do
      attributes_table_for user do
        row('First Name') {user.first_name}
        row('Last Name') {user.last_name}
        row :email
        row :profile_picture do |user|
          image_tag user.profile_picture.url(:version_profile_image)
        end
        row :current_company
        row :current_position
        row :summary do |user|
          truncate("#{user.summary}", length: 400)
        end
      end
    end

    panel "Contact Information" do
      attributes_table_for user do
        row :current_website
        row :location
        row :phone_number
        row :github
      end
    end
  end

  form do |f|
    inputs 'Personal Information' do
      input :first_name
      input :last_name
      input :email
      input :profile_picture
      input :current_company
      input :current_position
      input :summary
    end

    inputs 'Contact Information' do
      input :current_website
      input :location
      input :phone_number
      input :github
    end

    inputs 'Update Password' do
      input :password
      input :password_confirmation
    end
    actions
  end

end
