codeunit 51000 NAVI_ChickenMngmCdu
{
    procedure CreateChickenEggsRecordInItemJournal(var ChickenEggsRecord: Record NAVI_ChickenEggsMaster)
    var
        ItemJournalLine: Record "Item Journal Line";
        Lrec_SalesAndReceivablesSetup: Record "Sales & Receivables Setup";
        LineNo: Integer;
    begin
        if ChickenEggsRecord.Processed then
            exit;
        Lrec_SalesAndReceivablesSetup.Get();
        If Lrec_SalesAndReceivablesSetup."Journal Batch Name" = '' then begin
            Message('Please setup Journal Batch Name in Sales & Receivables Setup page.');
            exit;
        end else begin
            ItemJournalLine.Get(Lrec_SalesAndReceivablesSetup."Journal Batch Name");
            ItemJournalLine.SetRange("Journal Template Name", ItemJournalLine."Journal Template Name");
            ItemJournalLine.SetRange("Journal Batch Name", Lrec_SalesAndReceivablesSetup."Journal Batch Name");
            if ItemJOurnalLine.FindLast() then
                LineNo := ItemJournalLine."Line No." + 10000
            else
                LineNo := 10000;

            ItemJournalLine.Init();
            ItemJournalLine.Validate("Journal Template Name", ItemJournalLine."Journal Template Name");
            ItemJournalLine.Validate("Journal Batch Name", Lrec_SalesAndReceivablesSetup."Journal Batch Name");
            ItemJournalLine.Validate("Line No.", LineNo);
            ItemJournalLine.validate("Entry Type", ItemJournalLine."Entry Type"::"Positive Adjmt.");
            ItemJournalLine.Validate("Posting Date", ChickenEggsRecord.Date);
            ItemJournalLine.Validate("Item No.", ChickenEggsRecord."NAVI Item No");
            ItemJournalLine.Validate("Quantity", ChickenEggsRecord."Eggs Qty.");
            ItemJournalLine.Validate("Location Code", ChickenEggsRecord.Location);
            ItemJournalLine.Insert(true);
            Message('Item Journal Line created successfully.');
        end;
    end;
}
