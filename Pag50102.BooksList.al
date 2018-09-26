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
            action(Card)
            {
                Promoted = true;
                ApplicationArea = all;
                trigger OnAction()
                begin
                    page.Run(50100, Rec);
                end;
            }
            action(PrintList)
            {
                Promoted = true;
                ApplicationArea = all;
                trigger OnAction()
                begin
                    Report.Run(50100, true, false, Rec);
                end;
            }

            action(ExportBooks)
            {
                Caption = 'Export Books';
                Image = CreateXMLFile;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;
                trigger OnAction()
                Var
                    BooksExport: Record Book;
                    ExpBooks: XmlPort "Export Book";
                begin
                    CurrPage.SetSelectionFilter(BooksExport);
                    ExpBooks.SetTableView(BooksExport);
                    ExpBooks.Run();
                end;
            }

        }
    }



}