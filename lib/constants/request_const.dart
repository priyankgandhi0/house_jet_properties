

const googlePlaceApiKey = 'AIzaSyCC_GrO0peF27v5Uf2hgsnkoFGbT4ga9kw';
// Map<String, String> requestHeader(bool passAuthToken) {
//   return {
//     RequestHeaderKey.contentType: "application/json",
//     RequestHeaderKey.appSecret: "wally1611",
//     RequestHeaderKey.appTrackVersion: "v1",
//     RequestHeaderKey.appDeviceType:
//         preferences.getString(SharedPreference.APP_DEVICE_TYPE) ?? '',
//     RequestHeaderKey.appStoreVersion:
//         preferences.getString(SharedPreference.APP_STORE_VERSION) ?? '',
//     RequestHeaderKey.appDeviceModel:
//         preferences.getString(SharedPreference.APP_DEVICE_MODEL) ?? '',
//     RequestHeaderKey.appOsVersion:
//         preferences.getString(SharedPreference.APP_OS_VERSION) ?? '',
//     RequestHeaderKey.appStoreBuildNumber:
//         preferences.getString(SharedPreference.APP_STORE_BUILD_NUMBER) ?? '',
//     if (passAuthToken)
//       RequestHeaderKey.authToken:
//           preferences.getString(SharedPreference.AUTH_TOKEN) ?? '',
//   };
// }
// // ignore_for_file: constant_identifier_names
//
// class AppUrls {
//   static const String baseUrlV1 =
//       //  "https://nxlead.marketmakerleads.net/api/v1";
//       "https://master.ppc.staging.marketmakerleads.net/api/v1";
//   //  "https://my.payperclosing.com/api/v1"; // dev base url
//   static const String baseUrl =
//       "https://master.ppc.staging.marketmakerleads.net";
//   //"https://my.payperclosing.com"; // dev base url
//   static const String baseImgUrl = "http://";
//
// // live base url
//
//   // const bool isLive = false;
//   /// Create request with query parameter
// }
//
// const int LIMIT = 20;
//
// UserData assignedAgentData = SharedPreference.getUserModel() ?? UserData();
// ContactLead contactProfileDetail = ContactLead();
// ValueNotifier<bool> hasInternet = ValueNotifier(true);
//
// // bool hasInternet =   ValueNotifier(false) as bool;
// // List<String> assignedAgentList = ["${assignedAgentData.fullName}"];
// class HiveKeys {
//   static String downloadFileKey = "downloadFileBox";
// }
//
// class MethodNames {
//   static const userLogin = "/login/mobileapp";
//
//   // shop apis
//   // static const getTrackerStats = "/dashboard/get-tracker-stats";
//   static const getTrackerStats =
//       "/dashboard/get-tracker-stats?dashboard_referral_selected=";
//   // "All&admin_id=205&start=2022-11-07&end=";
//   static const userTasks = "/user-tasks/get";
//   static const getUserTaskDispositionList = "/dialer/get-dispositions";
//   static const viewTransaction = "/sales-histories/report";
//   static const userTasksDispo = "/user-tasks/dispo";
//   static const userTasksDispositionAddNote = "/notes/addLeadNote/";
//   static const rescheduleTasksDispo = "/agents/ajax/rescheduleTask";
//   static const setMovingTimeFrame = "/agents/ajax/setMovingTimeframe";
//   static const addFaceToFace = "/user-tasks/add";
//   static const userTasksDispoChangeComplete = "/user-tasks/change-completed/";
//   static const getPipelineGroupFilter =
//       "/groups/search?source=no&pipeline=yes&search=";
//   static const filterUserTasks = "/user-tasks/get?search=&";
//   // "/user-tasks/get?search=&page=1&perPage=20&count=5&pageStart=1&pageStop=5&filters=";
//   static const filterInitialUrl =
//       "/user-tasks/get?search=&page=1&perPage=20&count=5&pageStart=1&pageStop=5&filters=";
//
//   static const searchContacts = "/client-leads/search-filtered";
//   static const contactsProfile = "/client-leads/getleadbyid/";
//   static const addMetFaceToFace = "/client-leads/markAsMetFaceToFace/";
//   static const updateContactProfile = "/client-leads/save/";
//   //static const contactPipeLineStage = "/client-leads/pipeline-groups/";
//   static const contactPipeLineStage =
//       "/pipeline-groups/get-other-pipeline-groups/";
//   // static const updateContactPipeLineStaging = "/pipelines/change-pipeline-state/";
//   static const updateContactPipeLineStaging =
//       "/pipelines/change-pipeline-group/";
//   static const contactsTimeline = "/client-leads-/get-lead-activities/";
//   static const updateTimelineTaskTitle = "/user-tasks/change-field/";
//   static const editTimelineNote = "/notes/editLeadNote/";
//   static const updateTimelineTaskDateAndType = "/user-tasks/change-date/";
//   static const getContactsPlan = "/plans/getInstaContacts/";
//   static const cancelContactsPlan =
//       "/plans/delete-planned-activities-by-plan-id/";
//   static const cancelAllContactsPlan = "/plans/delete-all-planned-activities/";
//   static const getContactFiles = "/client-leads/files/";
//   static const getContactMediaFiles = "/admin-files/Media?";
//
//   static const deleteContactMediaFiles = "/admin-files/delete";
//   static const deleteContactFiles = "/client-leads/delete-file";
//   static const addContactFiles = "/admin-files/upload";
//   static const updateProfileImage = "/admin-files/upload/";
//   static const verifyMobileNumber = "/dialer/verify-phone?id=";
//   static const updateAgentProfile = "/admins/update-profile/";
//   static const getAgentProfileMediaFiles = "/agents/agentFiles";
//
//   static const doNotDisturbDayList = "/client-do-not-disturb-hours/by-user-id/";
//   static const addDoNotDisturbTime = "/client-do-not-disturb-hours/add";
//   static const editDoNotDisturbTime = "/client-do-not-disturb-hours/edit/";
//   static const deleteDoNotDisturbTime = "/client-do-not-disturb-hours/delete/";
//   static const insertContactMediaFile = "/client-leads/add-file";
//   static const deleteMediaFiles = "/admin-files/delete";
//   static const getLeadAugmentationData =
//       "/lead-augmentations/getLeadsAugmentationData/";
//   static const runAugmentationData = "/client-leads/legacyAugmentLeads";
//   static const contactsLead = "/notes/addLeadNote/";
//   static const contactsLogCall = "/cfDispositions/log-call";
//   static const getLogCallDisposition = "/cfDispositions/get-list";
//   // static const getLogedInAgents = "/agents/getLoggedInAgent";
//   static const getLogedInAgents = "/admins/me";
//   static const updateAgentPassword = "/admins/update-profile/";
//   static const agentUpdatePassword = "/agents/ajax/updatePassword?id=";
//
//   // call office
//   static const callOffice = "/support-tickets/get-agents-manager";
//   // Calender screen
//   static const getCalenderEvent = "/user-tasks/getAdminsCalendar/";
//   static const getCalenderLead = "/client-leads/search/null/false";
//   static const getBuyerSeller = "/pipelines/get-pipelines";
//   static const getPipelineCardAgentList =
//       "/admins/getSiteAdmins?types[]=1&types[]=2";
//   static const getPipeLineType = "/pipelines/get-pipeline-groups/";
//   static const getPipelineItem = "/client-leads/searchFiltered";
//   static const changePipeLineState = "/pipelines/change-pipeline-state/";
//   static const getSendVideoAgentDetail = "/agents/ajax/getAgentsForSelect2";
//   static const getSendVideoBlogs = "/blogs/video-blogs";
//   static const sendVideoBlog = "/email-campaigns/legacy-send-email-blast";
//   static const searchPipelineUserTags = "/user-tags/search-tags?";
//   static const addUserTags = "/user-tags/add";
//   static const addTagsToLead = "/user-tags/add-tags-to-leads";
//   static const removeTagsToLead = "/user-tags/remove-tags-on-leads";
//   static const changePipelineStagingState =
//       "/pipelines/bulk-change-pipeline-stage";
//   static const setAvailable = "/agent-availabilities/edit";
//   static const getAvailable = "/agent-availabilities";
//   static const addAppointment = "/user-tasks/add/";
//   static const editAppointment = "/user-tasks/edit/";
//   static const deleteAppointment = "/user-tasks/delete/";
//   static const getShopDetail = "getShopDetail";
//   static const userEmailExist = "userEmailExist";
//   static const getCommonTitleList = "getCommonTitleList";
//   static const shopRegistration = "shopRegistration";
//   static const userRegistration = "userRegistration";
//   static const commonSkillsList = "commonSkillsList";
//   static const addCommonNewSkill = "addCommonNewSkill";
//
//   // support Tab
//   static const getSupportTicket = "/support-tickets?";
//   static const readSupportTicket = "/support-tickets/read/";
//   static const createSupportTicket = "/support-tickets/legacy-add";
//   static const setTicketStatus = "/support-tickets/set-status/";
//   static const replyTicket = "/support-ticket-replies/reply";
// }
//
// class RequestParam {
//   static const service = "Service"; // -> pass method name
//   static const showError = "show_error"; // -> bool in String
// }
//
// class RequestHeaderKey {
//   static const contentType = "Content-Type";
//   static const userAgent = "User-Agent";
//   static const appSecret = "App-Secret";
//   static const appTrackVersion = "App-Track-Version";
//   static const appDeviceType = "App-Device-Type";
//   static const appStoreVersion = "App-Store-Version";
//   static const appDeviceModel = "App-Device-Model";
//   static const appOsVersion = "App-Os-Version";
//   static const appStoreBuildNumber = "App-Store-Build-Number";
//   static const authToken = "Auth-Token";
//   static const accessControlAllowOrigin = "Access-Control-Allow-Origin";
// }
