ActiveAdmin.register Dish do
  controller do
    def csv_filename
      "List dishes.csv"
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :price do |dish|
      div class: "right" do
        format_currency dish.price
      end
    end
    column :category
    column :updated_at do |dish|
      div class: "center" do
        format_datetime dish.updated_at
      end
    end

    actions
  end

  filter :category
  filter :name
  filter :price
  filter :description
  filter :updated_at

  csv do
    column :name
    column :price do |dish|
      format_currency dish.price
    end
  end

  show do
    attributes_table do
      row :name
      row :price do |dish|
        format_currency dish.price
      end
      row :description do |dish|
        dish.description.html_safe
      end
      row :category
      row :created_at
      row :updated_at
    end
  end

  form html: {multipart: true} do |f|
    f.inputs do
      f.input :category
      f.input :name
      f.input :price
      f.input :description, as: :ckeditor

      div id: "images" do
        render 'form', f: f
      end
      # f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end

  permit_params :name, :price, :description, :category_id,
    images_attributes: [:id, :url, :_destroy]
end
