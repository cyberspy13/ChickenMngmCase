codeunit 51002 NAVI_EventSubscriber
{
    [EventSubscriber(ObjectType::codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterPostItemJnlLine', '', true, true)]
    local procedure Lprod_OnAfterPostItemJnlLine(var ItemJournalLine: Record "Item Journal Line")
    var
        ChickenEggsRecord: Record NAVI_ChickenEggsMaster;
    begin
        if ItemJournalLine."Chicken-Eggs Tracker No" <> '' then begin
            ChickenEggsRecord.Get(ItemJournalLine."Chicken-Eggs Tracker No");
            if ChickenEggsRecord.No = ItemJournalLine."Chicken-Eggs Tracker No" then begin
                ChickenEggsRecord.Processed := true;
                ChickenEggsRecord.Modify();
            end;
        end;
    end;
}