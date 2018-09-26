tableextension 50100 "Customer Book Extension" extends Customer
{
    fields
    {
      field(50100; "Favorite Book No."; Code[20])
      {
         TableRelation = Book;
         Caption = 'Favorite Book No.';
      }
    }

}