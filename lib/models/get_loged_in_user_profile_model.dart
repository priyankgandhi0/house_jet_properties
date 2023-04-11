
import 'dart:convert';

GetLogedInUserProfile getLogedInUserProfileFromJson(String str) => GetLogedInUserProfile.fromJson(json.decode(str));

String getLogedInUserProfileToJson(GetLogedInUserProfile data) => json.encode(data.toJson());

class GetLogedInUserProfile {
  GetLogedInUserProfile({
    this.success,
    this.user,
  });

  bool? success;
  UserData? user;

  factory GetLogedInUserProfile.fromJson(Map<String, dynamic> json) => GetLogedInUserProfile(
    success: json["success"],
    user: UserData.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "user": user!.toJson(),
  };
}

class UserData {
  UserData({
    this.id,
    this.username,
    this.email,
    this.pEmail,
    this.ccEmail,
    this.firstname,
    this.lastname,
    this.alias,
    this.typeId,
    this.notifications,
    this.loginNotifications,
    this.nEmail,
    this.nPhone,
    this.cPhone,
    this.cPhoneExt,
    this.activationKey,
    this.status,
    this.loginTime,
    this.lastActivity,
    this.created,
    this.modified,
    this.emailSignature,
    this.imageExt,
    this.logoExt,
    this.lowMinuteThreshold,
    this.lowMinuteEmailSent,
    this.emailLastCheck,
    this.timezone,
    this.availablePostcards4X6,
    this.availablePostcards6X9,
    this.synced411Program,
    this.adSetup,
    this.marketingBalance,
    this.profileSetup,
    this.gci,
    this.appointmentLink,
    this.frontpageBanner,
    this.youtubeImage,
    this.sendInboxSmsAlert,
    this.desiredAnnualIncome,
    this.averageSalesPrice,
    this.averageCommissionPerc,
    this.netCommissionPerc,
    this.themeColor,
    this.dontAskGoals,
    this.pinLogin,
    this.pinLoginMethod,
    this.pinCurrent,
    this.cfEnabled,
    this.cfPlan,
    this.cfPlanAdded,
    this.cfPlanRenewed,
    this.cfMinutesRenewable,
    this.cfMinutesBought,
    this.orderLeadListBy,
    this.defaultLeadListView,
    this.orderLeadListOrdering,
    this.leadAcceptance,
    this.orderTaskListBy,
    this.orderTaskListOrdering,
    this.addSignatureToEmails,
    this.autoCallTask,
    this.useNewMenu,
    this.useNewLeadProfile,
    this.useNewDashboard,
    this.bio,
    this.facebookUrl,
    this.twitterUrl,
    this.linkedIn,
    this.youtubeUrl,
    this.googleplusUrl,
    this.instagramUrl,
    this.mtlsEmails,
    this.groupId,
    this.craigslistBoard,
    this.craigslistAddSignature,
    this.craigslistEmail,
    this.allNewLeadsNotifications,
    this.allNewLeadsNotificationsMethod,
    this.licenseNumber,
    this.dailyAgentActivityReport,
    this.weeklyAgentActivityReport,
    this.displayEmailsInConversations,
    this.onVacation,
    this.defaultSendReminder,
    this.defaultSendReminderOn,
    this.moneyScoreEnabled,
    this.defaultMoneyScorePeriod,
    this.defaultMoneyScoreTeams,
    this.homePageVideo,
    this.saveSearchFeatured,
    this.sendDailyDialerReport,
    this.sendWeeklyDialerReport,
    this.defaultReminderSequence,
    this.taskListDefaultFilter,
    this.productionManagerId,
    this.company,
    this.mailingAddress,
    this.mailingZip,
    this.mailingState,
    this.mailingCity,
    this.country,
    this.dialerDefaultMusic,
    this.dialerConnectedChime,
    this.displayOnFrontpage,
    this.isaHybrid,
    this.loginFirstPage,
    this.coachingStarted,
    this.augmentationRequests,
    this.augmentEnabled,
    this.ignoreMissingVoiceMail,
    this.dashboardSettings,
    this.externalId,
    this.dailyRegisteredLeadsReport,
    this.craigslistShowLogo,
    this.meetAgentText,
    this.mainMenuLoc,
    this.viewedWelcome,
    this.emailProviderId,
    this.emailUsername,
    this.emailAuthMode,
    this.emailPassword,
    this.imapServerUrl,
    this.imapServerPort,
    this.imapServerSecurity,
    this.smtpServerUrl,
    this.smtpServerPort,
    this.smtpServerSecurity,
    this.supportChart,
    this.w9OnFile,
    this.agreedToAffiliateTos,
    this.referrerSiteId,
    this.referrerAgentId,
    this.textLogo,
    this.mobileAgentPhoto,
    this.customAboutImage,
    this.taskFollowupText,
    this.newTaskNotifications,
    this.newTaskNotificationMethod,
    this.voicemail,
    this.voicemailGreeting,
    this.voicemailNotify,
    this.taskCallEnabled,
    this.taskCallRecording,
    this.appointmentReport,
    this.appointmentReportDate,
    this.profileImageId,
    this.logoImageId,
    this.dashboardWidgets,
    this.brokerageUrl,
    this.realtorUrl,
    this.bbbUrl,
    this.yelpUrl,
    this.googlePlace,
    this.personalUrl,
    this.otherUrl,
    this.houseJetMembership,
    this.theme,
    this.wizardFinish,
    this.websiteSetupPending,
    this.zipcode,
    this.superadminLogged,
    this.superDeveloperLogged,
    this.logoUrl,
    this.profileUrl,
    this.client,
    this.textPhoneNumber,
    this.siteId,
    this.fullName,

    this.isCrmAgent,
    this.role,
    this.superAdmin,
    this.superDeveloper,
  });

