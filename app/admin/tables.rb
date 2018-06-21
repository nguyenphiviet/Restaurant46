ActiveAdmin.register Table do
  menu parent: "Dish"

  index do
    selectable_column
    id_column
    column :number_of_peoples
    column :date
    column :price
    column :type_table
    column :status
    column :updated_at
    actions
  end

  filter :number_of_peoples
  filter :price
  filter :type_table
  filter :created_at

  show do |t|
    attributes_table do
      row :number_of_peoples
      row :description
      row :date
      row :price
      row :type_table
      row :status
      row :created_at
      row :updated_at
      row :image do
        t.image? ? image_tag(t.image.url, height: "100") : content_tag(:span, "No photo yet!")
      end
    end
  end

  form html: {encrype: "multipart/form-data"} do |f|
    f.inputs do
      f.input :number_of_peoples
      f.input :description
      f.input :price
      f.input :type_table
      f.input :status
      f.input :image, as: :file
    end
    f.actions
  end

  permit_params :number_of_peoples, :description, :price, :type_table, :status, :image
end
