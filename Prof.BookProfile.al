profile "BookProfile"
{
    Description = 'Bookstore Profile';
    RoleCenter = "Order Processor Role Center";
    Customizations = BookStoreCustomerCardProfile, BookStoreCustomerListProfile;
}
pagecustomization BookStoreCustomerListProfile customizes "Customer List" //MyTargetPageId
{
    layout
    {
        modify("Location Code")
        {
            Visible = false;
        }
    }

    actions
    {
        movebefore(NewSalesInvoice; NewSalesOrder)
    }
}
pagecustomization BookStoreCustomerCardProfile customizes "Customer Card" //MyTargetPageId
{
    layout
    {
        modify("Location Code")
        {
            Visible = false;
        }
    }

    actions
    {
        movebefore(NewSalesInvoice; NewSalesOrder)
    }
}