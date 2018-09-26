pageextension 50101 "Customer Page Extension" extends "Customer Card"
{
    layout
    {
        addlast(General){
            field("Favorite Book No.";"Favorite Book No.")
            {
                ApplicationArea = all;        
            }

        }
        addfirst(FactBoxes)
        {
            part("Books Factbox";"Books Factox")
            {
                Caption = 'Book Details';
                SubPageLink = "No." = field("Favorite Book No.");
                ApplicationArea = all;
              }
        }
    }
} 
