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
      format_datetime dish.updated_at
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

  form do |f|
    f.inputs do
      f.input :category
      f.input :name
      f.input :price
      f.input :description, as: :ckeditor
      f.has_many :images do |item|
        item.inputs do
          item.input :url
          item.input :_destroy
        end
        item.actions
      end
    end
    f.actions
  end

  permit_params :name, :price, :description, :category_id,
    images_attributes: [:id, :url, :_destroy]
end