  int? id;
  String?username;
  String?email;
  String?pEmail;
  String?ccEmail;
  String?firstname;
  String?lastname;
  String? alias;
  int? typeId;
  String? notifications;
  String? loginNotifications;
  String? nEmail;
  String? nPhone;
  String? cPhone;
  String? cPhoneExt;
  String? activationKey;
  String? status;
  DateTime? loginTime;
  DateTime? lastActivity;
  DateTime? created;
  DateTime? modified;
  String? emailSignature;
  String? imageExt;
  String? logoExt;
  int? lowMinuteThreshold;
  dynamic lowMinuteEmailSent;
  dynamic emailLastCheck;
  String? timezone;
  int? availablePostcards4X6;
  int? availablePostcards6X9;
  String? synced411Program;
  String? adSetup;
  String? marketingBalance;
  dynamic profileSetup;
  int? gci;
  String? appointmentLink;
  String? frontpageBanner;
  String? youtubeImage;
  String? sendInboxSmsAlert;
  int? desiredAnnualIncome;
  int? averageSalesPrice;
  String? averageCommissionPerc;
  String? netCommissionPerc;
  String? themeColor;
  String? dontAskGoals;
  String? pinLogin;
  String? pinLoginMethod;
  int? pinCurrent;
  String? cfEnabled;
  int? cfPlan;
  dynamic cfPlanAdded;
  dynamic cfPlanRenewed;
  int? cfMinutesRenewable;
  int? cfMinutesBought;
  String? orderLeadListBy;
  String? defaultLeadListView;
  String? orderLeadListOrdering;
  String? leadAcceptance;
  String? orderTaskListBy;
  String? orderTaskListOrdering;
  String? addSignatureToEmails;
  String? autoCallTask;
  String? useNewMenu;
  String? useNewLeadProfile;
  String? useNewDashboard;
  String? bio;
  String? facebookUrl;
  String? twitterUrl;
  String? linkedIn;
  String? youtubeUrl;
  String? googleplusUrl;
  String? instagramUrl;
  String? mtlsEmails;
  int? groupId;
  String? craigslistBoard;
  String? craigslistAddSignature;
  String? craigslistEmail;
  String? allNewLeadsNotifications;
  String? allNewLeadsNotificationsMethod;
  String? licenseNumber;
  String? dailyAgentActivityReport;
  String? weeklyAgentActivityReport;
  String? displayEmailsInConversations;
  String? onVacation;
  String? defaultSendReminder;
  String? defaultSendReminderOn;
  String? moneyScoreEnabled;
  String? defaultMoneyScorePeriod;
  String? defaultMoneyScoreTeams;
  String? homePageVideo;
  int? saveSearchFeatured;
  String? sendDailyDialerReport;
  String? sendWeeklyDialerReport;
  int? defaultReminderSequence;
  dynamic taskListDefaultFilter;
  int? productionManagerId;
  String? company;
  String? mailingAddress;
  String? mailingZip;
  String? mailingState;
  String? mailingCity;
  String? country;
  String? dialerDefaultMusic;
  String? dialerConnectedChime;
  String? displayOnFrontpage;
  String? isaHybrid;
  String? loginFirstPage;
  dynamic coachingStarted;
  int? augmentationRequests;
  String? augmentEnabled;
  String? ignoreMissingVoiceMail;
  dynamic dashboardSettings;
  String? externalId;
  String? dailyRegisteredLeadsReport;
  dynamic craigslistShowLogo;
  dynamic meetAgentText;
  String? mainMenuLoc;
  String? viewedWelcome;
  int? emailProviderId;
  String? emailUsername;
  String? emailAuthMode;
  String? emailPassword;
  String? imapServerUrl;
  int? imapServerPort;
  String? imapServerSecurity;
  String? smtpServerUrl;
  int? smtpServerPort;
  String? smtpServerSecurity;
  String? supportChart;
  String? w9OnFile;
  String? agreedToAffiliateTos;
  dynamic referrerSiteId;
  dynamic referrerAgentId;
  String? textLogo;
  String? mobileAgentPhoto;
  String? customAboutImage;
  String? taskFollowupText;
  String? newTaskNotifications;
  String? newTaskNotificationMethod;
  String? voicemail;
  int? voicemailGreeting;
  String? voicemailNotify;
  String? taskCallEnabled;
  String? taskCallRecording;
  String? appointmentReport;
  dynamic appointmentReportDate;
  dynamic profileImageId;
  dynamic logoImageId;
  dynamic dashboardWidgets;
  String? brokerageUrl;
  String? realtorUrl;
  String? bbbUrl;
  String? yelpUrl;
  String? googlePlace;
  String? personalUrl;
  String? otherUrl;
  dynamic houseJetMembership;
  String? theme;
  int? wizardFinish;
  bool? websiteSetupPending;
  String? zipcode;
  dynamic superadminLogged;
  dynamic superDeveloperLogged;
  String? logoUrl;
  String? profileUrl;
  Client? client;
  String? textPhoneNumber;
  String? siteId;
  String? fullName;

