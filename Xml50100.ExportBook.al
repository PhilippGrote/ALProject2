xmlport 50100 "Export Book"
{
    Caption = 'Export Books';
    Format = Xml;
    UseRequestPage = False;
    Direction = Export;
    schema
    {
        textelement(Books)
        {
            tableelement(Book; Book)
            {
                fieldattribute(Number; Book."No.") {}
                fieldelement(Title;Book.Title){}
                fieldelement(Author;Book.Autor){}
                fieldelement(PageCount;Book."Page Count") {}                   
                fieldelement(Hardcover;Book.Hardcover){}
            }
        }
    }
    
    // requestpage
    // {
    //     layout
    //     {
    //         area(content)
    //         {
    //             group(GroupName)
    //             {
    //                 field(Name; SourceExpression)
    //                 {
                        
    //                 }
    //             }
    //         }
    //     }
    
    //     actions
    //     {
    //         area(processing)
    //         {
    //             action(ActionName)
    //             {
                    
    //             }
    //         }
    //     }
    // }
}