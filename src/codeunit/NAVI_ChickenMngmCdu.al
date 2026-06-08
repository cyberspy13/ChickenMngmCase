codeunit 51000 NAVI_ChickenMngmCdu
{
    procedure CreateChickenEggsRecordInItemJournal(var ChickenEggsRecord: Record NAVI_ChickenEggsMaster)
    var
        ItemJournalLine: Record "Item Journal Line";
        ItemJournalPage: Page "Item Journal";
        Lrec_SalesAndReceivablesSetup: Record "Sales & Receivables Setup";
        LineNo: Integer;
        test: page "Item Journal";
    begin
        Lrec_SalesAndReceivablesSetup.Get();
        If Lrec_SalesAndReceivablesSetup."Journal Batch Name" = '' then begin
            Message('Please setup Journal Batch Name in Sales & Receivables Setup page.');
            exit;
        end else begin
            ItemJournalLine.SetRange("Journal Template Name", 'ITEM');
            ItemJournalLine.SetRange("Journal Batch Name", Lrec_SalesAndReceivablesSetup."Journal Batch Name");
            if ItemJournalLine.FindLast() then
                LineNo := ItemJournalLine."Line No."
            else
                LineNo := 10000;
            ChickenEggsRecord.SetRange(Processed, false);
            if ChickenEggsRecord.FindSet() then
                repeat
                    LineNo := ItemJournalLine."Line No." + 10000;
                    ItemJournalLine.Init();
                    ItemJournalLine.Validate("Journal Template Name", 'ITEM ');
                    ItemJournalLine.Validate("Journal Batch Name", Lrec_SalesAndReceivablesSetup."Journal Batch Name");
                    ItemJournalLine.Validate("Line No.", LineNo);
                    ItemJournalLine.validate("Entry Type", ItemJournalLine."Entry Type"::"Positive Adjmt.");
                    ItemJournalLine.Validate("Posting Date", ChickenEggsRecord.Date);
                    ItemJournalLine.Validate("Item No.", ChickenEggsRecord."NAVI Item No");
                    ItemJournalLine.Validate("Quantity", ChickenEggsRecord."Eggs Qty.");
                    ItemJournalLine.Validate("Location Code", ChickenEggsRecord.Location);
                    ItemJournalLine.Validate("Chicken-Eggs Tracker No", ChickenEggsRecord.No);
                    ItemJournalLine.Insert(true);
                until ChickenEggsRecord.Next() = 0;
            Message('Item Journal Line created successfully.');
        end;
    end;
}
