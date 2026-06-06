tableextension 51000 NAVI_Item extends Item
{
    fields
    {
        field(51000; "Chicken Eggs Item"; Boolean)
        {
            Caption = 'Chicken Eggs Item';
            DataClassification = ToBeClassified;
        }
        field(51001; "NAVI Item Location"; Code[20])
        {
            Caption = 'Item Location';
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
    }
}
