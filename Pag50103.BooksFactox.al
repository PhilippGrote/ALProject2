page 50103 "Books Factox"
{
    PageType = CardPart;
    SourceTable = Book;
    caption = 'Books Factbox';

    layout
    {
        area(content)
        {
            group("Customer Books")
            {
                field("No."; "No.")
                {
                    DrillDownPageId = "Book Card";
                    ApplicationArea = all;
                }
                field(Title; Title)
                {
                    ApplicationArea = all;
                }
                Field(Autor; Autor)
                {
                    ApplicationArea = all;
                }
                field("No. of Customers"; "No. of Customers")
                {
                    ApplicationArea = all;
                }

            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}