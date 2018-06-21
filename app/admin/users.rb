ActiveAdmin.register User do
  menu parent: "Customer"

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :address
    column :phone
    column :date_of_birth
    column :sign_in_count
    column :last_sign_in_at
    actions
  end

  filter :name
  filter :email
  filter :created_at

  show do
    attributes_table do
      row :name
      row :email
      row :address
      row :phone
      row :date_of_birth
      row :sign_in_count
      row :last_sign_in_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :address
      f.input :phone
      f.input :date_of_birth
    end
    f.actions
  end

  permit_params :name, :email, :address, :phone, :date_of_birth
end
