ActiveAdmin.register Review do
  menu parent: "Dish"

  index do
    selectable_column
    id_column
    column :content do |review|
      truncate_html review.content, 8
    end
    column :category
    column :admin_user
    column :updated_at do |review|
      format_datetime review.updated_at
    end

    actions
  end

  show do
    attributes_table do
      row :content do |review|
        review.content.html_safe
      end
      row :category
      row :admin_user
    end
  end

  form do |f|
    f.inputs do
      f.input :admin_user, as: :select,
        collection: AdminUser.all.map{|u| ["#{u.user_name}", u.id]}
      f.input :dish
      f.input :content, as: :ckeditor
    end
    f.actions
  end

  permit_params :content, :dish_id, :admin_user_id
end
