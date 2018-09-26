page 50102 "Books List"
{
    PageType = List;
    SourceTable = Book;
    Editable = false;   
    CardPageId = "Book Card";
    Caption = 'Books';
    ApplicationArea = All;
    UsageCategory = Lists; 
    layout
    {
        area(content)
        {
            repeater(BookRepeater)
            {
                field("No."; "No.")
                {
                    ApplicationArea = all;
                }
                 field(Title; Title)
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
            action(Card)
            {
                Promoted = true;
                ApplicationArea = all;
                trigger OnAction()
                begin
                    page.Run(50100,Rec);
                end;
            }
        }
    }

}