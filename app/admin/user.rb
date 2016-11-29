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

  show do
    panel 'User Details' do
      attributes_table_for user do
        row('Name') {user.first_name}
        row('Last Name') {user.last_name}
      end
    end
  end
  
end