  bool? isCrmAgent;
  String? role;
  bool? superAdmin;
  bool? superDeveloper;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    pEmail: json["p_email"],
    ccEmail: json["cc_email"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    alias: json["alias"],
    typeId: json["type_id"],
    notifications: json["notifications"],
    loginNotifications: json["login_notifications"],
    nEmail: json["n_email"],
    nPhone: json["n_phone"],
    cPhone: json["c_phone"],
    cPhoneExt: json["c_phone_ext"],
    activationKey: json["activation_key"],
    status: json["status"],
    loginTime: DateTime.parse(json["login_time"]),
    lastActivity: DateTime.parse(json["last_activity"]),
    created: DateTime.parse(json["created"]),
    modified: DateTime.parse(json["modified"]),
    emailSignature: json["email_signature"],
    imageExt: json["image_ext"],
    logoExt: json["logo_ext"],
    lowMinuteThreshold: json["low_minute_threshold"],
    lowMinuteEmailSent: json["low_minute_email_sent"],
    emailLastCheck: json["email_last_check"],
    timezone: json["timezone"],
    availablePostcards4X6: json["available_postcards_4x6"],
    availablePostcards6X9: json["available_postcards_6x9"],
    synced411Program: json["synced_411_program"],
    adSetup: json["ad_setup"],
    marketingBalance: json["marketing_balance"],
    profileSetup: json["profile_setup"],
    gci: json["gci"],
    appointmentLink: json["appointment_link"],
    frontpageBanner: json["frontpage_banner"],
    youtubeImage: json["youtube_image"],
    sendInboxSmsAlert: json["send_inbox_sms_alert"],
    desiredAnnualIncome: json["desired_annual_income"],
    averageSalesPrice: json["average_sales_price"],
    averageCommissionPerc: json["average_commission_perc"],
    netCommissionPerc: json["net_commission_perc"],
    themeColor: json["theme_color"],
    dontAskGoals: json["dont_ask_goals"],
    pinLogin: json["pin_login"],
    pinLoginMethod: json["pin_login_method"],
    pinCurrent: json["pin_current"],
    cfEnabled: json["cf_enabled"],
    cfPlan: json["cf_plan"],
    cfPlanAdded: json["cf_plan_added"],
    cfPlanRenewed: json["cf_plan_renewed"],
    cfMinutesRenewable: json["cf_minutes_renewable"],
    cfMinutesBought: json["cf_minutes_bought"],
    orderLeadListBy: json["order_lead_list_by"],
    defaultLeadListView: json["default_lead_list_view"],
    orderLeadListOrdering: json["order_lead_list_ordering"],
    leadAcceptance: json["lead_acceptance"],
    orderTaskListBy: json["order_task_list_by"],
    orderTaskListOrdering: json["order_task_list_ordering"],
    addSignatureToEmails: json["add_signature_to_emails"],
    autoCallTask: json["auto_call_task"],
    useNewMenu: json["use_new_menu"],
    useNewLeadProfile: json["use_new_lead_profile"],
    useNewDashboard: json["use_new_dashboard"],
    bio: json["bio"],
    facebookUrl: json["facebook_url"],
    twitterUrl: json["twitter_url"],
    linkedIn: json["linked_in"],
    youtubeUrl: json["youtube_url"],
    googleplusUrl: json["googleplus_url"],
    instagramUrl: json["instagram_url"],
    mtlsEmails: json["mtls_emails"],
    groupId: json["group_id"],
    craigslistBoard: json["craigslist_board"],
    craigslistAddSignature: json["craigslist_add_signature"],
    craigslistEmail: json["craigslist_email"],
    allNewLeadsNotifications: json["all_new_leads_notifications"],
    allNewLeadsNotificationsMethod: json["all_new_leads_notifications_method"],
    licenseNumber: json["license_number"],
    dailyAgentActivityReport: json["daily_agent_activity_report"],
    weeklyAgentActivityReport: json["weekly_agent_activity_report"],
    displayEmailsInConversations: json["display_emails_in_conversations"],
    onVacation: json["on_vacation"],
    defaultSendReminder: json["default_send_reminder"],
    defaultSendReminderOn: json["default_send_reminder_on"],
    moneyScoreEnabled: json["money_score_enabled"],
    defaultMoneyScorePeriod: json["default_money_score_period"],
    defaultMoneyScoreTeams: json["default_money_score_teams"],
    homePageVideo: json["home_page_video"],
    saveSearchFeatured: json["save_search_featured"],
    sendDailyDialerReport: json["send_daily_dialer_report"],
    sendWeeklyDialerReport: json["send_weekly_dialer_report"],
    defaultReminderSequence: json["default_reminder_sequence"],
    taskListDefaultFilter: json["task_list_default_filter"],
    productionManagerId: json["production_manager_id"],
    company: json["company"],
    mailingAddress: json["mailing_address"],
    mailingZip: json["mailing_zip"],
    mailingState: json["mailing_state"],
    mailingCity: json["mailing_city"],
    country: json["country"],
    dialerDefaultMusic: json["dialer_default_music"],
    dialerConnectedChime: json["dialer_connected_chime"],
    displayOnFrontpage: json["display_on_frontpage"],
    isaHybrid: json["isa_hybrid"],
    loginFirstPage: json["login_first_page"],
    coachingStarted: json["coaching_started"],
    augmentationRequests: json["augmentation_requests"],
    augmentEnabled: json["augment_enabled"],
    ignoreMissingVoiceMail: json["ignore_missing_voice_mail"],
    dashboardSettings: json["dashboard_settings"],
    externalId: json["external_id"],
    dailyRegisteredLeadsReport: json["daily_registered_leads_report"],
    craigslistShowLogo: json["craigslist_show_logo"],
    meetAgentText: json["meet_agent_text"],
    mainMenuLoc: json["main_menu_loc"],
    viewedWelcome: json["viewed_welcome"],
    emailProviderId: json["email_provider_id"],
    emailUsername: json["email_username"],
    emailAuthMode: json["email_auth_mode"],
    emailPassword: json["email_password"],
    imapServerUrl: json["imap_server_url"],
    imapServerPort: json["imap_server_port"],
    imapServerSecurity: json["imap_server_security"],
    smtpServerUrl: json["smtp_server_url"],
    smtpServerPort: json["smtp_server_port"],
    smtpServerSecurity: json["smtp_server_security"],
    supportChart: json["support_chart"],
    w9OnFile: json["w9_on_file"],
    agreedToAffiliateTos: json["agreed_to_affiliate_tos"],
    referrerSiteId: json["referrer_site_id"],
    referrerAgentId: json["referrer_agent_id"],
    textLogo: json["text_logo"],
    mobileAgentPhoto: json["mobile_agent_photo"],
    customAboutImage: json["custom_about_image"],
    taskFollowupText: json["task_followup_text"],
    newTaskNotifications: json["new_task_notifications"],
    newTaskNotificationMethod: json["new_task_notification_method"],
    voicemail: json["voicemail"],
    voicemailGreeting: json["voicemail_greeting"],
    voicemailNotify: json["voicemail_notify"],
    taskCallEnabled: json["task_call_enabled"],
    taskCallRecording: json["task_call_recording"],
    appointmentReport: json["appointment_report"],
    appointmentReportDate: json["appointment_report_date"],
    profileImageId: json["profile_image_id"],
    logoImageId: json["logo_image_id"],
    dashboardWidgets: json["dashboard_widgets"],
    brokerageUrl: json["brokerage_url"],
    realtorUrl: json["realtor_url"],
    bbbUrl: json["bbb_url"],
    yelpUrl: json["yelp_url"],
    googlePlace: json["google_place"],
    personalUrl: json["personal_url"],
    otherUrl: json["other_url"],
    houseJetMembership: json["house_jet_membership"],
    theme: json["theme"],
    wizardFinish: json["wizard_finish"],
    websiteSetupPending: json["website_setup_pending"],
    zipcode: json["zipcode"],
    superadminLogged: json["SuperadminLogged"],
    superDeveloperLogged: json["SuperDeveloperLogged"],
    logoUrl: json["logoUrl"],
    profileUrl: json["profileUrl"],
    client: Client.fromJson(json["client"]),
    textPhoneNumber: json["text_phone_number"],
    siteId: json["site_id"],
    fullName: json["full_name"],

    isCrmAgent: json["is_crm_agent"],
    role: json["role"],
    superAdmin: json["super_admin"],
    superDeveloper: json["super_developer"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "p_email": pEmail,
    "cc_email": ccEmail,
    "firstname": firstname,
    "lastname": lastname,
    "alias": alias,
    "type_id": typeId,
    "notifications": notifications,
    "login_notifications": loginNotifications,
    "n_email": nEmail,
    "n_phone": nPhone,
    "c_phone": cPhone,
    "c_phone_ext": cPhoneExt,
    "activation_key": activationKey,
    "status": status,
    "login_time": loginTime!.toIso8601String(),
    "last_activity": lastActivity!.toIso8601String(),
    "created": created!.toIso8601String(),
    "modified": modified!.toIso8601String(),
    "email_signature": emailSignature,
    "image_ext": imageExt,
    "logo_ext": logoExt,
    "low_minute_threshold": lowMinuteThreshold,
    "low_minute_email_sent": lowMinuteEmailSent,
    "email_last_check": emailLastCheck,
    "timezone": timezone,
    "available_postcards_4x6": availablePostcards4X6,
    "available_postcards_6x9": availablePostcards6X9,
    "synced_411_program": synced411Program,
    "ad_setup": adSetup,
    "marketing_balance": marketingBalance,
    "profile_setup": profileSetup,
    "gci": gci,
    "appointment_link": appointmentLink,
    "frontpage_banner": frontpageBanner,
    "youtube_image": youtubeImage,
    "send_inbox_sms_alert": sendInboxSmsAlert,
    "desired_annual_income": desiredAnnualIncome,
    "average_sales_price": averageSalesPrice,
    "average_commission_perc": averageCommissionPerc,
    "net_commission_perc": netCommissionPerc,
    "theme_color": themeColor,
    "dont_ask_goals": dontAskGoals,
    "pin_login": pinLogin,
    "pin_login_method": pinLoginMethod,
    "pin_current": pinCurrent,
    "cf_enabled": cfEnabled,
    "cf_plan": cfPlan,
    "cf_plan_added": cfPlanAdded,
    "cf_plan_renewed": cfPlanRenewed,
    "cf_minutes_renewable": cfMinutesRenewable,
    "cf_minutes_bought": cfMinutesBought,
    "order_lead_list_by": orderLeadListBy,
    "default_lead_list_view": defaultLeadListView,
    "order_lead_list_ordering": orderLeadListOrdering,
    "lead_acceptance": leadAcceptance,
    "order_task_list_by": orderTaskListBy,
    "order_task_list_ordering": orderTaskListOrdering,
    "add_signature_to_emails": addSignatureToEmails,
    "auto_call_task": autoCallTask,
    "use_new_menu": useNewMenu,
    "use_new_lead_profile": useNewLeadProfile,
    "use_new_dashboard": useNewDashboard,
    "bio": bio,
    "facebook_url": facebookUrl,
    "twitter_url": twitterUrl,
    "linked_in": linkedIn,
    "youtube_url": youtubeUrl,
    "googleplus_url": googleplusUrl,
    "instagram_url": instagramUrl,
    "mtls_emails": mtlsEmails,
    "group_id": groupId,
    "craigslist_board": craigslistBoard,
    "craigslist_add_signature": craigslistAddSignature,
    "craigslist_email": craigslistEmail,
    "all_new_leads_notifications": allNewLeadsNotifications,
    "all_new_leads_notifications_method": allNewLeadsNotificationsMethod,
    "license_number": licenseNumber,
    "daily_agent_activity_report": dailyAgentActivityReport,
    "weekly_agent_activity_report": weeklyAgentActivityReport,
    "display_emails_in_conversations": displayEmailsInConversations,
    "on_vacation": onVacation,
    "default_send_reminder": defaultSendReminder,
    "default_send_reminder_on": defaultSendReminderOn,
    "money_score_enabled": moneyScoreEnabled,
    "default_money_score_period": defaultMoneyScorePeriod,
    "default_money_score_teams": defaultMoneyScoreTeams,
    "home_page_video": homePageVideo,
    "save_search_featured": saveSearchFeatured,
    "send_daily_dialer_report": sendDailyDialerReport,
    "send_weekly_dialer_report": sendWeeklyDialerReport,
    "default_reminder_sequence": defaultReminderSequence,
    "task_list_default_filter": taskListDefaultFilter,
    "production_manager_id": productionManagerId,
    "company": company,
    "mailing_address": mailingAddress,
    "mailing_zip": mailingZip,
    "mailing_state": mailingState,
    "mailing_city": mailingCity,
    "country": country,
    "dialer_default_music": dialerDefaultMusic,
    "dialer_connected_chime": dialerConnectedChime,
    "display_on_frontpage": displayOnFrontpage,
    "isa_hybrid": isaHybrid,
    "login_first_page": loginFirstPage,
    "coaching_started": coachingStarted,
    "augmentation_requests": augmentationRequests,
    "augment_enabled": augmentEnabled,
    "ignore_missing_voice_mail": ignoreMissingVoiceMail,
    "dashboard_settings": dashboardSettings,
    "external_id": externalId,
    "daily_registered_leads_report": dailyRegisteredLeadsReport,
    "craigslist_show_logo": craigslistShowLogo,
    "meet_agent_text": meetAgentText,
    "main_menu_loc": mainMenuLoc,
    "viewed_welcome": viewedWelcome,
    "email_provider_id": emailProviderId,
    "email_username": emailUsername,
    "email_auth_mode": emailAuthMode,
    "email_password": emailPassword,
    "imap_server_url": imapServerUrl,
    "imap_server_port": imapServerPort,
    "imap_server_security": imapServerSecurity,
    "smtp_server_url": smtpServerUrl,
    "smtp_server_port": smtpServerPort,
    "smtp_server_security": smtpServerSecurity,
    "support_chart": supportChart,
    "w9_on_file": w9OnFile,
    "agreed_to_affiliate_tos": agreedToAffiliateTos,
    "referrer_site_id": referrerSiteId,
    "referrer_agent_id": referrerAgentId,
    "text_logo": textLogo,
    "mobile_agent_photo": mobileAgentPhoto,
    "custom_about_image": customAboutImage,
    "task_followup_text": taskFollowupText,
    "new_task_notifications": newTaskNotifications,
    "new_task_notification_method": newTaskNotificationMethod,
    "voicemail": voicemail,
    "voicemail_greeting": voicemailGreeting,
    "voicemail_notify": voicemailNotify,
    "task_call_enabled": taskCallEnabled,
    "task_call_recording": taskCallRecording,
    "appointment_report": appointmentReport,
    "appointment_report_date": appointmentReportDate,
    "profile_image_id": profileImageId,
    "logo_image_id": logoImageId,
    "dashboard_widgets": dashboardWidgets,
    "brokerage_url": brokerageUrl,
    "realtor_url": realtorUrl,
    "bbb_url": bbbUrl,
    "yelp_url": yelpUrl,
    "google_place": googlePlace,
    "personal_url": personalUrl,
    "other_url": otherUrl,
    "house_jet_membership": houseJetMembership,
    "theme": theme,
    "wizard_finish": wizardFinish,
    "website_setup_pending": websiteSetupPending,
    "zipcode": zipcode,
    "SuperadminLogged": superadminLogged,
    "SuperDeveloperLogged": superDeveloperLogged,
    "logoUrl": logoUrl,
    "profileUrl": profileUrl,
    "client": client!.toJson(),
    "text_phone_number": textPhoneNumber,
    "site_id": siteId,
    "full_name": fullName,

    "is_crm_agent": isCrmAgent,
    "role": role,
    "super_admin": superAdmin,
    "super_developer": superDeveloper,
  };
}

class Client {
  Client({
    this.id,
    this.managementSystemId,
    this.firstName,
    this.lastName,
    this.displayName,
    this.meetOwnerName,
    this.emailName,
    this.companyName,
    this.emailId,
    this.address,
    this.city,
    this.state,
    this.stateAbbr,
    this.country,
    this.zipcode,
    this.phone,
    this.officeNumber,
    this.cellphone,
    this.domain,
    this.secure,
    this.plan,
    this.nextBillingDate,
    this.siteLiveDate,
    this.dbHost,
    this.dbName,
    this.dbUser,
    this.dbPassword,
    this.retsUrl,
    this.retsUser,
    this.retsPassword,
    this.status,
    this.created,
    this.modified,
    this.retsId,
    this.retsSuperFeedId,
    this.retsFeedQueryParameterSetId,
    this.retsUpdated,
    this.retsRemoved,
    this.cronsActive,
    this.copyRight,
    this.imCode,
    this.landingPageInfo,
    this.facebookUrl,
    this.linkedIn,
    this.twitterUrl,
    this.youtubeUrl,
    this.googleplusUrl,
    this.instagramUrl,
    this.testimonialVideoUrl,
    this.ownerVideoSrc,
    this.toEmail,
    this.fromEmail,
    this.bccEmail,
    this.supportEmail,
    this.searchText,
    this.mlsDetails,
    this.mlsCopyright,
    this.contact,
    this.fax,
    this.discount,
    this.retsState,
    this.landingPageDetails,
    this.landingPageText,
    this.footerDetails,
    this.defaultSearchTypeId,
    this.defaultSearchTypeSubType,
    this.actionCall5,
    this.additionalContactInfoLeft,
    this.mortgageContactInfo,
    this.webSystemStatus,
    this.landingSeoText,
    this.displayLastUpdateTime,
    this.idxLogo,
    this.tzOffset,
    this.headTrackingCode,
    this.headConversionCode,
    this.bodyTrackingCode,
    this.bodyConversionCode,
    this.googleSiteVerify,
    this.callfireEnabled,
    this.listAgentEnabled,
    this.coListFirmAgentEnabled,
    this.searchOptions,
    this.cfMinutesRenewable,
    this.cfMinutesBought,
    this.cfPlan,
    this.cfPlanAdded,
    this.cfPlanRenewed,
    this.zipCodeSearchName,
    this.searchResultsLimitedTo,
    this.homeAreasCustom,
    this.priceRangeHomeFrom,
    this.priceRangeHomeTo,
    this.priceRangeAreaFrom,
    this.priceRangeAreaTo,
    this.officeNumInOfficesList,
    this.landAcreageOptions,
    this.pinLogin,
    this.voiceBlastsEnabled,
    this.lat,
    this.lon,
    this.oldLeadsPerDay,
    this.oldLeadsDay,
    this.oldLeadsTimes,
    this.propertyFilters,
    this.registrationPropertyViewLimit,
    this.paymentStatus,
    this.payStatusChange,
    this.colorTheme,
    this.customSlider,
    this.displayStatusActive,
    this.hideForeclosureInfo,
    this.displayAdminBtn,
    this.displayRenterBtn,
    this.seoCustomTitle,
    this.turnOffBrandbarSettings,
    this.searchHeaderText,
    this.logoOnLandingPage,
    this.canDefineTags,
    this.accountIdFacebook,
    this.zillowTechConnectEnabled,
    this.accountIdAdwords,
    this.allowBotsViewProperties,
    this.siteName,
    this.postcardsServicesStatus,
    this.availablePostcards4X6,
    this.availablePostcards6X9,
    this.availablePostcardsArea,
    this.monthlyBudget,
    this.monthlyLeadLimit,
    this.testMode,
    this.displayPropertyStatus,
    this.infusionEnabled,
    this.infusionActivationKey,
    this.infusionAuthUrl,
    this.sendAgentNewsletter,
    this.sendOnlyNewListingsInAlert,
    this.sendEmailAlerts,
    this.usertypeBlastsDisabled,
    this.agentsCanDefineTheirAreas,
    this.manageRepId,
    this.useZipcodesFromProperties,
    this.mergeSubtypeSearch,
    this.textPhoneNumber,
    this.textSenderPhoneNumber,
    this.listFirmEnabled,
    this.showMtlsLeadsInTrafficReport,
    this.fileServer,
    this.craigslistPosterEnabled,
    this.mapSearchEnabled,
    this.mapSearchCenterLat,
    this.mapSearchCenterLng,
    this.mapCoordinatesPriorityProvider,
    this.moneyScoreEnabled,
    this.dialerThreadsNumber,
    this.mapCoordinatesFromFeed,
    this.gender,
    this.apiAuthKey,
    this.apiAuthIp,
    this.sendDripCampaigns,
    this.sendPropertyAlerts,
    this.sendSpecialOffers,
    this.testimonialsBoxText,
    this.agentNumInAgentsList,
    this.landAreaUnits,
    this.displaysAllBathsCount,
    this.dialerType,
    this.emailServerSettingId,
    this.sellerCounselingInterview,
    this.customPrimaryPhotoFileId,
    this.source,
    this.displayBillingSettings,
    this.redirectAfterBillingFailed,
    this.exportLeadsApi,
    this.clientStageId,
    this.trainingStarted,
    this.marketingManagerId,
    this.homeValuesPageVersion,
    this.adminNotificationFromNumber,
    this.assignLeadflowLeads,
    this.infusionsoftId,
    this.augmentationSystemEnabled,
    this.augmentationRequests,
    this.vulcanApi,
    this.vulcanKey,
    this.vulcanLastRun,
    this.areasSettings,
    this.canceled,
    this.squeezeEnabled,
    this.redxBudget,
    this.augmentBudget,
    this.marketingZips,
    this.cancelizationDate,
    this.category,
    this.lowMinuteThreshold,
    this.lowMinuteEmailSent,
    this.expertDataId,
    this.supportRepId,
    this.hubspotId,
    this.analyticsSiteId,
    this.purged,
    this.referrerSiteId,
    this.referrerAgentId,
    this.activeAffiliate,
    this.affiliatePayoutPercentage,
    this.twilioSid,
    this.twilioToken,
    this.twilioAppSid,
    this.twilioDialerPhone,
    this.isaClient,
    //this.isaLeadCutoff,
    this.billingStatus,
    this.onboardRepId,
    this.isaHotTransfer,
    this.apptCallPhoneNumber,
    this.lisaEnabled,
    this.platform,
    this.emailDomain,
    this.backendDomain,
    this.pixelId,
    this.isaPoolLeads,
    this.allowCreatingAccounts,
    this.currentDomain,
    this.isDomainAlias,
    this.googleConversion,
    this.facebookConversion,
    this.domainTheme,
    this.defaultRoute,
    this.domainAdminId,
    this.domainFrontendType,
    this.domainAliasId,
    this.themeData,
  });

