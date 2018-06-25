ActiveAdmin.register Category do
  menu parent: "Dish"

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  filter :name
  filter :created_at

  show do
    attributes_table do
      row :name
    end
  end

  form do |f|
    f.inputs t(".panel_title") do
      f.input :name
    end
    f.actions
  end

  permit_params :name
end
