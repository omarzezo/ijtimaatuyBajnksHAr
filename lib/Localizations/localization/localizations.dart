import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'l10n/messages_all.dart';

class AppLocalizations {

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  String get locale {
    return Intl.message('en', name: 'locale');
  }
  String get lblSignIn{
    return Intl.message('lblSignIn', name: 'lblSignIn');
  }
  String get lblCompanyName{
    return Intl.message('lblCompanyName', name: 'lblCompanyName');
  }String get lblManageClinic{
    return Intl.message('lblManageClinic', name: 'lblManageClinic');
  }String get lblEmail{
    return Intl.message('lblEmail', name: 'lblEmail');
  }String get lblPassword{
    return Intl.message('lblPassword', name: 'lblPassword');
  }String get lblLogin{
    return Intl.message('lblLogin', name: 'lblLogin');
  }String get lblForgetPassword{
    return Intl.message('lblForgetPassword', name: 'lblForgetPassword');
  }String get lblWelcome{
    return Intl.message('lblWelcome', name: 'lblWelcome');
  }String get lblWelcomeBack{
    return Intl.message('lblWelcomeBack', name: 'lblWelcomeBack');
  }String get lblLetsComplete{
    return Intl.message('lblLetsComplete', name: 'lblLetsComplete');
  }String get lblCompleteProfile{
    return Intl.message('lblCompleteProfile', name: 'lblCompleteProfile');
  }String get lblWillSend{
    return Intl.message('lblWillSend', name: 'lblWillSend');
  }String get lblSendInstructions{
    return Intl.message('lblSendInstructions', name: 'lblSendInstructions');
  }String get lblCheckMail{
    return Intl.message('lblCheckMail', name: 'lblCheckMail');
  }String get lblEmailedYou{
    return Intl.message('lblEmailedYou', name: 'lblEmailedYou');
  }String get lblDidNot{
    return Intl.message('lblDidNot', name: 'lblDidNot');
  }String get lblCheckSpam{
    return Intl.message('lblCheckSpam', name: 'lblCheckSpam');
  }String get lblResendLink{
    return Intl.message('lblResendLink', name: 'lblResendLink');
  }String get lblResetPassword{
    return Intl.message('lblResetPassword', name: 'lblResetPassword');
  }String get lblRetypePassword{
    return Intl.message('lblRetypePassword', name: 'lblRetypePassword');
  }String get lblSignInToYour{
    return Intl.message('lblSignInToYour', name: 'lblSignInToYour');
  }String get lblEnterYour{
    return Intl.message('lblEnterYour', name: 'lblEnterYour');
  }String get lblIgtimaatiURL{
    return Intl.message('lblIgtimaatiURL', name: 'lblIgtimaatiURL');
  }String get lblContinue{
    return Intl.message('lblContinue', name: 'lblContinue');
  }String get lblLoginWith{
    return Intl.message('lblLoginWith', name: 'lblLoginWith');
  }String get lblLaunch{
    return Intl.message('lblLaunch', name: 'lblLaunch');
  }String get lblAlready{
    return Intl.message('lblAlready', name: 'lblAlready');
  }String get lblSignInFlow{
    return Intl.message('lblSignInFlow', name: 'lblSignInFlow');
  }String get lblNewUserFlow{
    return Intl.message('lblNewUserFlow', name: 'lblNewUserFlow');
  }String get lblOrgSearchFlow{
    return Intl.message('lblOrgSearchFlow', name: 'lblOrgSearchFlow');
  }String get lblWelcomeBackFlow{
    return Intl.message('lblWelcomeBackFlow', name: 'lblWelcomeBackFlow');
  }String get lblGoing{
    return Intl.message('lblGoing', name: 'lblGoing');
  }String get lblNotGoing{
    return Intl.message('lblNotGoing', name: 'lblNotGoing');
  }String get lblMayBe{
    return Intl.message('lblMayBe', name: 'lblMayBe');
  }String get lblOnGoing{
    return Intl.message('lblOnGoing', name: 'lblOnGoing');
  }String get lblPending{
    return Intl.message('lblPending', name: 'lblPending');
  }String get lblDraft{
    return Intl.message('lblDraft', name: 'lblDraft');
  }String get lblMeetings{
    return Intl.message('lblMeetings', name: 'lblMeetings');
  }String get lblMeeting{
    return Intl.message('lblMeeting', name: 'lblMeeting');
  }String get lblMyAgenda{
    return Intl.message('lblMyAgenda', name: 'lblMyAgenda');
  }String get lblUpcomingMeetings{
    return Intl.message('lblUpcomingMeetings', name: 'lblUpcomingMeetings');
  }String get lblBoardMeeting{
    return Intl.message('lblBoardMeeting', name: 'lblBoardMeeting');
  }String get lblHeadOffice{
    return Intl.message('lblHeadOffice', name: 'lblHeadOffice');
  }String get lblDevelopment{
    return Intl.message('lblDevelopment', name: 'lblDevelopment');
  }String get lblTalkingPoints{
    return Intl.message('lblTalkingPoints', name: 'lblTalkingPoints');
  }String get lblDesisions{
    return Intl.message('lblDesisions', name: 'lblDesisions');
  }String get lblActions{
    return Intl.message('lblActions', name: 'lblActions');
  }String get lblApprovals{
    return Intl.message('lblApprovals', name: 'lblApprovals');
  }String get lblScheduled{
    return Intl.message('lblScheduled', name: 'lblScheduled');
  }String get lblLive{
    return Intl.message('lblLive', name: 'lblLive');
  }String get lblDailyProductBoard{
    return Intl.message('lblDailyProductBoard', name: 'lblDailyProductBoard');
  }String get lblFilterBy{
    return Intl.message('lblFilterBy', name: 'lblFilterBy');
  }String get lblReset{
    return Intl.message('lblReset', name: 'lblReset');
  }String get lblAttendence{
    return Intl.message('lblAttendence', name: 'lblAttendence');
  }String get lblCommittee{
    return Intl.message('lblCommittee', name: 'lblCommittee');
  }String get lblStatus{
    return Intl.message('lblStatus', name: 'lblStatus');
  }String get lblRole{
    return Intl.message('lblRole', name: 'lblRole');
  }String get lblFilter{
    return Intl.message('lblFilter', name: 'lblFilter');
  }String get lblCreateMeeting{
    return Intl.message('lblCreateMeeting', name: 'lblCreateMeeting');
  }String get lblCancel{
    return Intl.message('lblCancel', name: 'lblCancel');
  }String get lblMeetingTitle{
    return Intl.message('lblMeetingTitle', name: 'lblMeetingTitle');
  }String get lblDescription{
    return Intl.message('lblDescription', name: 'lblDescription');
  }String get lblDate{
    return Intl.message('lblDate', name: 'lblDate');
  }String get lblDuration{
    return Intl.message('lblDuration', name: 'lblDuration');
  }String get lblLocation{
    return Intl.message('lblLocation', name: 'lblLocation');
  }String get lblSetAs{
    return Intl.message('lblSetAs', name: 'lblSetAs');
  }String get lblCreate{
    return Intl.message('lblCreate', name: 'lblCreate');
  }String get lblEditMeeting{
    return Intl.message('lblEditMeeting', name: 'lblEditMeeting');
  }String get lblChangeStatus{
    return Intl.message('lblChangeStatus', name: 'lblChangeStatus');
  }String get lblCanceled{
    return Intl.message('lblCanceled', name: 'lblCanceled');
  }
String get lblArchived{
    return Intl.message('lblArchived', name: 'lblArchived');
  }String get lblHomeLabel{
    return Intl.message('lblHomeLabel', name: 'lblHomeLabel');
  }String get lblAnalytic{
    return Intl.message('lblAnalytic', name: 'lblAnalytic');
  }String get lblNews{
    return Intl.message('lblNews', name: 'lblNews');
  }String get lblActivity{
    return Intl.message('lblActivity', name: 'lblActivity');
  }String get lblCalender{
    return Intl.message('lblCalender', name: 'lblCalender');
  }String get lblLibrary{
    return Intl.message('lblLibrary', name: 'lblLibrary');
  }String get lblIntegrations{
    return Intl.message('lblIntegrations', name: 'lblIntegrations');
  }String get lblSettings{
    return Intl.message('lblSettings', name: 'lblSettings');
  }String get lblOrganization{
    return Intl.message('lblOrganization', name: 'lblOrganization');
  }String get lblProfile{
    return Intl.message('lblProfile', name: 'lblProfile');
  }String get lblDashboardC{
    return Intl.message('lblDashboardC', name: 'lblDashboardC');
  }String get lblMeetingAgenda{
    return Intl.message('lblMeetingAgenda', name: 'lblMeetingAgenda');
  }String get lblJoinMeeting{
    return Intl.message('lblJoinMeeting', name: 'lblJoinMeeting');
  }String get lblParticipants{
    return Intl.message('lblParticipants', name: 'lblParticipants');
  }String get lblProfilee{
    return Intl.message('lblProfile', name: 'lblProfile');
  }String get lblOverview{
    return Intl.message('lblOverview', name: 'lblOverview');
  }String get lblWelcomeTo{
    return Intl.message('lblWelcomeTo', name: 'lblWelcomeTo');
  }String get lblCheckOut{
    return Intl.message('lblCheckOut', name: 'lblCheckOut');
  }String get lblSeeAll{
    return Intl.message('lblSeeAll', name: 'lblSeeAll');
  }String get lblLikes{
    return Intl.message('lblLikes', name: 'lblLikes');
  }String get lblComments{
    return Intl.message('lblComments', name: 'lblComments');
  }String get lblLiked{
    return Intl.message('lblLiked', name: 'lblLiked');
  }String get lblLike{
    return Intl.message('lblLike', name: 'lblLike');
  }String get lblWriteComments{
    return Intl.message('lblWriteComments', name: 'lblWriteComments');
  }String get lblSend{
    return Intl.message('lblSend', name: 'lblSend');
  }String get lblEditProfile{
    return Intl.message('lblEditProfile', name: 'lblEditProfile');
  }String get lblChangePassword{
    return Intl.message('lblChangePassword', name: 'lblChangePassword');
  }String get lblSecurity{
    return Intl.message('lblSecurity', name: 'lblSecurity');
  }String get lblSignOut{
    return Intl.message('lblSignOut', name: 'lblSignOut');
  }String get lblCurrentPassword{
    return Intl.message('lblCurrentPassword', name: 'lblCurrentPassword');
  }String get lblPleaseEnterPassword{
    return Intl.message('lblPleaseEnterPassword', name: 'lblPleaseEnterPassword');
  }String get lblPasswordNotLess{
    return Intl.message('lblPasswordNotLess', name: 'lblPasswordNotLess');
  }String get lblNewPassword{
    return Intl.message('lblNewPassword', name: 'lblNewPassword');
  }String get lblPasswordNotEqual{
    return Intl.message('lblPasswordNotEqual', name: 'lblPasswordNotEqual');
  }String get lblSaveChanges{
    return Intl.message('lblSaveChanges', name: 'lblSaveChanges');
  }String get lblName{
    return Intl.message('lblName', name: 'lblName');
  }String get lblPleaseEnterName{
    return Intl.message('lblPleaseEnterName', name: 'lblPleaseEnterName');
  }String get lblPosition{
    return Intl.message('lblPosition', name: 'lblPosition');
  }String get lblPhoneNumber{
    return Intl.message('lblPhoneNumber', name: 'lblPhoneNumber');
  }String get lblPleasePhoneNumber{
    return Intl.message('lblSaveChanges', name: 'lblPleasePhoneNumber');
  }String get lblDateOfBirth{
    return Intl.message('lblDateOfBirth', name: 'lblDateOfBirth');
  }String get lblEmailNot{
    return Intl.message('lblEmailNot', name: 'lblEmailNot');
  }String get lblPleaseEnterEmail{
    return Intl.message('lblPleaseEnterEmail', name: 'lblPleaseEnterEmail');
  }String get lblYouWillRecieve{
    return Intl.message('lblYouWillRecieve', name: 'lblYouWillRecieve');
  }String get lblTwoFactorAuthentication{
    return Intl.message('lblTwoFactorAuthentication', name: 'lblTwoFactorAuthentication');
  }String get lblAgenda{
    return Intl.message('lblAgenda', name: 'lblAgenda');
  }String get lblActivityS{
    return Intl.message('lblActivityS', name: 'lblActivityS');
  }String get lblNote{
    return Intl.message('lblNote', name: 'lblNote');
  }String get lblAddNote{
    return Intl.message('lblAddNote', name: 'lblAddNote');
  }String get lblWhatWill{
    return Intl.message('lblWhatWill', name: 'lblWhatWill');
  }String get lblGoingS{
    return Intl.message('lblGoingS', name: 'lblGoingS');
  }String get lblNotGoingS{
    return Intl.message('lblNotGoingS', name: 'lblNotGoingS');
  }String get lblMayBeS{
    return Intl.message('lblMayBeS', name: 'lblMayBeS');
  }String get lblPendingS{
    return Intl.message('lblPendingS', name: 'lblPendingS');
  }String get lblTellUs{
    return Intl.message('lblTellUs', name: 'lblTellUs');
  }String get lblpleaseEnterReason{
    return Intl.message('lblpleaseEnterReason', name: 'lblpleaseEnterReason');
  }String get lblShowTo{
    return Intl.message('lblShowTo', name: 'lblShowTo');
  }String get lblPresenter{
    return Intl.message('lblPresenter', name: 'lblPresenter');
  }String get lblAttachments{
    return Intl.message('lblAttachments', name: 'lblAttachments');
  }String get lblSupPoints{
    return Intl.message('lblSupPoints', name: 'lblSupPoints');
  }String get lblAssignedTo{
    return Intl.message('lblAssignedTo', name: 'lblAssignedTo');
  }String get lblOpenDate{
    return Intl.message('lblOpenDate', name: 'lblOpenDate');
  }String get lblMyDecisions{
    return Intl.message('lblMyDecisions', name: 'lblMyDecisions');
  }String get lblStatusReason{
    return Intl.message('lblStatusReason', name: 'lblStatusReason');
  }String get lblAnalysis{
    return Intl.message('lblAnalysis', name: 'lblAnalysis');
  }String get lblDecisions{
    return Intl.message('lblDecisions', name: 'lblDecisions');
  }String get lblMyDecision{
    return Intl.message('lblMyDecision', name: 'lblMyDecision');
  }String get lblConfirm{
    return Intl.message('lblConfirm', name: 'lblConfirm');
  }String get lblMyAction{
    return Intl.message('lblMyAction', name: 'lblMyAction');
  }String get lblCancels{
    return Intl.message('lblCancels', name: 'lblCancels');
  }String get lblOpenTill{
    return Intl.message('lblOpenTill', name: 'lblOpenTill');
  }String get lblProgress{
    return Intl.message('lblProgress', name: 'lblProgress');
  }String get lblPriority{
    return Intl.message('lblPriority', name: 'lblPriority');
  }String get lblGuests{
    return Intl.message('lblGuests', name: 'lblGuests');
  }String get lblComplete{
    return Intl.message('lblComplete', name: 'lblComplete');
  }String get lblInProgress{
    return Intl.message('lblInProgress', name: 'lblInProgress');
  }String get lblMin{
    return Intl.message('lblMin', name: 'lblMin');
  }
String get lblChange{
    return Intl.message('lblChange', name: 'lblChange');
  }String get lblApproved{
    return Intl.message('lblApproved', name: 'lblApproved');
  }String get lblRejected{
    return Intl.message('lblRejected', name: 'lblRejected');
  }String get lblAbstained{
    return Intl.message('lblAbstained', name: 'lblAbstained');
  }String get lblReason{
    return Intl.message('lblReason', name: 'lblReason');
  }String get lblNotComplete{
    return Intl.message('lblNotComplete', name: 'lblNotComplete');
  }String get lbTwoFactor{
    return Intl.message('lbTwoFactor', name: 'lbTwoFactor');
  }String get lbDidNot{
    return Intl.message('lbDidNot', name: 'lbDidNot');
  }String get lbCheckYourSpam{
    return Intl.message('lbCheckYourSpam', name: 'lbCheckYourSpam');
  }

}

class SpecificLocalizationDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  final Locale overriddenLocale;

  SpecificLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  Future<AppLocalizations> load(Locale locale) =>
      AppLocalizations.load(overriddenLocale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => true;
}

class FallbackCupertinoLocalisationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<CupertinoLocalizations> load(Locale locale) => SynchronousFuture<_DefaultCupertinoLocalizations>(_DefaultCupertinoLocalizations(locale));

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}

class _DefaultCupertinoLocalizations extends DefaultCupertinoLocalizations {
  final Locale locale;
  
  _DefaultCupertinoLocalizations(this.locale);

 
}
