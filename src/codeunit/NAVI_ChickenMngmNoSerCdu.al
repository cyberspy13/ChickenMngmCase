codeunit 51001 NAVI_ChickenMngmNoSerCdu
{
    procedure GetNewSeriasNo(): Code[20]
    var
        Lrec_SalesAndRecSetup: Record "Sales & Receivables Setup";
        Lrec_NoSeries: codeunit "No. Series";
        Lcod_NewNo: Code[20];
    begin
        Lrec_SalesAndRecSetup.Get();
        if Lrec_SalesAndRecSetup."Chicken Mngm" = '' then begin
            Error('Please setup the Chicken Mngm No. Series in Sales & Receivables Setup page.');
        end else
            Lcod_NewNo := Lrec_SalesAndRecSetup."Chicken Mngm";
        exit(Lrec_NoSeries.GetNextNo(Lcod_NewNo));
    end;
}
