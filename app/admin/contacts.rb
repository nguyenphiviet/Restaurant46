ActiveAdmin.register Contact do
  index do
    selectable_column
    column :name do |contact|
      "#{contact.last_name} #{contact.first_name}"
    end
    column :email
    column :subject
    column :message do |contact|
      truncate_html contact.message, 8
    end

    actions
  end

  filter :first_name
  filter :last_name
  filter :email
  filter :subject
  filter :message
  filter :updated_at

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :subject
      row :message
    end
  end

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :subject
      f.input :message
    end
    f.actions
  end

  permit_params :first_name, :last_name, :email, :subject, :message

end
