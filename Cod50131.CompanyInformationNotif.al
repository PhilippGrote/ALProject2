codeunit 50131 "Company Information Notif."
{
    [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnOpenPageEvent', '', false, false)]
    local procedure CheckCompanyInfoOnOpenSalesOrder(var Rec: Record 36);
    var
        CompanyInfo: Record "Company Information";
        MyNotification: Record "My Notifications";
    begin
        IF CompanyInfo.GET THEN
            IF (CompanyInfo.Name <> '') AND (CompanyInfo."E-Mail" <> '') THEN
                EXIT;
        IF MyNotification.Get(USerid,'c90ed5b5-6c62-4419-9f9d-19617ec51d3c') AND not MyNotification.Enabled then
            EXIT;                

        CompInfoNotification.Id := CompInfoNotificationID;
        CompInfoNotification.Scope := NotificationScope::LocalScope;
        CompInfoNotification.Message := CompInfoNotificationMsg;
        CompInfoNotification.AddAction(
            CompInfoNotificationActionMsg,
            Codeunit::"Company Information Notif.",
            'ShowCompanyInfoWizard');
        CompInfoNotification.Send;
    end;

    procedure ShowCompanyInfoWizard(Notification: Notification);
    begin
        Page.Run(Page::"Company Information Wizard");
    end;

    [EventSubscriber(ObjectType::Page, Page::"My Notifications", 'OnInitializingNotificationWithDefaultState', '', false, false)]
    procedure CheckOninitializingNotificationWithDefaultStatr()
    var
        MyNotification: Record "My Notifications";
    begin
        MyNotification.InsertDefault('c90ed5b5-6c62-4419-9f9d-19617ec51d3c','Company Information Notification','Show Company info Natification in Sales Order',true);
    end;

    var
        CompInfoNotification: Notification;
        CompInfoNotificationID: Label 'dad7f25b-5612-4edf-85d6-15757c6b2321', Locked = true;
        CompInfoNotificationMsg: Label 'Company Information is missing.';
        CompInfoNotificationActionMsg: Label 'Open Company Information Setup';
}

