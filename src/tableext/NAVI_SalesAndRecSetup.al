tableextension 51001 NAVI_SalesAndRecSetup extends "Sales & Receivables Setup"
{
    fields
    {
        field(51000; "Chicken Mngm"; Code[20])
        {
            Caption = 'Chicken Mngm';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        Field(51001; "Journal Batch Name"; Code[20])
        {
            Caption = 'Journal Batch Name';
            DataClassification = ToBeClassified;
        }
    }
}
