ActiveAdmin.register Booking do
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
  # , :user_id
end
