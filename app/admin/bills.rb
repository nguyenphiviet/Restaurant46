ActiveAdmin.register Bill do
  menu parent: "Customer"

  controller do
    def scoped_collection
      super.includes :customer
    end
  end

  index do
    column "User" do |bill|
     link_to bill.customer.name, admin_dashboard_path(bill.customer)
    end
  end
end