  String? id;
  String? managementSystemId;
  String? firstName;
  String? lastName;
  String? displayName;
  String? meetOwnerName;
  String? emailName;
  String? companyName;
  String? emailId;
  String? address;
  String? city;
  String? state;
  String? stateAbbr;
  String? country;
  String? zipcode;
  String? phone;
  String? officeNumber;
  String? cellphone;
  String? domain;
  String? secure;
  String? plan;
  String? nextBillingDate;
  String? siteLiveDate;
  String? dbHost;
  String? dbName;
  String? dbUser;
  String? dbPassword;
  String? retsUrl;
  String? retsUser;
  String? retsPassword;
  String? status;
  DateTime? created;
  DateTime? modified;
  String? retsId;
  String? retsSuperFeedId;
  String? retsFeedQueryParameterSetId;
  dynamic retsUpdated;
  dynamic retsRemoved;
  String? cronsActive;
  String? copyRight;
  String? imCode;
  String? landingPageInfo;
  String? facebookUrl;
  String? linkedIn;
  String? twitterUrl;
  String? youtubeUrl;
  String? googleplusUrl;
  String? instagramUrl;
  String? testimonialVideoUrl;
  String? ownerVideoSrc;
  String? toEmail;
  String? fromEmail;
  String? bccEmail;
  String? supportEmail;
  String? searchText;
  String? mlsDetails;
  String? mlsCopyright;
  String? contact;
  String? fax;
  String? discount;
  String? retsState;
  String? landingPageDetails;
  String? landingPageText;
  String? footerDetails;
  String? defaultSearchTypeId;
  String? defaultSearchTypeSubType;
  String? actionCall5;
  String? additionalContactInfoLeft;
  String? mortgageContactInfo;
  String? webSystemStatus;
  String? landingSeoText;
  String? displayLastUpdateTime;
  String? idxLogo;
  String? tzOffset;
  String? headTrackingCode;
  String? headConversionCode;
  String? bodyTrackingCode;
  String? bodyConversionCode;
  String? googleSiteVerify;
  String? callfireEnabled;
  String? listAgentEnabled;
  String? coListFirmAgentEnabled;
  String? searchOptions;
  String? cfMinutesRenewable;
  String? cfMinutesBought;
  dynamic cfPlan;
  dynamic cfPlanAdded;
  dynamic cfPlanRenewed;
  String?zipCodeSearchName;
  String?searchResultsLimitedTo;
  String?homeAreasCustom;
  dynamic priceRangeHomeFrom;
  dynamic priceRangeHomeTo;
  dynamic priceRangeAreaFrom;
  dynamic priceRangeAreaTo;
  String? officeNumInOfficesList;
  dynamic landAcreageOptions;
  String? pinLogin;
  String? voiceBlastsEnabled;
  String? lat;
  String? lon;
  dynamic oldLeadsPerDay;
  dynamic oldLeadsDay;
  dynamic oldLeadsTimes;
  String? propertyFilters;
  String? registrationPropertyViewLimit;
  String? paymentStatus;
  String? payStatusChange;
  String? colorTheme;
  String? customSlider;
  String? displayStatusActive;
  String? hideForeclosureInfo;
  String? displayAdminBtn;
  String? displayRenterBtn;
  String? seoCustomTitle;
  String? turnOffBrandbarSettings;
  String? searchHeaderText;
  String? logoOnLandingPage;
  String? canDefineTags;
  String? accountIdFacebook;
  String? zillowTechConnectEnabled;
  String? accountIdAdwords;
  String? allowBotsViewProperties;
  String? siteName;
  String? postcardsServicesStatus;
  String? availablePostcards4X6;
  String? availablePostcards6X9;
  String? availablePostcardsArea;
  String? monthlyBudget;
  String? monthlyLeadLimit;
  String? testMode;
  String? displayPropertyStatus;
  String? infusionEnabled;
  String? infusionActivationKey;
  dynamic infusionAuthUrl;
  String? sendAgentNewsletter;
  String? sendOnlyNewListingsInAlert;
  String? sendEmailAlerts;
  String? usertypeBlastsDisabled;
  String? agentsCanDefineTheirAreas;
  String? manageRepId;
  String? useZipcodesFromProperties;
  String? mergeSubtypeSearch;
  String? textPhoneNumber;
  String? textSenderPhoneNumber;
  String? listFirmEnabled;
  String? showMtlsLeadsInTrafficReport;
  String? fileServer;
  String? craigslistPosterEnabled;
  String? mapSearchEnabled;
  String? mapSearchCenterLat;
  String? mapSearchCenterLng;
  String? mapCoordinatesPriorityProvider;
  String? moneyScoreEnabled;
  String? dialerThreadsNumber;
  String? mapCoordinatesFromFeed;
  String? gender;
  String? apiAuthKey;
  String? apiAuthIp;
  String? sendDripCampaigns;
  String? sendPropertyAlerts;
  String? sendSpecialOffers;
  String? testimonialsBoxText;
  String? agentNumInAgentsList;
  String? landAreaUnits;
  String? displaysAllBathsCount;
  String? dialerType;
  String? emailServerSettingId;
  String? sellerCounselingInterview;
  String? customPrimaryPhotoFileId;
  String? source;
  String? displayBillingSettings;
  String? redirectAfterBillingFailed;
  String? exportLeadsApi;
  String? clientStageId;
  String? trainingStarted;
  String? marketingManagerId;
  String? homeValuesPageVersion;
  String? adminNotificationFromNumber;
  String? assignLeadflowLeads;
  String? infusionsoftId;
  String? augmentationSystemEnabled;
  String? augmentationRequests;
  String? vulcanApi;
  String? vulcanKey;
  String? vulcanLastRun;
  String? areasSettings;
  String? canceled;
  String? squeezeEnabled;
  String? redxBudget;
  String? augmentBudget;
  String? marketingZips;
  dynamic cancelizationDate;
  dynamic category;
  String? lowMinuteThreshold;
  String? lowMinuteEmailSent;
  dynamic expertDataId;
  String? supportRepId;
  String? hubspotId;
  String? analyticsSiteId;
  String? purged;
  String? referrerSiteId;
  String? referrerAgentId;
  String? activeAffiliate;
  String? affiliatePayoutPercentage;
  String? twilioSid;
  String? twilioToken;
  String? twilioAppSid;
  String? twilioDialerPhone;
  String? isaClient;
//  DateTime? isaLeadCutoff;
  String? billingStatus;
  String? onboardRepId;
  String? isaHotTransfer;
  String? apptCallPhoneNumber;
  String? lisaEnabled;
  String? platform;
  String? emailDomain;
  String? backendDomain;
  String? pixelId;
  String? isaPoolLeads;
  String? allowCreatingAccounts;
  String? currentDomain;
  bool? isDomainAlias;
  String? googleConversion;
  String? facebookConversion;
  String? domainTheme;
  String? defaultRoute;
  String? domainAdminId;
  String? domainFrontendType;
  String? domainAliasId;
  dynamic themeData;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    id: json["id"],
    managementSystemId: json["management_system_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    displayName: json["display_name"],
    meetOwnerName: json["meet_owner_name"],
    emailName: json["email_name"],
    companyName: json["company_name"],
    emailId: json["email_id"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    stateAbbr: json["state_abbr"],
    country: json["country"],
    zipcode: json["zipcode"],
    phone: json["phone"],
    officeNumber: json["office_number"],
    cellphone: json["cellphone"],
    domain: json["domain"],
    secure: json["secure"],
    plan: json["plan"],
    nextBillingDate: json["next_billing_date"],
    siteLiveDate: json["site_live_date"],
    dbHost: json["db_host"],
    dbName: json["db_name"],
    dbUser: json["db_user"],
    dbPassword: json["db_password"],
    retsUrl: json["rets_url"],
    retsUser: json["rets_user"],
    retsPassword: json["rets_password"],
    status: json["status"],
    created: DateTime.parse(json["created"]),
    modified: DateTime.parse(json["modified"]),
    retsId: json["rets_id"],
    retsSuperFeedId: json["retsSuperFeed_id"],
    retsFeedQueryParameterSetId: json["retsFeedQueryParameterSet_id"],
    retsUpdated: json["rets_updated"],
    retsRemoved: json["rets_removed"],
    cronsActive: json["crons_active"],
    copyRight: json["copy_right"],
    imCode: json["im_code"],
    landingPageInfo: json["landing_page_info"],
    facebookUrl: json["facebook_url"],
    linkedIn: json["linked_in"],
    twitterUrl: json["twitter_url"],
    youtubeUrl: json["youtube_url"],
    googleplusUrl: json["googleplus_url"],
    instagramUrl: json["instagram_url"],
    testimonialVideoUrl: json["testimonial_video_url"],
    ownerVideoSrc: json["owner_video_src"],
    toEmail: json["to_email"],
    fromEmail: json["from_email"],
    bccEmail: json["bcc_email"],
    supportEmail: json["support_email"],
    searchText: json["search_text"],
    mlsDetails: json["mls_details"],
    mlsCopyright: json["mls_copyright"],
    contact: json["contact"],
    fax: json["fax"],
    discount: json["discount"],
    retsState: json["rets_state"],
    landingPageDetails: json["landing_page_details"],
    landingPageText: json["landing_page_text"],
    footerDetails: json["footer_details"],
    defaultSearchTypeId: json["default_search_type_id"],
    defaultSearchTypeSubType: json["default_search_type_sub_type"],
    actionCall5: json["action_call_5"],
    additionalContactInfoLeft: json["additional_contact_info_left"],
    mortgageContactInfo: json["mortgage_contact_info"],
    webSystemStatus: json["web_system_status"],
    landingSeoText: json["landing_seo_text"],
    displayLastUpdateTime: json["display_last_update_time"],
    idxLogo: json["idx_logo"],
    tzOffset: json["tz_offset"],
    headTrackingCode: json["head_tracking_code"],
    headConversionCode: json["head_conversion_code"],
    bodyTrackingCode: json["body_tracking_code"],
    bodyConversionCode: json["body_conversion_code"],
    googleSiteVerify: json["google_site_verify"],
    callfireEnabled: json["callfire_enabled"],
    listAgentEnabled: json["list_agent_enabled"],
    coListFirmAgentEnabled: json["co_list_firm_agent_enabled"],
    searchOptions: json["search_options"],
    cfMinutesRenewable: json["cf_minutes_renewable"],
    cfMinutesBought: json["cf_minutes_bought"],
    cfPlan: json["cf_plan"],
    cfPlanAdded: json["cf_plan_added"],
    cfPlanRenewed: json["cf_plan_renewed"],
    zipCodeSearchName: json["zip_code_search_name"],
    searchResultsLimitedTo: json["search_results_limited_to"],
    homeAreasCustom: json["home_areas_custom"],
    priceRangeHomeFrom: json["price_range_home_from"],
    priceRangeHomeTo: json["price_range_home_to"],
    priceRangeAreaFrom: json["price_range_area_from"],
    priceRangeAreaTo: json["price_range_area_to"],
    officeNumInOfficesList: json["office_num_in_offices_list"],
    landAcreageOptions: json["land_acreage_options"],
    pinLogin: json["pin_login"],
    voiceBlastsEnabled: json["voice_blasts_enabled"],
    lat: json["lat"],
    lon: json["lon"],
    oldLeadsPerDay: json["old_leads_per_day"],
    oldLeadsDay: json["old_leads_day"],
    oldLeadsTimes: json["old_leads_times"],
    propertyFilters: json["property_filters"],
    registrationPropertyViewLimit: json["registration_property_view_limit"],
    paymentStatus: json["payment_status"],
    payStatusChange: json["pay_status_change"],
    colorTheme: json["color_theme"],
    customSlider: json["custom_slider"],
    displayStatusActive: json["display_status_active"],
    hideForeclosureInfo: json["hide_foreclosure_info"],
    displayAdminBtn: json["display_admin_btn"],
    displayRenterBtn: json["display_renter_btn"],
    seoCustomTitle: json["seo_custom_title"],
    turnOffBrandbarSettings: json["turn_off_brandbar_settings"],
    searchHeaderText: json["search_header_text"],
    logoOnLandingPage: json["logo_on_landing_page"],
    canDefineTags: json["can_define_tags"],
    accountIdFacebook: json["account_id_facebook"],
    zillowTechConnectEnabled: json["zillow_tech_connect_enabled"],
    accountIdAdwords: json["account_id_adwords"],
    allowBotsViewProperties: json["allow_bots_view_properties"],
    siteName: json["site_name"],
    postcardsServicesStatus: json["postcards_services_status"],
    availablePostcards4X6: json["available_postcards_4x6"],
    availablePostcards6X9: json["available_postcards_6x9"],
    availablePostcardsArea: json["available_postcards_area"],
    monthlyBudget: json["monthly_budget"],
    monthlyLeadLimit: json["monthly_lead_limit"],
    testMode: json["test_mode"],
    displayPropertyStatus: json["display_property_status"],
    infusionEnabled: json["infusion_enabled"],
    infusionActivationKey: json["infusion_activation_key"],
    infusionAuthUrl: json["infusion_auth_url"],
    sendAgentNewsletter: json["send_agent_newsletter"],
    sendOnlyNewListingsInAlert: json["send_only_new_listings_in_alert"],
    sendEmailAlerts: json["send_email_alerts"],
    usertypeBlastsDisabled: json["usertype_blasts_disabled"],
    agentsCanDefineTheirAreas: json["agents_can_define_their_areas"],
    manageRepId: json["manage_rep_id"],
    useZipcodesFromProperties: json["use_zipcodes_from_properties"],
    mergeSubtypeSearch: json["merge_subtype_search"],
    textPhoneNumber: json["text_phone_number"],
    textSenderPhoneNumber: json["text_sender_phone_number"],
    listFirmEnabled: json["list_firm_enabled"],
    showMtlsLeadsInTrafficReport: json["show_mtls_leads_in_traffic_report"],
    fileServer: json["file_server"],
    craigslistPosterEnabled: json["craigslist_poster_enabled"],
    mapSearchEnabled: json["map_search_enabled"],
    mapSearchCenterLat: json["map_search_center_lat"],
    mapSearchCenterLng: json["map_search_center_lng"],
    mapCoordinatesPriorityProvider: json["map_coordinates_priority_provider"],
    moneyScoreEnabled: json["money_score_enabled"],
    dialerThreadsNumber: json["dialer_threads_number"],
    mapCoordinatesFromFeed: json["map_coordinates_from_feed"],
    gender: json["gender"],
    apiAuthKey: json["api_auth_key"],
    apiAuthIp: json["api_auth_ip"],
    sendDripCampaigns: json["send_drip_campaigns"],
    sendPropertyAlerts: json["send_property_alerts"],
    sendSpecialOffers: json["send_special_offers"],
    testimonialsBoxText: json["testimonials_box_text"],
    agentNumInAgentsList: json["agent_num_in_agents_list"],
    landAreaUnits: json["land_area_units"],
    displaysAllBathsCount: json["displays_all_baths_count"],
    dialerType: json["dialer_type"],
    emailServerSettingId: json["email_server_setting_id"],
    sellerCounselingInterview: json["seller_counseling_interview"],
    customPrimaryPhotoFileId: json["custom_primary_photo_file_id"],
    source: json["source"],
    displayBillingSettings: json["display_billing_settings"],
    redirectAfterBillingFailed: json["redirect_after_billing_failed"],
    exportLeadsApi: json["export_leads_api"],
    clientStageId: json["client_stage_id"],
    trainingStarted: json["training_started"],
    marketingManagerId: json["marketing_manager_id"],
    homeValuesPageVersion: json["home_values_page_version"],
    adminNotificationFromNumber: json["admin_notification_from_number"],
    assignLeadflowLeads: json["assign_leadflow_leads"],
    infusionsoftId: json["infusionsoft_id"],
    augmentationSystemEnabled: json["augmentation_system_enabled"],
    augmentationRequests: json["augmentation_requests"],
    vulcanApi: json["vulcan_api"],
    vulcanKey: json["vulcan_key"],
    vulcanLastRun: json["vulcan_last_run"],
    areasSettings: json["areas_settings"],
    canceled: json["canceled"],
    squeezeEnabled: json["squeeze_enabled"],
    redxBudget: json["redx_budget"],
    augmentBudget: json["augment_budget"],
    marketingZips: json["marketingZips"],
    cancelizationDate: json["cancelization_date"],
    category: json["category"],
    lowMinuteThreshold: json["low_minute_threshold"],
    lowMinuteEmailSent: json["low_minute_email_sent"],
    expertDataId: json["expert_data_id"],
    supportRepId: json["support_rep_id"],
    hubspotId: json["hubspot_id"],
    analyticsSiteId: json["analytics_site_id"],
    purged: json["purged"],
    referrerSiteId: json["referrer_site_id"],
    referrerAgentId: json["referrer_agent_id"],
    activeAffiliate: json["active_affiliate"],
    affiliatePayoutPercentage: json["affiliate_payout_percentage"],
    twilioSid: json["twilio_sid"],
    twilioToken: json["twilio_token"],
    twilioAppSid: json["twilio_app_sid"],
    twilioDialerPhone: json["twilio_dialer_phone"],
    isaClient: json["isa_client"],
    //isaLeadCutoff: DateTime.parse(json["isa_lead_cutoff"]),
    billingStatus: json["billing_status"],
    onboardRepId: json["onboard_rep_id"],
    isaHotTransfer: json["isa_hot_transfer"],
    apptCallPhoneNumber: json["appt_call_phone_number"],
    lisaEnabled: json["lisa_enabled"],
    platform: json["platform"],
    emailDomain: json["email_domain"],
    backendDomain: json["backend_domain"],
    pixelId: json["pixel_id"],
    isaPoolLeads: json["isa_pool_leads"],
    allowCreatingAccounts: json["allow_creating_accounts"],
    currentDomain: json["current_domain"],
    isDomainAlias: json["isDomainAlias"],
    googleConversion: json["google_conversion"],
    facebookConversion: json["facebook_conversion"],
    domainTheme: json["domain_theme"],
    defaultRoute: json["default_route"],
    domainAdminId: json["domain_admin_id"],
    domainFrontendType: json["domain_frontend_type"],
    domainAliasId: json["domain_alias_id"],
    themeData: json["theme_data"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "management_system_id": managementSystemId,
    "first_name": firstName,
    "last_name": lastName,
    "display_name": displayName,
    "meet_owner_name": meetOwnerName,
    "email_name": emailName,
    "company_name": companyName,
    "email_id": emailId,
    "address": address,
    "city": city,
    "state": state,
    "state_abbr": stateAbbr,
    "country": country,
    "zipcode": zipcode,
    "phone": phone,
    "office_number": officeNumber,
    "cellphone": cellphone,
    "domain": domain,
    "secure": secure,
    "plan": plan,
    "next_billing_date": nextBillingDate,
    "site_live_date": siteLiveDate,
    "db_host": dbHost,
    "db_name": dbName,
    "db_user": dbUser,
    "db_password": dbPassword,
    "rets_url": retsUrl,
    "rets_user": retsUser,
    "rets_password": retsPassword,
    "status": status,
    "created": created!.toIso8601String(),
    "modified": modified!.toIso8601String(),
    "rets_id": retsId,
    "retsSuperFeed_id": retsSuperFeedId,
    "retsFeedQueryParameterSet_id": retsFeedQueryParameterSetId,
    "rets_updated": retsUpdated,
    "rets_removed": retsRemoved,
    "crons_active": cronsActive,
    "copy_right": copyRight,
    "im_code": imCode,
    "landing_page_info": landingPageInfo,
    "facebook_url": facebookUrl,
    "linked_in": linkedIn,
    "twitter_url": twitterUrl,
    "youtube_url": youtubeUrl,
    "googleplus_url": googleplusUrl,
    "instagram_url": instagramUrl,
    "testimonial_video_url": testimonialVideoUrl,
    "owner_video_src": ownerVideoSrc,
    "to_email": toEmail,
    "from_email": fromEmail,
    "bcc_email": bccEmail,
    "support_email": supportEmail,
    "search_text": searchText,
    "mls_details": mlsDetails,
    "mls_copyright": mlsCopyright,
    "contact": contact,
    "fax": fax,
    "discount": discount,
    "rets_state": retsState,
    "landing_page_details": landingPageDetails,
    "landing_page_text": landingPageText,
    "footer_details": footerDetails,
    "default_search_type_id": defaultSearchTypeId,
    "default_search_type_sub_type": defaultSearchTypeSubType,
    "action_call_5": actionCall5,
    "additional_contact_info_left": additionalContactInfoLeft,
    "mortgage_contact_info": mortgageContactInfo,
    "web_system_status": webSystemStatus,
    "landing_seo_text": landingSeoText,
    "display_last_update_time": displayLastUpdateTime,
    "idx_logo": idxLogo,
    "tz_offset": tzOffset,
    "head_tracking_code": headTrackingCode,
    "head_conversion_code": headConversionCode,
    "body_tracking_code": bodyTrackingCode,
    "body_conversion_code": bodyConversionCode,
    "google_site_verify": googleSiteVerify,
    "callfire_enabled": callfireEnabled,
    "list_agent_enabled": listAgentEnabled,
    "co_list_firm_agent_enabled": coListFirmAgentEnabled,
    "search_options": searchOptions,
    "cf_minutes_renewable": cfMinutesRenewable,
    "cf_minutes_bought": cfMinutesBought,
    "cf_plan": cfPlan,
    "cf_plan_added": cfPlanAdded,
    "cf_plan_renewed": cfPlanRenewed,
    "zip_code_search_name": zipCodeSearchName,
    "search_results_limited_to": searchResultsLimitedTo,
    "home_areas_custom": homeAreasCustom,
    "price_range_home_from": priceRangeHomeFrom,
    "price_range_home_to": priceRangeHomeTo,
    "price_range_area_from": priceRangeAreaFrom,
    "price_range_area_to": priceRangeAreaTo,
    "office_num_in_offices_list": officeNumInOfficesList,
    "land_acreage_options": landAcreageOptions,
    "pin_login": pinLogin,
    "voice_blasts_enabled": voiceBlastsEnabled,
    "lat": lat,
    "lon": lon,
    "old_leads_per_day": oldLeadsPerDay,
    "old_leads_day": oldLeadsDay,
    "old_leads_times": oldLeadsTimes,
    "property_filters": propertyFilters,
    "registration_property_view_limit": registrationPropertyViewLimit,
    "payment_status": paymentStatus,
    "pay_status_change": payStatusChange,
    "color_theme": colorTheme,
    "custom_slider": customSlider,
    "display_status_active": displayStatusActive,
    "hide_foreclosure_info": hideForeclosureInfo,
    "display_admin_btn": displayAdminBtn,
    "display_renter_btn": displayRenterBtn,
    "seo_custom_title": seoCustomTitle,
    "turn_off_brandbar_settings": turnOffBrandbarSettings,
    "search_header_text": searchHeaderText,
    "logo_on_landing_page": logoOnLandingPage,
    "can_define_tags": canDefineTags,
    "account_id_facebook": accountIdFacebook,
    "zillow_tech_connect_enabled": zillowTechConnectEnabled,
    "account_id_adwords": accountIdAdwords,
    "allow_bots_view_properties": allowBotsViewProperties,
    "site_name": siteName,
    "postcards_services_status": postcardsServicesStatus,
    "available_postcards_4x6": availablePostcards4X6,
    "available_postcards_6x9": availablePostcards6X9,
    "available_postcards_area": availablePostcardsArea,
    "monthly_budget": monthlyBudget,
    "monthly_lead_limit": monthlyLeadLimit,
    "test_mode": testMode,
    "display_property_status": displayPropertyStatus,
    "infusion_enabled": infusionEnabled,
    "infusion_activation_key": infusionActivationKey,
    "infusion_auth_url": infusionAuthUrl,
    "send_agent_newsletter": sendAgentNewsletter,
    "send_only_new_listings_in_alert": sendOnlyNewListingsInAlert,
    "send_email_alerts": sendEmailAlerts,
    "usertype_blasts_disabled": usertypeBlastsDisabled,
    "agents_can_define_their_areas": agentsCanDefineTheirAreas,
    "manage_rep_id": manageRepId,
    "use_zipcodes_from_properties": useZipcodesFromProperties,
    "merge_subtype_search": mergeSubtypeSearch,
    "text_phone_number": textPhoneNumber,
    "text_sender_phone_number": textSenderPhoneNumber,
    "list_firm_enabled": listFirmEnabled,
    "show_mtls_leads_in_traffic_report": showMtlsLeadsInTrafficReport,
    "file_server": fileServer,
    "craigslist_poster_enabled": craigslistPosterEnabled,
    "map_search_enabled": mapSearchEnabled,
    "map_search_center_lat": mapSearchCenterLat,
    "map_search_center_lng": mapSearchCenterLng,
    "map_coordinates_priority_provider": mapCoordinatesPriorityProvider,
    "money_score_enabled": moneyScoreEnabled,
    "dialer_threads_number": dialerThreadsNumber,
    "map_coordinates_from_feed": mapCoordinatesFromFeed,
    "gender": gender,
    "api_auth_key": apiAuthKey,
    "api_auth_ip": apiAuthIp,
    "send_drip_campaigns": sendDripCampaigns,
    "send_property_alerts": sendPropertyAlerts,
    "send_special_offers": sendSpecialOffers,
    "testimonials_box_text": testimonialsBoxText,
    "agent_num_in_agents_list": agentNumInAgentsList,
    "land_area_units": landAreaUnits,
    "displays_all_baths_count": displaysAllBathsCount,
    "dialer_type": dialerType,
    "email_server_setting_id": emailServerSettingId,
    "seller_counseling_interview": sellerCounselingInterview,
    "custom_primary_photo_file_id": customPrimaryPhotoFileId,
    "source": source,
    "display_billing_settings": displayBillingSettings,
    "redirect_after_billing_failed": redirectAfterBillingFailed,
    "export_leads_api": exportLeadsApi,
    "client_stage_id": clientStageId,
    "training_started": trainingStarted,
    "marketing_manager_id": marketingManagerId,
    "home_values_page_version": homeValuesPageVersion,
    "admin_notification_from_number": adminNotificationFromNumber,
    "assign_leadflow_leads": assignLeadflowLeads,
    "infusionsoft_id": infusionsoftId,
    "augmentation_system_enabled": augmentationSystemEnabled,
    "augmentation_requests": augmentationRequests,
    "vulcan_api": vulcanApi,
    "vulcan_key": vulcanKey,
    "vulcan_last_run": vulcanLastRun,
    "areas_settings": areasSettings,
    "canceled": canceled,
    "squeeze_enabled": squeezeEnabled,
    "redx_budget": redxBudget,
    "augment_budget": augmentBudget,
    "marketingZips": marketingZips,
    "cancelization_date": cancelizationDate,
    "category": category,
    "low_minute_threshold": lowMinuteThreshold,
    "low_minute_email_sent": lowMinuteEmailSent,
    "expert_data_id": expertDataId,
    "support_rep_id": supportRepId,
    "hubspot_id": hubspotId,
    "analytics_site_id": analyticsSiteId,
    "purged": purged,
    "referrer_site_id": referrerSiteId,
    "referrer_agent_id": referrerAgentId,
    "active_affiliate": activeAffiliate,
    "affiliate_payout_percentage": affiliatePayoutPercentage,
    "twilio_sid": twilioSid,
    "twilio_token": twilioToken,
    "twilio_app_sid": twilioAppSid,
    "twilio_dialer_phone": twilioDialerPhone,
    "isa_client": isaClient,
   // "isa_lead_cutoff": "${isaLeadCutoff!.year.toString().padLeft(4, '0')}-${isaLeadCutoff!.month.toString().padLeft(2, '0')}-${isaLeadCutoff!.day.toString().padLeft(2, '0')}",
    "billing_status": billingStatus,
    "onboard_rep_id": onboardRepId,
    "isa_hot_transfer": isaHotTransfer,
    "appt_call_phone_number": apptCallPhoneNumber,
    "lisa_enabled": lisaEnabled,
    "platform": platform,
    "email_domain": emailDomain,
    "backend_domain": backendDomain,
    "pixel_id": pixelId,
    "isa_pool_leads": isaPoolLeads,
    "allow_creating_accounts": allowCreatingAccounts,
    "current_domain": currentDomain,
    "isDomainAlias": isDomainAlias,
    "google_conversion": googleConversion,
    "facebook_conversion": facebookConversion,
    "domain_theme": domainTheme,
    "default_route": defaultRoute,
    "domain_admin_id": domainAdminId,
    "domain_frontend_type": domainFrontendType,
    "domain_alias_id": domainAliasId,
    "theme_data": themeData,
  };
}



class CustomGroup {
  CustomGroup({
    this.id,
    this.name,
    this.leadCount,
  });

  int? id;
  String? name;
  int? leadCount;

  factory CustomGroup.fromJson(Map<String, dynamic> json) => CustomGroup(
    id: json["id"],
    name: json["name"],
    leadCount: json["lead_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lead_count": leadCount,
  };
}
