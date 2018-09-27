codeunit 50130 "CompanyInfoAssistedSetup"
{

    [EventSubscriber(ObjectType::Table, Database::"Aggregated Assisted Setup", 'OnRegisterAssistedSetup', '', false, false)]
    local procedure AggregatedAssistedSetup_OnRegisterAssistedSetup(var TempAggregatedAssistedSetup: Record "Aggregated Assisted Setup");
    var
        CompanyInformation: Record "Company Information";
    begin
        TempAggregatedAssistedSetup.AddExtensionAssistedSetup(
          PAGE::"Company Information Wizard",
          'Setup Company Information',
          TRUE,
          CompanyInformation.RECORDID,
          GetCompanyInformationSetupStatus(TempAggregatedAssistedSetup),
          '');
    end;

    [EventSubscriber(ObjectType::Table, Database::"Aggregated Assisted Setup", 'OnUpdateAssistedSetupStatus', '', false, false)]
    local procedure AggregatedAssistedSetup_OnUpdateAssistedSetupStatus(var TempAggregatedAssistedSetup: Record "Aggregated Assisted Setup" TEMPORARY);
    begin
        TempAggregatedAssistedSetup.SetStatus(TempAggregatedAssistedSetup, PAGE::"Company Information Wizard", GetCompanyInformationSetupStatus(TempAggregatedAssistedSetup));
    end;

    local procedure GetCompanyInformationSetupStatus(AggregatedAssistedSetup: Record "Aggregated Assisted Setup"): Integer;
    var
        CompanyInformation: Record "Company Information";
    begin
        WITH AggregatedAssistedSetup DO BEGIN
            IF CompanyInformation.GET THEN
                IF (CompanyInformation.Name = '') OR (CompanyInformation."E-Mail" = '') THEN
                    Status := Status::"Not Completed"
                ELSE
                    Status := Status::Completed
            ELSE
                Status := Status::"Not Completed";
            EXIT(Status);
        END;
    end;
}

