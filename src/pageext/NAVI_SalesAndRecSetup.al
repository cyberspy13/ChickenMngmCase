pageextension 51001 NAVI_SalesAndRecSetup extends "Sales & Receivables Setup"
{
    layout
    {
        addlast(General)
        {
            field("Chicken Mngm"; Rec."Chicken Mngm")
            {
                ApplicationArea = All;
            }
            field("Journal Batch Name"; Rec."Journal Batch Name")
            {
                ApplicationArea = All;
            }
        }
    }
}
