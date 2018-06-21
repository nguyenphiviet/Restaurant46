ActiveAdmin.register Booking do
  menu parent: "Customer"

  actions :all, except: [:new, :create, :edit]

  show do
    # attributes_table do
    #   row :name
    #   row :price do |dish|
    #     format_currency dish.price
    #   end
    #   row :description do |dish|
    #     dish.description.html_safe
    #   end
    #   row :category
    #   row :created_at
    #   row :updated_at
    # end
  end

  form do |f|
    f.inputs do
      f.input :table, as: :select,
        collection: Table.all.map{|tbl| ["#{tbl.id}", tbl.id]}
      f.input :time_start
      f.input :time_end
      f.input :price_table
      f.input :status
      f.input :user
    end
    f.actions
  end

  permit_params :time_start, :time_end, :price_table, :status, :table_id, :user_id
end
