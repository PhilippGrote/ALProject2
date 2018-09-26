report 50100 "Book List"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Book List';
    RDLCLayout = 'Rep50100.BookList.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(SingleRowData; Integer)
        {
            DataItemTableView = sorting (Number) where (Number = Const (1));

            column(COMPANYNAME; CompanyProperty.DisplayName()) { }
            column(ShowPageCount; ShowPageCount) { }
        }
        dataitem(Book; Book)
        {
            RequestFilterFields = "No.", Autor;

            column(No_Book; "No.") { IncludeCaption = true; }
            column(Title_Book; Title) { IncludeCaption = true; }
            column(Autor_Book; Autor) { IncludeCaption = true; }
            column(Page_Count_Book; "Page Count") { IncludeCaption = true; }
            //column(Hardcover_Book; Hardcover) { IncludeCaption = true;},


        }
    }
    // labels
    // {
    
    // //label(ReportTitle;'Report Title'){};
    // PageCaption = 'Page {0} of {1}';
    // }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(ShowPageCount; ShowPageCount)
                    {
                        Caption = 'Show Page Count';
                        ApplicationArea = All;

                    }
                }
            }

        }
        trigger OnInit()

        begin
            ShowPageCount := True;
        end;

    }
    
        //      actions
        //      {
        //          area(processing)
        //          {
        //              action(ActionName)
        //              {
        //                  ApplicationArea = All;

        //              }
        //          }
        //      }
        //  }
    var

        ShowPageCount: Boolean;

}