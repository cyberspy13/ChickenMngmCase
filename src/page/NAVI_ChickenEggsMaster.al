page 51000 NAVI_ChickenEggs
{
    ApplicationArea = All;
    Caption = 'Chicken-Eggs Tracker';
    PageType = List;
    UsageCategory = Administration;
    SourceTable = NAVI_ChickenEggsMaster;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(no; Rec.No)
                {
                }
                field("Chicken Qty."; Rec."Chicken Qty.")
                {
                }
                field("Eggs Qty."; Rec."Eggs Qty.")
                {
                }
                field("Date"; Rec."Date")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Item No"; Rec."NAVI Item No")
                {
                }
                field(Location; Rec.Location)
                {
                }
                field(Processed; Rec.Processed)
                {
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(CreateItemJournalLine)
            {
                Caption = 'Create Item Journal Line';
                Image = New;
                trigger OnAction()
                var
                    Lcdu_ChickenMngmCdu: Codeunit NAVI_ChickenMngmCdu;
                begin
                    Lcdu_ChickenMngmCdu.CreateChickenEggsRecordInItemJournal(Rec);
                end;
            }
        }
    }
}
