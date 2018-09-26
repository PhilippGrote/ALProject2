page 50100 "Book Card"
{
    PageType = Card;
    SourceTable = Book;
    Caption = 'Book card';
    
    layout
    {
        area(content)
        {
            group(GroupName)
            {
                Caption = 'General';
                field("No.";"No.")
                {
                  ApplicationArea = all;  
                }
                
                field(Title;Title)
                {
                  ApplicationArea = all;  
                }
                
                field(Autor;Autor)
                {
                  ApplicationArea = all;  
                }
                
                field(Hardcover;Hardcover)
                {
                  ApplicationArea = all;  
                }
                
                field("Page Count";"Page Count")
                {
                  ApplicationArea = all;  
                }
            }
        }
    }
}