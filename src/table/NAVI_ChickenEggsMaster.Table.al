table 51000 NAVI_ChickenEggsMaster
{
    Caption = 'Chicken-Eggs Tracker';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No';
        }
        field(2; "Chicken Qty."; Integer)
        {
            Caption = 'Chicken Qty.';
        }
        field(3; "Eggs Qty."; Integer)
        {
            Caption = 'Eggs Qty.';
        }
        field(4; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(5; "User ID"; Code[50])
        {
            Caption = 'User ID';
            TableRelation = User."User Name";
        }
        field(6; "NAVI Item No"; Code[20])
        {
            Caption = 'Item No';
            TableRelation = Item."No." WHERE("Chicken Eggs Item" = CONST(true));
        }
        field(7; Location; Code[20])
        {
            Caption = 'Location';
            fieldclass = flowfield;
            CalcFormula = Lookup("Item"."NAVI Item Location" where("No." = field("NAVI Item No")));
        }
        field(8; Processed; Boolean)
        {
            Caption = 'Processed';
        }
    }
    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Lcdu_ChickenMngmNoSer: Codeunit NAVI_ChickenMngmNoSerCdu;
    begin
        Rec.No := Lcdu_ChickenMngmNoSer.GetNewSeriasNo();
        Rec."User ID" := USERID();
        Rec."Date" := WORKDATE();
    end;
}
