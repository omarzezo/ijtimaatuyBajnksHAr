/// message : "Approval saved"

class SignatureResponseModel {
  SignatureResponseModel({
    String message,}){
    _message = message;
  }

  SignatureResponseModel.fromJson(dynamic json) {
    _message = json['message'];
  }
  String _message;

  String get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}
// /// id : 64
// /// title : "test"
// /// user_id : 75
// /// status : 2
// /// created_at : "2022-07-19T09:38:50.000000Z"
// /// updated_at : "2022-07-19T09:40:27.000000Z"
// /// deleted_at : null
// /// committee_id : 3
// /// sender : {"id":75,"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","updated_at":"2022-07-21T07:59:14.000000Z","role_id":1,"phone":"96281874","birthdate":"1990-01-01","team":3,"image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","status":1,"position":null,"two_auth":"1","verification_code":null,"signature":"uploads/approvals/3KJUOAwy26.png","deleted":"0","team_name":"Ijtimaati Team","role_name":"Admins","committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2021-11-01T19:33:28.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":3}},{"id":36,"name":"Board Committee","description":"","created_at":"2022-03-10T06:36:00.000000Z","updated_at":"2022-03-10T06:36:00.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":36}},{"id":37,"name":"sales committee","description":"","created_at":"2022-03-13T05:03:22.000000Z","updated_at":"2022-03-23T08:10:30.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":37}},{"id":41,"name":"sales2","description":"_","created_at":"2022-03-23T08:23:21.000000Z","updated_at":"2022-03-23T08:23:21.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":41}},{"id":43,"name":"رؤية عمان 2040","description":"","created_at":"2022-04-03T04:50:24.000000Z","updated_at":"2022-04-03T04:50:24.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":43}}],"role":{"id":1,"name":"Admins","slug":"Admins","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-04-05T05:48:25.000000Z","status":"1"}}
// /// documents : [{"id":65,"approval_id":64,"library_id":458,"created_at":"2022-07-19T09:38:50.000000Z","updated_at":"2022-07-19T09:38:50.000000Z","url":null,"library":{"id":458,"user_id":75,"library_category_id":null,"name":"الإبداع التكنلوجي الحديث (بروفايل).pdf","type":"application/pdf","file_path":"uploads/library/1650441556710357.pdf","created_at":"2022-04-20T07:59:16.000000Z","updated_at":"2022-04-20T07:59:16.000000Z","hidden":0,"file_url":"https://test.ijtimaati.com/api/public/uploads/library/1650441556710357.pdf","size":"1.61 MB","used_in":{"talkingpoints":[{"id":293,"meeting_id":404,"creator_id":21,"title":"Agend1","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":404,"title":"test 1","owner_id":75,"committee_id":36,"description":"","start_date":"2022-04-21 11:55:00","duration":60,"location":"muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":null,"last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-04-26 11:20 AM","current_member":null,"members":[{"id":2656,"meeting_id":404,"user_id":null,"user_email":"ahmed@lamma.om","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":"b5d96273a8f24e46a7376a208dbd112e","user":null,"type":"Viewer"},{"id":2655,"meeting_id":404,"user_id":null,"user_email":"sultansalem70@gmail.com","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":"3e5ea4302f87915996dfd211563da1ea","user":null,"type":"Viewer"},{"id":2646,"meeting_id":404,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2648,"meeting_id":404,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2649,"meeting_id":404,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2650,"meeting_id":404,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2651,"meeting_id":404,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2652,"meeting_id":404,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2653,"meeting_id":404,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2654,"meeting_id":404,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":296,"meeting_id":410,"creator_id":75,"title":"sdfghj","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":410,"title":"test","owner_id":75,"committee_id":36,"description":"","start_date":"2022-04-26 12:54:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":null,"mom_conclusion":null,"library_id":null,"attendance_status":"Going","last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-04-26 11:19 AM","current_member":{"id":2683,"meeting_id":410,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2682,"meeting_id":410,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2683,"meeting_id":410,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2684,"meeting_id":410,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2685,"meeting_id":410,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Not going","status_reason":"i have another me","token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2686,"meeting_id":410,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2687,"meeting_id":410,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2688,"meeting_id":410,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2689,"meeting_id":410,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2690,"meeting_id":410,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":303,"meeting_id":426,"creator_id":75,"title":"Agenda","duration":180,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":426,"title":"test5567","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-10 10:16:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Ahmed ALReesi change meeting status to Archived 2022-05-09 1:46 PM","current_member":{"id":2757,"meeting_id":426,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2756,"meeting_id":426,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2757,"meeting_id":426,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2758,"meeting_id":426,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2759,"meeting_id":426,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2760,"meeting_id":426,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2761,"meeting_id":426,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2762,"meeting_id":426,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2763,"meeting_id":426,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2764,"meeting_id":426,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2765,"meeting_id":426,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":308,"meeting_id":437,"creator_id":75,"title":"test1","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":309,"meeting_id":437,"creator_id":75,"title":"test2","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":314,"meeting_id":443,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":443,"title":"اجتماع مجلس الإدارة الثاني","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-18 09:13:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-05-18 5:09 PM","current_member":{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2974,"meeting_id":443,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2976,"meeting_id":443,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2977,"meeting_id":443,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2978,"meeting_id":443,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2979,"meeting_id":443,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2980,"meeting_id":443,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2981,"meeting_id":443,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2982,"meeting_id":443,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2983,"meeting_id":443,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":318,"meeting_id":445,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":445,"title":"اجتماع مجلس الادارة الاول 2022","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-31 10:00:00","duration":60,"location":"المنى الرئيسي قاعة رقم 5","meeting_status_id":3,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"jamila Update decision التصويت على قرار تعين جديد 2022-07-03 11:13 AM","current_member":{"id":2986,"meeting_id":445,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2985,"meeting_id":445,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2986,"meeting_id":445,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2987,"meeting_id":445,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2988,"meeting_id":445,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2989,"meeting_id":445,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2990,"meeting_id":445,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2991,"meeting_id":445,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2992,"meeting_id":445,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2993,"meeting_id":445,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2994,"meeting_id":445,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":322,"meeting_id":450,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":331,"meeting_id":457,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":384,"meeting_id":533,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":15,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":533,"title":"اجتماع وزارة التربيه","owner_id":75,"committee_id":3,"description":"","start_date":"2022-06-30 07:00:00","duration":60,"location":"Muscat- Ghala","meeting_status_id":3,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":null,"mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Zainab Al- Ajmi change meeting status to Live 2022-06-28 12:23 PM","current_member":{"id":3916,"meeting_id":533,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":3914,"meeting_id":533,"user_id":3,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"said.sale7@gmail.com","image":"https://test.ijtimaati.com/api/public/uploads/images/oNBWLjycUr.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3934,"meeting_id":533,"user_id":21,"user_email":"","can_edit":1,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Editor"},{"id":3935,"meeting_id":533,"user_id":26,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Omar Abdelaziz","email":"zezoomar674@yahoo.com","image":"https://test.ijtimaati.com/api/public/uploads/images/GwvmPMsKbi.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3915,"meeting_id":533,"user_id":31,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Maryam AL Rasbi","email":"Maryam@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3916,"meeting_id":533,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3917,"meeting_id":533,"user_id":38,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Hilal","email":"hilal@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/koU0KGKcAO.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3918,"meeting_id":533,"user_id":45,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mr. Abdulaziz","email":"abdulaziz@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/jdNrfSL35P.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3919,"meeting_id":533,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3920,"meeting_id":533,"user_id":60,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Rayah Al Rasbi","email":"rayah@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3921,"meeting_id":533,"user_id":71,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abeer Al Rawahi","email":"abeer@ijtimaati.com","image":null,"position":"Sales Account Manager","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3922,"meeting_id":533,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3923,"meeting_id":533,"user_id":80,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Clariza Vale","email":"clariza@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/IMRRJEPsXj.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3924,"meeting_id":533,"user_id":81,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Waleed","email":"waleed@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3925,"meeting_id":533,"user_id":83,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"andullah","email":"abdullah@globcom-oman.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3926,"meeting_id":533,"user_id":85,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Qusai Mohammed","email":"qusai@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3927,"meeting_id":533,"user_id":86,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Marwa Al Rawahi","email":"marwa@gcntoman.com","image":"https://test.ijtimaati.com/api/public/uploads/images/OjSEgHljVF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3930,"meeting_id":533,"user_id":103,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Joury","email":"hmz.942@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3932,"meeting_id":533,"user_id":106,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Thththaaa","email":"Thththaaa@hotmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}}],"talkingpointsubpoints":[],"decisions":[{"id":252,"meeting_id":443,"creator_id":75,"title":"التصويت على قرار اسناد المناقصة رقم 5","deadline":"2022-06-07 09:26:13","description":null,"created_at":"2022-05-17T05:24:28.000000Z","order":0,"talkingpoint_id":317,"mom_conclusion":null,"mom_active":1,"talkingpoint_subpoint_id":null,"laravel_through_key":458,"meeting":{"id":443,"title":"اجتماع مجلس الإدارة الثاني","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-18 09:13:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-05-18 5:09 PM","current_member":{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2974,"meeting_id":443,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2976,"meeting_id":443,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2977,"meeting_id":443,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2978,"meeting_id":443,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2979,"meeting_id":443,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2980,"meeting_id":443,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2981,"meeting_id":443,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2982,"meeting_id":443,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2983,"meeting_id":443,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}}],"actions":[]},"edited_file":[{"id":28,"file_path":null,"library_id":458,"user_id":21,"meeting_id":426,"created_at":"2022-05-09T09:13:24.000000Z","updated_at":"2022-05-09T09:13:24.000000Z","edited_library_id":473}],"talkingpoints":[{"id":293,"meeting_id":404,"creator_id":21,"title":"Agend1","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":404,"title":"test 1","owner_id":75,"committee_id":36,"description":"","start_date":"2022-04-21 11:55:00","duration":60,"location":"muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":null,"last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-04-26 11:20 AM","current_member":null,"members":[{"id":2656,"meeting_id":404,"user_id":null,"user_email":"ahmed@lamma.om","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":"b5d96273a8f24e46a7376a208dbd112e","user":null,"type":"Viewer"},{"id":2655,"meeting_id":404,"user_id":null,"user_email":"sultansalem70@gmail.com","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":"3e5ea4302f87915996dfd211563da1ea","user":null,"type":"Viewer"},{"id":2646,"meeting_id":404,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2648,"meeting_id":404,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2649,"meeting_id":404,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2650,"meeting_id":404,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2651,"meeting_id":404,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2652,"meeting_id":404,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2653,"meeting_id":404,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2654,"meeting_id":404,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":296,"meeting_id":410,"creator_id":75,"title":"sdfghj","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":410,"title":"test","owner_id":75,"committee_id":36,"description":"","start_date":"2022-04-26 12:54:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":null,"mom_conclusion":null,"library_id":null,"attendance_status":"Going","last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-04-26 11:19 AM","current_member":{"id":2683,"meeting_id":410,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2682,"meeting_id":410,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2683,"meeting_id":410,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2684,"meeting_id":410,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2685,"meeting_id":410,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Not going","status_reason":"i have another me","token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2686,"meeting_id":410,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2687,"meeting_id":410,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2688,"meeting_id":410,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2689,"meeting_id":410,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2690,"meeting_id":410,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":303,"meeting_id":426,"creator_id":75,"title":"Agenda","duration":180,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":426,"title":"test5567","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-10 10:16:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Ahmed ALReesi change meeting status to Archived 2022-05-09 1:46 PM","current_member":{"id":2757,"meeting_id":426,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2756,"meeting_id":426,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2757,"meeting_id":426,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2758,"meeting_id":426,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2759,"meeting_id":426,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2760,"meeting_id":426,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2761,"meeting_id":426,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2762,"meeting_id":426,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2763,"meeting_id":426,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2764,"meeting_id":426,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2765,"meeting_id":426,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":308,"meeting_id":437,"creator_id":75,"title":"test1","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":309,"meeting_id":437,"creator_id":75,"title":"test2","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":314,"meeting_id":443,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":443,"title":"اجتماع مجلس الإدارة الثاني","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-18 09:13:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-05-18 5:09 PM","current_member":{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2974,"meeting_id":443,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2976,"meeting_id":443,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2977,"meeting_id":443,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2978,"meeting_id":443,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2979,"meeting_id":443,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2980,"meeting_id":443,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2981,"meeting_id":443,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2982,"meeting_id":443,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2983,"meeting_id":443,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":318,"meeting_id":445,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":445,"title":"اجتماع مجلس الادارة الاول 2022","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-31 10:00:00","duration":60,"location":"المنى الرئيسي قاعة رقم 5","meeting_status_id":3,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"jamila Update decision التصويت على قرار تعين جديد 2022-07-03 11:13 AM","current_member":{"id":2986,"meeting_id":445,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2985,"meeting_id":445,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2986,"meeting_id":445,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2987,"meeting_id":445,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2988,"meeting_id":445,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2989,"meeting_id":445,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2990,"meeting_id":445,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2991,"meeting_id":445,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2992,"meeting_id":445,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2993,"meeting_id":445,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2994,"meeting_id":445,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":322,"meeting_id":450,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":331,"meeting_id":457,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":384,"meeting_id":533,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":15,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":533,"title":"اجتماع وزارة التربيه","owner_id":75,"committee_id":3,"description":"","start_date":"2022-06-30 07:00:00","duration":60,"location":"Muscat- Ghala","meeting_status_id":3,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":null,"mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Zainab Al- Ajmi change meeting status to Live 2022-06-28 12:23 PM","current_member":{"id":3916,"meeting_id":533,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":3914,"meeting_id":533,"user_id":3,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"said.sale7@gmail.com","image":"https://test.ijtimaati.com/api/public/uploads/images/oNBWLjycUr.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3934,"meeting_id":533,"user_id":21,"user_email":"","can_edit":1,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Editor"},{"id":3935,"meeting_id":533,"user_id":26,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Omar Abdelaziz","email":"zezoomar674@yahoo.com","image":"https://test.ijtimaati.com/api/public/uploads/images/GwvmPMsKbi.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3915,"meeting_id":533,"user_id":31,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Maryam AL Rasbi","email":"Maryam@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3916,"meeting_id":533,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3917,"meeting_id":533,"user_id":38,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Hilal","email":"hilal@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/koU0KGKcAO.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3918,"meeting_id":533,"user_id":45,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mr. Abdulaziz","email":"abdulaziz@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/jdNrfSL35P.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3919,"meeting_id":533,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3920,"meeting_id":533,"user_id":60,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Rayah Al Rasbi","email":"rayah@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3921,"meeting_id":533,"user_id":71,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abeer Al Rawahi","email":"abeer@ijtimaati.com","image":null,"position":"Sales Account Manager","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3922,"meeting_id":533,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3923,"meeting_id":533,"user_id":80,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Clariza Vale","email":"clariza@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/IMRRJEPsXj.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3924,"meeting_id":533,"user_id":81,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Waleed","email":"waleed@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3925,"meeting_id":533,"user_id":83,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"andullah","email":"abdullah@globcom-oman.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3926,"meeting_id":533,"user_id":85,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Qusai Mohammed","email":"qusai@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3927,"meeting_id":533,"user_id":86,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Marwa Al Rawahi","email":"marwa@gcntoman.com","image":"https://test.ijtimaati.com/api/public/uploads/images/OjSEgHljVF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3930,"meeting_id":533,"user_id":103,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Joury","email":"hmz.942@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3932,"meeting_id":533,"user_id":106,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Thththaaa","email":"Thththaaa@hotmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}}],"talkingpointsubpoints":[],"decisions":[{"id":252,"meeting_id":443,"creator_id":75,"title":"التصويت على قرار اسناد المناقصة رقم 5","deadline":"2022-06-07 09:26:13","description":null,"created_at":"2022-05-17T05:24:28.000000Z","order":0,"talkingpoint_id":317,"mom_conclusion":null,"mom_active":1,"talkingpoint_subpoint_id":null,"laravel_through_key":458,"meeting":{"id":443,"title":"اجتماع مجلس الإدارة الثاني","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-18 09:13:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-05-18 5:09 PM","current_member":{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2974,"meeting_id":443,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2976,"meeting_id":443,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2977,"meeting_id":443,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2978,"meeting_id":443,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2979,"meeting_id":443,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2980,"meeting_id":443,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2981,"meeting_id":443,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2982,"meeting_id":443,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2983,"meeting_id":443,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}}],"actions":[]}}]
// /// assignees : [{"id":97,"approval_id":64,"user_id":21,"status":1,"order":1,"created_at":"2022-07-19T09:38:50.000000Z","updated_at":"2022-07-19T09:38:50.000000Z","user":{"id":21,"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","updated_at":"2022-07-24T22:32:00.000000Z","role_id":1,"phone":"7892343434","birthdate":"2000-08-22","team":3,"image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","status":1,"position":"cyber Security","two_auth":"1","verification_code":null,"signature":"uploads/approvals/MD3Svm3SiD.png","deleted":"0","team_name":"mesoft","role_name":"Admins","committee":[{"id":30,"name":"mesoft","description":"this committee is responsible for testing the applicatiuon","created_at":"2022-01-24T07:39:57.000000Z","updated_at":"2022-06-21T10:34:31.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":30}},{"id":34,"name":"Executive Committee","description":"","created_at":"2022-02-19T15:28:25.000000Z","updated_at":"2022-02-19T15:28:25.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":34}},{"id":36,"name":"Board Committee","description":"","created_at":"2022-03-10T06:36:00.000000Z","updated_at":"2022-03-10T06:36:00.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":36}},{"id":37,"name":"sales committee","description":"","created_at":"2022-03-13T05:03:22.000000Z","updated_at":"2022-03-23T08:10:30.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":37}},{"id":40,"name":"لجنة التحول الرقمي","description":"لجمة مختصة بتطوير البرامج المستخدمة فس الموؤسسات","created_at":"2022-03-21T05:10:29.000000Z","updated_at":"2022-03-21T05:10:29.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":40}}],"role":{"id":1,"name":"Admins","slug":"Admins","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-04-05T05:48:25.000000Z","status":"1"}},"assignee":{"id":21,"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","updated_at":"2022-07-24T22:32:00.000000Z","role_id":1,"phone":"7892343434","birthdate":"2000-08-22","team":3,"image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","status":1,"position":"cyber Security","two_auth":"1","verification_code":null,"signature":"uploads/approvals/MD3Svm3SiD.png","deleted":"0","team_name":"mesoft","role_name":"Admins","committee":[{"id":30,"name":"mesoft","description":"this committee is responsible for testing the applicatiuon","created_at":"2022-01-24T07:39:57.000000Z","updated_at":"2022-06-21T10:34:31.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":30}},{"id":34,"name":"Executive Committee","description":"","created_at":"2022-02-19T15:28:25.000000Z","updated_at":"2022-02-19T15:28:25.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":34}},{"id":36,"name":"Board Committee","description":"","created_at":"2022-03-10T06:36:00.000000Z","updated_at":"2022-03-10T06:36:00.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":36}},{"id":37,"name":"sales committee","description":"","created_at":"2022-03-13T05:03:22.000000Z","updated_at":"2022-03-23T08:10:30.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":37}},{"id":40,"name":"لجنة التحول الرقمي","description":"لجمة مختصة بتطوير البرامج المستخدمة فس الموؤسسات","created_at":"2022-03-21T05:10:29.000000Z","updated_at":"2022-03-21T05:10:29.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":40}}],"role":{"id":1,"name":"Admins","slug":"Admins","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-04-05T05:48:25.000000Z","status":"1"}}},{"id":98,"approval_id":64,"user_id":35,"status":2,"order":1,"created_at":"2022-07-19T09:38:50.000000Z","updated_at":"2022-07-24T22:36:15.000000Z","user":{"id":35,"name":"Mazin F","email":"Mazin@ijtimaati.com","updated_at":"2022-07-24T22:36:15.000000Z","role_id":1,"phone":"97038101","birthdate":"1994-04-01","team":3,"image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","status":1,"position":"IT Support","two_auth":"1","verification_code":null,"signature":"uploads/approvals/LDl7Wgsrpu.png","deleted":"0","team_name":"Jermaine Ruiz","role_name":"Admins","committee":[{"id":4,"name":"Jermaine Ruiz","description":"Fuga Nulla ea id ra","created_at":"2021-09-13T16:45:58.000000Z","updated_at":"2021-10-31T06:01:51.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":4}},{"id":8,"name":"Ijtimaati","description":"This is test","created_at":"2021-09-26T07:50:11.000000Z","updated_at":"2022-01-17T18:28:05.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":8}},{"id":34,"name":"Executive Committee","description":"","created_at":"2022-02-19T15:28:25.000000Z","updated_at":"2022-02-19T15:28:25.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":34}},{"id":37,"name":"sales committee","description":"","created_at":"2022-03-13T05:03:22.000000Z","updated_at":"2022-03-23T08:10:30.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":37}},{"id":39,"name":"Ahmed Committee","description":"This is test","created_at":"2022-03-17T08:54:42.000000Z","updated_at":"2022-03-17T08:54:42.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":39}},{"id":43,"name":"رؤية عمان 2040","description":"","created_at":"2022-04-03T04:50:24.000000Z","updated_at":"2022-04-03T04:50:24.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":43}},{"id":44,"name":"Only for testing","description":"in order to test all the functions well","created_at":"2022-06-14T10:39:53.000000Z","updated_at":"2022-06-14T10:39:53.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":44}}],"role":{"id":1,"name":"Admins","slug":"Admins","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-04-05T05:48:25.000000Z","status":"1"}},"assignee":{"id":35,"name":"Mazin F","email":"Mazin@ijtimaati.com","updated_at":"2022-07-24T22:36:15.000000Z","role_id":1,"phone":"97038101","birthdate":"1994-04-01","team":3,"image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","status":1,"position":"IT Support","two_auth":"1","verification_code":null,"signature":"uploads/approvals/LDl7Wgsrpu.png","deleted":"0","team_name":"Jermaine Ruiz","role_name":"Admins","committee":[{"id":4,"name":"Jermaine Ruiz","description":"Fuga Nulla ea id ra","created_at":"2021-09-13T16:45:58.000000Z","updated_at":"2021-10-31T06:01:51.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":4}},{"id":8,"name":"Ijtimaati","description":"This is test","created_at":"2021-09-26T07:50:11.000000Z","updated_at":"2022-01-17T18:28:05.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":8}},{"id":34,"name":"Executive Committee","description":"","created_at":"2022-02-19T15:28:25.000000Z","updated_at":"2022-02-19T15:28:25.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":34}},{"id":37,"name":"sales committee","description":"","created_at":"2022-03-13T05:03:22.000000Z","updated_at":"2022-03-23T08:10:30.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":37}},{"id":39,"name":"Ahmed Committee","description":"This is test","created_at":"2022-03-17T08:54:42.000000Z","updated_at":"2022-03-17T08:54:42.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":39}},{"id":43,"name":"رؤية عمان 2040","description":"","created_at":"2022-04-03T04:50:24.000000Z","updated_at":"2022-04-03T04:50:24.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":43}},{"id":44,"name":"Only for testing","description":"in order to test all the functions well","created_at":"2022-06-14T10:39:53.000000Z","updated_at":"2022-06-14T10:39:53.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":44}}],"role":{"id":1,"name":"Admins","slug":"Admins","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-04-05T05:48:25.000000Z","status":"1"}}},{"id":99,"approval_id":64,"user_id":75,"status":2,"order":1,"created_at":"2022-07-19T09:38:50.000000Z","updated_at":"2022-07-19T09:40:27.000000Z","user":{"id":75,"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","updated_at":"2022-07-21T07:59:14.000000Z","role_id":1,"phone":"96281874","birthdate":"1990-01-01","team":3,"image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","status":1,"position":null,"two_auth":"1","verification_code":null,"signature":"uploads/approvals/3KJUOAwy26.png","deleted":"0","team_name":"Ijtimaati Team","role_name":"Admins","committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2021-11-01T19:33:28.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":3}},{"id":36,"name":"Board Committee","description":"","created_at":"2022-03-10T06:36:00.000000Z","updated_at":"2022-03-10T06:36:00.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":36}},{"id":37,"name":"sales committee","description":"","created_at":"2022-03-13T05:03:22.000000Z","updated_at":"2022-03-23T08:10:30.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":37}},{"id":41,"name":"sales2","description":"_","created_at":"2022-03-23T08:23:21.000000Z","updated_at":"2022-03-23T08:23:21.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":41}},{"id":43,"name":"رؤية عمان 2040","description":"","created_at":"2022-04-03T04:50:24.000000Z","updated_at":"2022-04-03T04:50:24.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":43}}],"role":{"id":1,"name":"Admins","slug":"Admins","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-04-05T05:48:25.000000Z","status":"1"}},"assignee":{"id":75,"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","updated_at":"2022-07-21T07:59:14.000000Z","role_id":1,"phone":"96281874","birthdate":"1990-01-01","team":3,"image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","status":1,"position":null,"two_auth":"1","verification_code":null,"signature":"uploads/approvals/3KJUOAwy26.png","deleted":"0","team_name":"Ijtimaati Team","role_name":"Admins","committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2021-11-01T19:33:28.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":3}},{"id":36,"name":"Board Committee","description":"","created_at":"2022-03-10T06:36:00.000000Z","updated_at":"2022-03-10T06:36:00.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":36}},{"id":37,"name":"sales committee","description":"","created_at":"2022-03-13T05:03:22.000000Z","updated_at":"2022-03-23T08:10:30.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":37}},{"id":41,"name":"sales2","description":"_","created_at":"2022-03-23T08:23:21.000000Z","updated_at":"2022-03-23T08:23:21.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":41}},{"id":43,"name":"رؤية عمان 2040","description":"","created_at":"2022-04-03T04:50:24.000000Z","updated_at":"2022-04-03T04:50:24.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":43}}],"role":{"id":1,"name":"Admins","slug":"Admins","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-04-05T05:48:25.000000Z","status":"1"}}}]
//
// class SignatureResponseModel {
//   SignatureResponseModel({
//       int id,
//       String title,
//       int userId,
//       int status,
//       String createdAt,
//       String updatedAt,
//       dynamic deletedAt,
//       int committeeId,
//       Sender sender,
//       List<SignatureDocuments> documents,
//       List<Assignees> assignees,}){
//     _id = id;
//     _title = title;
//     _userId = userId;
//     _status = status;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//     _deletedAt = deletedAt;
//     _committeeId = committeeId;
//     _sender = sender;
//     _documents = documents;
//     _assignees = assignees;
// }
//
//   SignatureResponseModel.fromJson(dynamic json) {
//     _id = json['id'];
//     _title = json['title'];
//     _userId = json['user_id'];
//     _status = json['status'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//     _deletedAt = json['deleted_at'];
//     _committeeId = json['committee_id'];
//     _sender = json['sender'] != null ? Sender.fromJson(json['sender']) : null;
//     if (json['documents'] != null) {
//       _documents = [];
//       json['documents'].forEach((v) {
//         _documents.add(SignatureDocuments.fromJson(v));
//       });
//     }
//     if (json['assignees'] != null) {
//       _assignees = [];
//       json['assignees'].forEach((v) {
//         _assignees.add(Assignees.fromJson(v));
//       });
//     }
//   }
//   int _id;
//   String _title;
//   int _userId;
//   int _status;
//   String _createdAt;
//   String _updatedAt;
//   dynamic _deletedAt;
//   int _committeeId;
//   Sender _sender;
//   List<SignatureDocuments> _documents;
//   List<Assignees> _assignees;
//
//   int get id => _id;
//   String get title => _title;
//   int get userId => _userId;
//   int get status => _status;
//   String get createdAt => _createdAt;
//   String get updatedAt => _updatedAt;
//   dynamic get deletedAt => _deletedAt;
//   int get committeeId => _committeeId;
//   Sender get sender => _sender;
//   List<SignatureDocuments> get documents => _documents;
//   List<Assignees> get assignees => _assignees;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['title'] = _title;
//     map['user_id'] = _userId;
//     map['status'] = _status;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     map['deleted_at'] = _deletedAt;
//     map['committee_id'] = _committeeId;
//     if (_sender != null) {
//       map['sender'] = _sender.toJson();
//     }
//     if (_documents != null) {
//       map['documents'] = _documents.map((v) => v.toJson()).toList();
//     }
//     if (_assignees != null) {
//       map['assignees'] = _assignees.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// /// id : 97
// /// approval_id : 64
// /// user_id : 21
// /// status : 1
// /// order : 1
// /// created_at : "2022-07-19T09:38:50.000000Z"
// /// updated_at : "2022-07-19T09:38:50.000000Z"
// /// user : {"id":21,"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","updated_at":"2022-07-24T22:32:00.000000Z","role_id":1,"phone":"7892343434","birthdate":"2000-08-22","team":3,"image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","status":1,"position":"cyber Security","two_auth":"1","verification_code":null,"signature":"uploads/approvals/MD3Svm3SiD.png","deleted":"0","team_name":"mesoft","role_name":"Admins","committee":[{"id":30,"name":"mesoft","description":"this committee is responsible for testing the applicatiuon","created_at":"2022-01-24T07:39:57.000000Z","updated_at":"2022-06-21T10:34:31.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":30}},{"id":34,"name":"Executive Committee","description":"","created_at":"2022-02-19T15:28:25.000000Z","updated_at":"2022-02-19T15:28:25.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":34}},{"id":36,"name":"Board Committee","description":"","created_at":"2022-03-10T06:36:00.000000Z","updated_at":"2022-03-10T06:36:00.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":36}},{"id":37,"name":"sales committee","description":"","created_at":"2022-03-13T05:03:22.000000Z","updated_at":"2022-03-23T08:10:30.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":37}},{"id":40,"name":"لجنة التحول الرقمي","description":"لجمة مختصة بتطوير البرامج المستخدمة فس الموؤسسات","created_at":"2022-03-21T05:10:29.000000Z","updated_at":"2022-03-21T05:10:29.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":40}}],"role":{"id":1,"name":"Admins","slug":"Admins","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-04-05T05:48:25.000000Z","status":"1"}}
// /// assignee : {"id":21,"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","updated_at":"2022-07-24T22:32:00.000000Z","role_id":1,"phone":"7892343434","birthdate":"2000-08-22","team":3,"image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","status":1,"position":"cyber Security","two_auth":"1","verification_code":null,"signature":"uploads/approvals/MD3Svm3SiD.png","deleted":"0","team_name":"mesoft","role_name":"Admins","committee":[{"id":30,"name":"mesoft","description":"this committee is responsible for testing the applicatiuon","created_at":"2022-01-24T07:39:57.000000Z","updated_at":"2022-06-21T10:34:31.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":30}},{"id":34,"name":"Executive Committee","description":"","created_at":"2022-02-19T15:28:25.000000Z","updated_at":"2022-02-19T15:28:25.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":34}},{"id":36,"name":"Board Committee","description":"","created_at":"2022-03-10T06:36:00.000000Z","updated_at":"2022-03-10T06:36:00.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":36}},{"id":37,"name":"sales committee","description":"","created_at":"2022-03-13T05:03:22.000000Z","updated_at":"2022-03-23T08:10:30.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":37}},{"id":40,"name":"لجنة التحول الرقمي","description":"لجمة مختصة بتطوير البرامج المستخدمة فس الموؤسسات","created_at":"2022-03-21T05:10:29.000000Z","updated_at":"2022-03-21T05:10:29.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":40}}],"role":{"id":1,"name":"Admins","slug":"Admins","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-04-05T05:48:25.000000Z","status":"1"}}
//
// class Assignees {
//   Assignees({
//       int id,
//       int approvalId,
//       int userId,
//       int status,
//       int order,
//       String createdAt,
//       String updatedAt,
//       User user,
//       Assignee assignee,}){
//     _id = id;
//     _approvalId = approvalId;
//     _userId = userId;
//     _status = status;
//     _order = order;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//     _user = user;
//     _assignee = assignee;
// }
//
//   Assignees.fromJson(dynamic json) {
//     _id = json['id'];
//     _approvalId = json['approval_id'];
//     _userId = json['user_id'];
//     _status = json['status'];
//     _order = json['order'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//     _user = json['user'] != null ? User.fromJson(json['user']) : null;
//     _assignee = json['assignee'] != null ? Assignee.fromJson(json['assignee']) : null;
//   }
//   int _id;
//   int _approvalId;
//   int _userId;
//   int _status;
//   int _order;
//   String _createdAt;
//   String _updatedAt;
//   User _user;
//   Assignee _assignee;
//
//   int get id => _id;
//   int get approvalId => _approvalId;
//   int get userId => _userId;
//   int get status => _status;
//   int get order => _order;
//   String get createdAt => _createdAt;
//   String get updatedAt => _updatedAt;
//   User get user => _user;
//   Assignee get assignee => _assignee;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['approval_id'] = _approvalId;
//     map['user_id'] = _userId;
//     map['status'] = _status;
//     map['order'] = _order;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     if (_user != null) {
//       map['user'] = _user.toJson();
//     }
//     if (_assignee != null) {
//       map['assignee'] = _assignee.toJson();
//     }
//     return map;
//   }
//
// }
//
// /// id : 21
// /// name : "Ahmed ALReesi"
// /// email : "Ahmed@ijtimaati.com"
// /// updated_at : "2022-07-24T22:32:00.000000Z"
// /// role_id : 1
// /// phone : "7892343434"
// /// birthdate : "2000-08-22"
// /// team : 3
// /// image : "https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png"
// /// status : 1
// /// position : "cyber Security"
// /// two_auth : "1"
// /// verification_code : null
// /// signature : "uploads/approvals/MD3Svm3SiD.png"
// /// deleted : "0"
// /// team_name : "mesoft"
// /// role_name : "Admins"
// /// committee : [{"id":30,"name":"mesoft","description":"this committee is responsible for testing the applicatiuon","created_at":"2022-01-24T07:39:57.000000Z","updated_at":"2022-06-21T10:34:31.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":30}},{"id":34,"name":"Executive Committee","description":"","created_at":"2022-02-19T15:28:25.000000Z","updated_at":"2022-02-19T15:28:25.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":34}},{"id":36,"name":"Board Committee","description":"","created_at":"2022-03-10T06:36:00.000000Z","updated_at":"2022-03-10T06:36:00.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":36}},{"id":37,"name":"sales committee","description":"","created_at":"2022-03-13T05:03:22.000000Z","updated_at":"2022-03-23T08:10:30.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":37}},{"id":40,"name":"لجنة التحول الرقمي","description":"لجمة مختصة بتطوير البرامج المستخدمة فس الموؤسسات","created_at":"2022-03-21T05:10:29.000000Z","updated_at":"2022-03-21T05:10:29.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":40}}]
// /// role : {"id":1,"name":"Admins","slug":"Admins","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-04-05T05:48:25.000000Z","status":"1"}
//
// class Assignee {
//   Assignee({
//       int id,
//       String name,
//       String email,
//       String updatedAt,
//       int roleId,
//       String phone,
//       String birthdate,
//       int team,
//       String image,
//       int status,
//       String position,
//       String twoAuth,
//       dynamic verificationCode,
//       String signature,
//       String deleted,
//       String teamName,
//       String roleName,
//       List<Committee> committee,
//       Role role,}){
//     _id = id;
//     _name = name;
//     _email = email;
//     _updatedAt = updatedAt;
//     _roleId = roleId;
//     _phone = phone;
//     _birthdate = birthdate;
//     _team = team;
//     _image = image;
//     _status = status;
//     _position = position;
//     _twoAuth = twoAuth;
//     _verificationCode = verificationCode;
//     _signature = signature;
//     _deleted = deleted;
//     _teamName = teamName;
//     _roleName = roleName;
//     _committee = committee;
//     _role = role;
// }
//
//   Assignee.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//     _email = json['email'];
//     _updatedAt = json['updated_at'];
//     _roleId = json['role_id'];
//     _phone = json['phone'];
//     _birthdate = json['birthdate'];
//     _team = json['team'];
//     _image = json['image'];
//     _status = json['status'];
//     _position = json['position'];
//     _twoAuth = json['two_auth'];
//     _verificationCode = json['verification_code'];
//     _signature = json['signature'];
//     _deleted = json['deleted'];
//     _teamName = json['team_name'];
//     _roleName = json['role_name'];
//     if (json['committee'] != null) {
//       _committee = [];
//       json['committee'].forEach((v) {
//         _committee.add(Committee.fromJson(v));
//       });
//     }
//     _role = json['role'] != null ? Role.fromJson(json['role']) : null;
//   }
//   int _id;
//   String _name;
//   String _email;
//   String _updatedAt;
//   int _roleId;
//   String _phone;
//   String _birthdate;
//   int _team;
//   String _image;
//   int _status;
//   String _position;
//   String _twoAuth;
//   dynamic _verificationCode;
//   String _signature;
//   String _deleted;
//   String _teamName;
//   String _roleName;
//   List<Committee> _committee;
//   Role _role;
//
//   int get id => _id;
//   String get name => _name;
//   String get email => _email;
//   String get updatedAt => _updatedAt;
//   int get roleId => _roleId;
//   String get phone => _phone;
//   String get birthdate => _birthdate;
//   int get team => _team;
//   String get image => _image;
//   int get status => _status;
//   String get position => _position;
//   String get twoAuth => _twoAuth;
//   dynamic get verificationCode => _verificationCode;
//   String get signature => _signature;
//   String get deleted => _deleted;
//   String get teamName => _teamName;
//   String get roleName => _roleName;
//   List<Committee> get committee => _committee;
//   Role get role => _role;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     map['email'] = _email;
//     map['updated_at'] = _updatedAt;
//     map['role_id'] = _roleId;
//     map['phone'] = _phone;
//     map['birthdate'] = _birthdate;
//     map['team'] = _team;
//     map['image'] = _image;
//     map['status'] = _status;
//     map['position'] = _position;
//     map['two_auth'] = _twoAuth;
//     map['verification_code'] = _verificationCode;
//     map['signature'] = _signature;
//     map['deleted'] = _deleted;
//     map['team_name'] = _teamName;
//     map['role_name'] = _roleName;
//     if (_committee != null) {
//       map['committee'] = _committee.map((v) => v.toJson()).toList();
//     }
//     if (_role != null) {
//       map['role'] = _role.toJson();
//     }
//     return map;
//   }
//
// }
//
// /// id : 1
// /// name : "Admins"
// /// slug : "Admins"
// /// created_at : "2021-09-12T17:52:27.000000Z"
// /// updated_at : "2022-04-05T05:48:25.000000Z"
// /// status : "1"
//
// class Role {
//   Role({
//       int id,
//       String name,
//       String slug,
//       String createdAt,
//       String updatedAt,
//       String status,}){
//     _id = id;
//     _name = name;
//     _slug = slug;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//     _status = status;
// }
//
//   Role.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//     _slug = json['slug'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//     _status = json['status'];
//   }
//   int _id;
//   String _name;
//   String _slug;
//   String _createdAt;
//   String _updatedAt;
//   String _status;
//
//   int get id => _id;
//   String get name => _name;
//   String get slug => _slug;
//   String get createdAt => _createdAt;
//   String get updatedAt => _updatedAt;
//   String get status => _status;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     map['slug'] = _slug;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     map['status'] = _status;
//     return map;
//   }
//
// }
//
// /// id : 30
// /// name : "mesoft"
// /// description : "this committee is responsible for testing the applicatiuon"
// /// created_at : "2022-01-24T07:39:57.000000Z"
// /// updated_at : "2022-06-21T10:34:31.000000Z"
// /// deleted_at : null
// /// status : "1"
// /// pivot : {"user_id":21,"committee_id":30}
//
// class Committee {
//   Committee({
//       int id,
//       String name,
//       String description,
//       String createdAt,
//       String updatedAt,
//       dynamic deletedAt,
//       String status,
//       Pivot pivot,}){
//     _id = id;
//     _name = name;
//     _description = description;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//     _deletedAt = deletedAt;
//     _status = status;
//     _pivot = pivot;
// }
//
//   Committee.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//     _description = json['description'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//     _deletedAt = json['deleted_at'];
//     _status = json['status'];
//     _pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
//   }
//   int _id;
//   String _name;
//   String _description;
//   String _createdAt;
//   String _updatedAt;
//   dynamic _deletedAt;
//   String _status;
//   Pivot _pivot;
//
//   int get id => _id;
//   String get name => _name;
//   String get description => _description;
//   String get createdAt => _createdAt;
//   String get updatedAt => _updatedAt;
//   dynamic get deletedAt => _deletedAt;
//   String get status => _status;
//   Pivot get pivot => _pivot;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     map['description'] = _description;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     map['deleted_at'] = _deletedAt;
//     map['status'] = _status;
//     if (_pivot != null) {
//       map['pivot'] = _pivot.toJson();
//     }
//     return map;
//   }
//
// }
//
// /// user_id : 21
// /// committee_id : 30
//
// class Pivot {
//   Pivot({
//       int userId,
//       int committeeId,}){
//     _userId = userId;
//     _committeeId = committeeId;
// }
//
//   Pivot.fromJson(dynamic json) {
//     _userId = json['user_id'];
//     _committeeId = json['committee_id'];
//   }
//   int _userId;
//   int _committeeId;
//
//   int get userId => _userId;
//   int get committeeId => _committeeId;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['user_id'] = _userId;
//     map['committee_id'] = _committeeId;
//     return map;
//   }
//
// }
//
// /// id : 21
// /// name : "Ahmed ALReesi"
// /// email : "Ahmed@ijtimaati.com"
// /// updated_at : "2022-07-24T22:32:00.000000Z"
// /// role_id : 1
// /// phone : "7892343434"
// /// birthdate : "2000-08-22"
// /// team : 3
// /// image : "https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png"
// /// status : 1
// /// position : "cyber Security"
// /// two_auth : "1"
// /// verification_code : null
// /// signature : "uploads/approvals/MD3Svm3SiD.png"
// /// deleted : "0"
// /// team_name : "mesoft"
// /// role_name : "Admins"
// /// committee : [{"id":30,"name":"mesoft","description":"this committee is responsible for testing the applicatiuon","created_at":"2022-01-24T07:39:57.000000Z","updated_at":"2022-06-21T10:34:31.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":30}},{"id":34,"name":"Executive Committee","description":"","created_at":"2022-02-19T15:28:25.000000Z","updated_at":"2022-02-19T15:28:25.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":34}},{"id":36,"name":"Board Committee","description":"","created_at":"2022-03-10T06:36:00.000000Z","updated_at":"2022-03-10T06:36:00.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":36}},{"id":37,"name":"sales committee","description":"","created_at":"2022-03-13T05:03:22.000000Z","updated_at":"2022-03-23T08:10:30.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":37}},{"id":40,"name":"لجنة التحول الرقمي","description":"لجمة مختصة بتطوير البرامج المستخدمة فس الموؤسسات","created_at":"2022-03-21T05:10:29.000000Z","updated_at":"2022-03-21T05:10:29.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":40}}]
// /// role : {"id":1,"name":"Admins","slug":"Admins","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-04-05T05:48:25.000000Z","status":"1"}
//
// class User {
//   User({
//       int id,
//       String name,
//       String email,
//       String updatedAt,
//       int roleId,
//       String phone,
//       String birthdate,
//       int team,
//       String image,
//       int status,
//       String position,
//       String twoAuth,
//       dynamic verificationCode,
//       String signature,
//       String deleted,
//       String teamName,
//       String roleName,
//       List<Committee> committee,
//       Role role,}){
//     _id = id;
//     _name = name;
//     _email = email;
//     _updatedAt = updatedAt;
//     _roleId = roleId;
//     _phone = phone;
//     _birthdate = birthdate;
//     _team = team;
//     _image = image;
//     _status = status;
//     _position = position;
//     _twoAuth = twoAuth;
//     _verificationCode = verificationCode;
//     _signature = signature;
//     _deleted = deleted;
//     _teamName = teamName;
//     _roleName = roleName;
//     _committee = committee;
//     _role = role;
// }
//
//   User.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//     _email = json['email'];
//     _updatedAt = json['updated_at'];
//     _roleId = json['role_id'];
//     _phone = json['phone'];
//     _birthdate = json['birthdate'];
//     _team = json['team'];
//     _image = json['image'];
//     _status = json['status'];
//     _position = json['position'];
//     _twoAuth = json['two_auth'];
//     _verificationCode = json['verification_code'];
//     _signature = json['signature'];
//     _deleted = json['deleted'];
//     _teamName = json['team_name'];
//     _roleName = json['role_name'];
//     if (json['committee'] != null) {
//       _committee = [];
//       json['committee'].forEach((v) {
//         _committee.add(Committee.fromJson(v));
//       });
//     }
//     _role = json['role'] != null ? Role.fromJson(json['role']) : null;
//   }
//   int _id;
//   String _name;
//   String _email;
//   String _updatedAt;
//   int _roleId;
//   String _phone;
//   String _birthdate;
//   int _team;
//   String _image;
//   int _status;
//   String _position;
//   String _twoAuth;
//   dynamic _verificationCode;
//   String _signature;
//   String _deleted;
//   String _teamName;
//   String _roleName;
//   List<Committee> _committee;
//   Role _role;
//
//   int get id => _id;
//   String get name => _name;
//   String get email => _email;
//   String get updatedAt => _updatedAt;
//   int get roleId => _roleId;
//   String get phone => _phone;
//   String get birthdate => _birthdate;
//   int get team => _team;
//   String get image => _image;
//   int get status => _status;
//   String get position => _position;
//   String get twoAuth => _twoAuth;
//   dynamic get verificationCode => _verificationCode;
//   String get signature => _signature;
//   String get deleted => _deleted;
//   String get teamName => _teamName;
//   String get roleName => _roleName;
//   List<Committee> get committee => _committee;
//   Role get role => _role;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     map['email'] = _email;
//     map['updated_at'] = _updatedAt;
//     map['role_id'] = _roleId;
//     map['phone'] = _phone;
//     map['birthdate'] = _birthdate;
//     map['team'] = _team;
//     map['image'] = _image;
//     map['status'] = _status;
//     map['position'] = _position;
//     map['two_auth'] = _twoAuth;
//     map['verification_code'] = _verificationCode;
//     map['signature'] = _signature;
//     map['deleted'] = _deleted;
//     map['team_name'] = _teamName;
//     map['role_name'] = _roleName;
//     if (_committee != null) {
//       map['committee'] = _committee.map((v) => v.toJson()).toList();
//     }
//     if (_role != null) {
//       map['role'] = _role.toJson();
//     }
//     return map;
//   }
//
// }
//
// /// id : 1
// /// name : "Admins"
// /// slug : "Admins"
// /// created_at : "2021-09-12T17:52:27.000000Z"
// /// updated_at : "2022-04-05T05:48:25.000000Z"
// /// status : "1"
//
//
//
// /// id : 65
// /// approval_id : 64
// /// library_id : 458
// /// created_at : "2022-07-19T09:38:50.000000Z"
// /// updated_at : "2022-07-19T09:38:50.000000Z"
// /// url : null
// /// library : {"id":458,"user_id":75,"library_category_id":null,"name":"الإبداع التكنلوجي الحديث (بروفايل).pdf","type":"application/pdf","file_path":"uploads/library/1650441556710357.pdf","created_at":"2022-04-20T07:59:16.000000Z","updated_at":"2022-04-20T07:59:16.000000Z","hidden":0,"file_url":"https://test.ijtimaati.com/api/public/uploads/library/1650441556710357.pdf","size":"1.61 MB","used_in":{"talkingpoints":[{"id":293,"meeting_id":404,"creator_id":21,"title":"Agend1","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":404,"title":"test 1","owner_id":75,"committee_id":36,"description":"","start_date":"2022-04-21 11:55:00","duration":60,"location":"muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":null,"last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-04-26 11:20 AM","current_member":null,"members":[{"id":2656,"meeting_id":404,"user_id":null,"user_email":"ahmed@lamma.om","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":"b5d96273a8f24e46a7376a208dbd112e","user":null,"type":"Viewer"},{"id":2655,"meeting_id":404,"user_id":null,"user_email":"sultansalem70@gmail.com","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":"3e5ea4302f87915996dfd211563da1ea","user":null,"type":"Viewer"},{"id":2646,"meeting_id":404,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2648,"meeting_id":404,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2649,"meeting_id":404,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2650,"meeting_id":404,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2651,"meeting_id":404,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2652,"meeting_id":404,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2653,"meeting_id":404,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2654,"meeting_id":404,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":296,"meeting_id":410,"creator_id":75,"title":"sdfghj","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":410,"title":"test","owner_id":75,"committee_id":36,"description":"","start_date":"2022-04-26 12:54:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":null,"mom_conclusion":null,"library_id":null,"attendance_status":"Going","last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-04-26 11:19 AM","current_member":{"id":2683,"meeting_id":410,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2682,"meeting_id":410,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2683,"meeting_id":410,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2684,"meeting_id":410,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2685,"meeting_id":410,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Not going","status_reason":"i have another me","token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2686,"meeting_id":410,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2687,"meeting_id":410,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2688,"meeting_id":410,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2689,"meeting_id":410,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2690,"meeting_id":410,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":303,"meeting_id":426,"creator_id":75,"title":"Agenda","duration":180,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":426,"title":"test5567","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-10 10:16:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Ahmed ALReesi change meeting status to Archived 2022-05-09 1:46 PM","current_member":{"id":2757,"meeting_id":426,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2756,"meeting_id":426,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2757,"meeting_id":426,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2758,"meeting_id":426,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2759,"meeting_id":426,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2760,"meeting_id":426,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2761,"meeting_id":426,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2762,"meeting_id":426,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2763,"meeting_id":426,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2764,"meeting_id":426,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2765,"meeting_id":426,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":308,"meeting_id":437,"creator_id":75,"title":"test1","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":309,"meeting_id":437,"creator_id":75,"title":"test2","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":314,"meeting_id":443,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":443,"title":"اجتماع مجلس الإدارة الثاني","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-18 09:13:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-05-18 5:09 PM","current_member":{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2974,"meeting_id":443,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2976,"meeting_id":443,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2977,"meeting_id":443,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2978,"meeting_id":443,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2979,"meeting_id":443,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2980,"meeting_id":443,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2981,"meeting_id":443,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2982,"meeting_id":443,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2983,"meeting_id":443,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":318,"meeting_id":445,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":445,"title":"اجتماع مجلس الادارة الاول 2022","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-31 10:00:00","duration":60,"location":"المنى الرئيسي قاعة رقم 5","meeting_status_id":3,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"jamila Update decision التصويت على قرار تعين جديد 2022-07-03 11:13 AM","current_member":{"id":2986,"meeting_id":445,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2985,"meeting_id":445,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2986,"meeting_id":445,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2987,"meeting_id":445,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2988,"meeting_id":445,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2989,"meeting_id":445,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2990,"meeting_id":445,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2991,"meeting_id":445,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2992,"meeting_id":445,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2993,"meeting_id":445,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2994,"meeting_id":445,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":322,"meeting_id":450,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":331,"meeting_id":457,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":384,"meeting_id":533,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":15,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":533,"title":"اجتماع وزارة التربيه","owner_id":75,"committee_id":3,"description":"","start_date":"2022-06-30 07:00:00","duration":60,"location":"Muscat- Ghala","meeting_status_id":3,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":null,"mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Zainab Al- Ajmi change meeting status to Live 2022-06-28 12:23 PM","current_member":{"id":3916,"meeting_id":533,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":3914,"meeting_id":533,"user_id":3,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"said.sale7@gmail.com","image":"https://test.ijtimaati.com/api/public/uploads/images/oNBWLjycUr.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3934,"meeting_id":533,"user_id":21,"user_email":"","can_edit":1,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Editor"},{"id":3935,"meeting_id":533,"user_id":26,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Omar Abdelaziz","email":"zezoomar674@yahoo.com","image":"https://test.ijtimaati.com/api/public/uploads/images/GwvmPMsKbi.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3915,"meeting_id":533,"user_id":31,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Maryam AL Rasbi","email":"Maryam@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3916,"meeting_id":533,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3917,"meeting_id":533,"user_id":38,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Hilal","email":"hilal@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/koU0KGKcAO.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3918,"meeting_id":533,"user_id":45,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mr. Abdulaziz","email":"abdulaziz@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/jdNrfSL35P.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3919,"meeting_id":533,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3920,"meeting_id":533,"user_id":60,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Rayah Al Rasbi","email":"rayah@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3921,"meeting_id":533,"user_id":71,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abeer Al Rawahi","email":"abeer@ijtimaati.com","image":null,"position":"Sales Account Manager","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3922,"meeting_id":533,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3923,"meeting_id":533,"user_id":80,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Clariza Vale","email":"clariza@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/IMRRJEPsXj.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3924,"meeting_id":533,"user_id":81,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Waleed","email":"waleed@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3925,"meeting_id":533,"user_id":83,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"andullah","email":"abdullah@globcom-oman.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3926,"meeting_id":533,"user_id":85,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Qusai Mohammed","email":"qusai@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3927,"meeting_id":533,"user_id":86,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Marwa Al Rawahi","email":"marwa@gcntoman.com","image":"https://test.ijtimaati.com/api/public/uploads/images/OjSEgHljVF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3930,"meeting_id":533,"user_id":103,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Joury","email":"hmz.942@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3932,"meeting_id":533,"user_id":106,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Thththaaa","email":"Thththaaa@hotmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}}],"talkingpointsubpoints":[],"decisions":[{"id":252,"meeting_id":443,"creator_id":75,"title":"التصويت على قرار اسناد المناقصة رقم 5","deadline":"2022-06-07 09:26:13","description":null,"created_at":"2022-05-17T05:24:28.000000Z","order":0,"talkingpoint_id":317,"mom_conclusion":null,"mom_active":1,"talkingpoint_subpoint_id":null,"laravel_through_key":458,"meeting":{"id":443,"title":"اجتماع مجلس الإدارة الثاني","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-18 09:13:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-05-18 5:09 PM","current_member":{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2974,"meeting_id":443,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2976,"meeting_id":443,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2977,"meeting_id":443,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2978,"meeting_id":443,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2979,"meeting_id":443,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2980,"meeting_id":443,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2981,"meeting_id":443,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2982,"meeting_id":443,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2983,"meeting_id":443,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}}],"actions":[]},"edited_file":[{"id":28,"file_path":null,"library_id":458,"user_id":21,"meeting_id":426,"created_at":"2022-05-09T09:13:24.000000Z","updated_at":"2022-05-09T09:13:24.000000Z","edited_library_id":473}],"talkingpoints":[{"id":293,"meeting_id":404,"creator_id":21,"title":"Agend1","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":404,"title":"test 1","owner_id":75,"committee_id":36,"description":"","start_date":"2022-04-21 11:55:00","duration":60,"location":"muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":null,"last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-04-26 11:20 AM","current_member":null,"members":[{"id":2656,"meeting_id":404,"user_id":null,"user_email":"ahmed@lamma.om","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":"b5d96273a8f24e46a7376a208dbd112e","user":null,"type":"Viewer"},{"id":2655,"meeting_id":404,"user_id":null,"user_email":"sultansalem70@gmail.com","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":"3e5ea4302f87915996dfd211563da1ea","user":null,"type":"Viewer"},{"id":2646,"meeting_id":404,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2648,"meeting_id":404,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2649,"meeting_id":404,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2650,"meeting_id":404,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2651,"meeting_id":404,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2652,"meeting_id":404,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2653,"meeting_id":404,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2654,"meeting_id":404,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":296,"meeting_id":410,"creator_id":75,"title":"sdfghj","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":410,"title":"test","owner_id":75,"committee_id":36,"description":"","start_date":"2022-04-26 12:54:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":null,"mom_conclusion":null,"library_id":null,"attendance_status":"Going","last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-04-26 11:19 AM","current_member":{"id":2683,"meeting_id":410,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2682,"meeting_id":410,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2683,"meeting_id":410,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2684,"meeting_id":410,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2685,"meeting_id":410,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Not going","status_reason":"i have another me","token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2686,"meeting_id":410,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2687,"meeting_id":410,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2688,"meeting_id":410,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2689,"meeting_id":410,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2690,"meeting_id":410,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":303,"meeting_id":426,"creator_id":75,"title":"Agenda","duration":180,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":426,"title":"test5567","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-10 10:16:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Ahmed ALReesi change meeting status to Archived 2022-05-09 1:46 PM","current_member":{"id":2757,"meeting_id":426,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2756,"meeting_id":426,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2757,"meeting_id":426,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2758,"meeting_id":426,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2759,"meeting_id":426,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2760,"meeting_id":426,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2761,"meeting_id":426,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2762,"meeting_id":426,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2763,"meeting_id":426,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2764,"meeting_id":426,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2765,"meeting_id":426,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":308,"meeting_id":437,"creator_id":75,"title":"test1","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":309,"meeting_id":437,"creator_id":75,"title":"test2","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":314,"meeting_id":443,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":443,"title":"اجتماع مجلس الإدارة الثاني","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-18 09:13:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-05-18 5:09 PM","current_member":{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2974,"meeting_id":443,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2976,"meeting_id":443,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2977,"meeting_id":443,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2978,"meeting_id":443,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2979,"meeting_id":443,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2980,"meeting_id":443,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2981,"meeting_id":443,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2982,"meeting_id":443,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2983,"meeting_id":443,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":318,"meeting_id":445,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":445,"title":"اجتماع مجلس الادارة الاول 2022","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-31 10:00:00","duration":60,"location":"المنى الرئيسي قاعة رقم 5","meeting_status_id":3,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"jamila Update decision التصويت على قرار تعين جديد 2022-07-03 11:13 AM","current_member":{"id":2986,"meeting_id":445,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2985,"meeting_id":445,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2986,"meeting_id":445,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2987,"meeting_id":445,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2988,"meeting_id":445,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2989,"meeting_id":445,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2990,"meeting_id":445,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2991,"meeting_id":445,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2992,"meeting_id":445,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2993,"meeting_id":445,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2994,"meeting_id":445,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":322,"meeting_id":450,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":331,"meeting_id":457,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":384,"meeting_id":533,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":15,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":533,"title":"اجتماع وزارة التربيه","owner_id":75,"committee_id":3,"description":"","start_date":"2022-06-30 07:00:00","duration":60,"location":"Muscat- Ghala","meeting_status_id":3,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":null,"mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Zainab Al- Ajmi change meeting status to Live 2022-06-28 12:23 PM","current_member":{"id":3916,"meeting_id":533,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":3914,"meeting_id":533,"user_id":3,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"said.sale7@gmail.com","image":"https://test.ijtimaati.com/api/public/uploads/images/oNBWLjycUr.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3934,"meeting_id":533,"user_id":21,"user_email":"","can_edit":1,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Editor"},{"id":3935,"meeting_id":533,"user_id":26,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Omar Abdelaziz","email":"zezoomar674@yahoo.com","image":"https://test.ijtimaati.com/api/public/uploads/images/GwvmPMsKbi.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3915,"meeting_id":533,"user_id":31,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Maryam AL Rasbi","email":"Maryam@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3916,"meeting_id":533,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3917,"meeting_id":533,"user_id":38,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Hilal","email":"hilal@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/koU0KGKcAO.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3918,"meeting_id":533,"user_id":45,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mr. Abdulaziz","email":"abdulaziz@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/jdNrfSL35P.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3919,"meeting_id":533,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3920,"meeting_id":533,"user_id":60,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Rayah Al Rasbi","email":"rayah@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3921,"meeting_id":533,"user_id":71,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abeer Al Rawahi","email":"abeer@ijtimaati.com","image":null,"position":"Sales Account Manager","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3922,"meeting_id":533,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3923,"meeting_id":533,"user_id":80,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Clariza Vale","email":"clariza@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/IMRRJEPsXj.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3924,"meeting_id":533,"user_id":81,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Waleed","email":"waleed@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3925,"meeting_id":533,"user_id":83,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"andullah","email":"abdullah@globcom-oman.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3926,"meeting_id":533,"user_id":85,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Qusai Mohammed","email":"qusai@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3927,"meeting_id":533,"user_id":86,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Marwa Al Rawahi","email":"marwa@gcntoman.com","image":"https://test.ijtimaati.com/api/public/uploads/images/OjSEgHljVF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3930,"meeting_id":533,"user_id":103,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Joury","email":"hmz.942@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3932,"meeting_id":533,"user_id":106,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Thththaaa","email":"Thththaaa@hotmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}}],"talkingpointsubpoints":[],"decisions":[{"id":252,"meeting_id":443,"creator_id":75,"title":"التصويت على قرار اسناد المناقصة رقم 5","deadline":"2022-06-07 09:26:13","description":null,"created_at":"2022-05-17T05:24:28.000000Z","order":0,"talkingpoint_id":317,"mom_conclusion":null,"mom_active":1,"talkingpoint_subpoint_id":null,"laravel_through_key":458,"meeting":{"id":443,"title":"اجتماع مجلس الإدارة الثاني","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-18 09:13:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-05-18 5:09 PM","current_member":{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2974,"meeting_id":443,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2976,"meeting_id":443,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2977,"meeting_id":443,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2978,"meeting_id":443,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2979,"meeting_id":443,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2980,"meeting_id":443,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2981,"meeting_id":443,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2982,"meeting_id":443,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2983,"meeting_id":443,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}}],"actions":[]}
//
// class SignatureDocuments {
//   SignatureDocuments({
//       int id,
//       int approvalId,
//       int libraryId,
//       String createdAt,
//       String updatedAt,
//       dynamic url,
//       Library library,}){
//     _id = id;
//     _approvalId = approvalId;
//     _libraryId = libraryId;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//     _url = url;
//     _library = library;
// }
//
//   SignatureDocuments.fromJson(dynamic json) {
//     _id = json['id'];
//     _approvalId = json['approval_id'];
//     _libraryId = json['library_id'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//     _url = json['url'];
//     _library = json['library'] != null ? Library.fromJson(json['library']) : null;
//   }
//   int _id;
//   int _approvalId;
//   int _libraryId;
//   String _createdAt;
//   String _updatedAt;
//   dynamic _url;
//   Library _library;
//
//   int get id => _id;
//   int get approvalId => _approvalId;
//   int get libraryId => _libraryId;
//   String get createdAt => _createdAt;
//   String get updatedAt => _updatedAt;
//   dynamic get url => _url;
//   Library get library => _library;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['approval_id'] = _approvalId;
//     map['library_id'] = _libraryId;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     map['url'] = _url;
//     if (_library != null) {
//       map['library'] = _library.toJson();
//     }
//     return map;
//   }
//
// }
//
// /// id : 458
// /// user_id : 75
// /// library_category_id : null
// /// name : "الإبداع التكنلوجي الحديث (بروفايل).pdf"
// /// type : "application/pdf"
// /// file_path : "uploads/library/1650441556710357.pdf"
// /// created_at : "2022-04-20T07:59:16.000000Z"
// /// updated_at : "2022-04-20T07:59:16.000000Z"
// /// hidden : 0
// /// file_url : "https://test.ijtimaati.com/api/public/uploads/library/1650441556710357.pdf"
// /// size : "1.61 MB"
// /// used_in : {"talkingpoints":[{"id":293,"meeting_id":404,"creator_id":21,"title":"Agend1","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":404,"title":"test 1","owner_id":75,"committee_id":36,"description":"","start_date":"2022-04-21 11:55:00","duration":60,"location":"muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":null,"last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-04-26 11:20 AM","current_member":null,"members":[{"id":2656,"meeting_id":404,"user_id":null,"user_email":"ahmed@lamma.om","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":"b5d96273a8f24e46a7376a208dbd112e","user":null,"type":"Viewer"},{"id":2655,"meeting_id":404,"user_id":null,"user_email":"sultansalem70@gmail.com","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":"3e5ea4302f87915996dfd211563da1ea","user":null,"type":"Viewer"},{"id":2646,"meeting_id":404,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2648,"meeting_id":404,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2649,"meeting_id":404,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2650,"meeting_id":404,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2651,"meeting_id":404,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2652,"meeting_id":404,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2653,"meeting_id":404,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2654,"meeting_id":404,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":296,"meeting_id":410,"creator_id":75,"title":"sdfghj","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":410,"title":"test","owner_id":75,"committee_id":36,"description":"","start_date":"2022-04-26 12:54:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":null,"mom_conclusion":null,"library_id":null,"attendance_status":"Going","last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-04-26 11:19 AM","current_member":{"id":2683,"meeting_id":410,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2682,"meeting_id":410,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2683,"meeting_id":410,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2684,"meeting_id":410,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2685,"meeting_id":410,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Not going","status_reason":"i have another me","token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2686,"meeting_id":410,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2687,"meeting_id":410,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2688,"meeting_id":410,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2689,"meeting_id":410,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2690,"meeting_id":410,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":303,"meeting_id":426,"creator_id":75,"title":"Agenda","duration":180,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":426,"title":"test5567","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-10 10:16:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Ahmed ALReesi change meeting status to Archived 2022-05-09 1:46 PM","current_member":{"id":2757,"meeting_id":426,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2756,"meeting_id":426,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2757,"meeting_id":426,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2758,"meeting_id":426,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2759,"meeting_id":426,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2760,"meeting_id":426,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2761,"meeting_id":426,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2762,"meeting_id":426,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2763,"meeting_id":426,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2764,"meeting_id":426,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2765,"meeting_id":426,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":308,"meeting_id":437,"creator_id":75,"title":"test1","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":309,"meeting_id":437,"creator_id":75,"title":"test2","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":314,"meeting_id":443,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":443,"title":"اجتماع مجلس الإدارة الثاني","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-18 09:13:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-05-18 5:09 PM","current_member":{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2974,"meeting_id":443,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2976,"meeting_id":443,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2977,"meeting_id":443,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2978,"meeting_id":443,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2979,"meeting_id":443,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2980,"meeting_id":443,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2981,"meeting_id":443,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2982,"meeting_id":443,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2983,"meeting_id":443,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":318,"meeting_id":445,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":445,"title":"اجتماع مجلس الادارة الاول 2022","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-31 10:00:00","duration":60,"location":"المنى الرئيسي قاعة رقم 5","meeting_status_id":3,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"jamila Update decision التصويت على قرار تعين جديد 2022-07-03 11:13 AM","current_member":{"id":2986,"meeting_id":445,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2985,"meeting_id":445,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2986,"meeting_id":445,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2987,"meeting_id":445,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2988,"meeting_id":445,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2989,"meeting_id":445,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2990,"meeting_id":445,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2991,"meeting_id":445,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2992,"meeting_id":445,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2993,"meeting_id":445,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2994,"meeting_id":445,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":322,"meeting_id":450,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":331,"meeting_id":457,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":384,"meeting_id":533,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":15,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":533,"title":"اجتماع وزارة التربيه","owner_id":75,"committee_id":3,"description":"","start_date":"2022-06-30 07:00:00","duration":60,"location":"Muscat- Ghala","meeting_status_id":3,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":null,"mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Zainab Al- Ajmi change meeting status to Live 2022-06-28 12:23 PM","current_member":{"id":3916,"meeting_id":533,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":3914,"meeting_id":533,"user_id":3,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"said.sale7@gmail.com","image":"https://test.ijtimaati.com/api/public/uploads/images/oNBWLjycUr.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3934,"meeting_id":533,"user_id":21,"user_email":"","can_edit":1,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Editor"},{"id":3935,"meeting_id":533,"user_id":26,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Omar Abdelaziz","email":"zezoomar674@yahoo.com","image":"https://test.ijtimaati.com/api/public/uploads/images/GwvmPMsKbi.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3915,"meeting_id":533,"user_id":31,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Maryam AL Rasbi","email":"Maryam@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3916,"meeting_id":533,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3917,"meeting_id":533,"user_id":38,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Hilal","email":"hilal@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/koU0KGKcAO.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3918,"meeting_id":533,"user_id":45,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mr. Abdulaziz","email":"abdulaziz@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/jdNrfSL35P.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3919,"meeting_id":533,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3920,"meeting_id":533,"user_id":60,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Rayah Al Rasbi","email":"rayah@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3921,"meeting_id":533,"user_id":71,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abeer Al Rawahi","email":"abeer@ijtimaati.com","image":null,"position":"Sales Account Manager","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3922,"meeting_id":533,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3923,"meeting_id":533,"user_id":80,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Clariza Vale","email":"clariza@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/IMRRJEPsXj.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3924,"meeting_id":533,"user_id":81,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Waleed","email":"waleed@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3925,"meeting_id":533,"user_id":83,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"andullah","email":"abdullah@globcom-oman.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3926,"meeting_id":533,"user_id":85,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Qusai Mohammed","email":"qusai@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3927,"meeting_id":533,"user_id":86,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Marwa Al Rawahi","email":"marwa@gcntoman.com","image":"https://test.ijtimaati.com/api/public/uploads/images/OjSEgHljVF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3930,"meeting_id":533,"user_id":103,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Joury","email":"hmz.942@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3932,"meeting_id":533,"user_id":106,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Thththaaa","email":"Thththaaa@hotmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}}],"talkingpointsubpoints":[],"decisions":[{"id":252,"meeting_id":443,"creator_id":75,"title":"التصويت على قرار اسناد المناقصة رقم 5","deadline":"2022-06-07 09:26:13","description":null,"created_at":"2022-05-17T05:24:28.000000Z","order":0,"talkingpoint_id":317,"mom_conclusion":null,"mom_active":1,"talkingpoint_subpoint_id":null,"laravel_through_key":458,"meeting":{"id":443,"title":"اجتماع مجلس الإدارة الثاني","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-18 09:13:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-05-18 5:09 PM","current_member":{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2974,"meeting_id":443,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2976,"meeting_id":443,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2977,"meeting_id":443,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2978,"meeting_id":443,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2979,"meeting_id":443,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2980,"meeting_id":443,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2981,"meeting_id":443,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2982,"meeting_id":443,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2983,"meeting_id":443,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}}],"actions":[]}
// /// edited_file : [{"id":28,"file_path":null,"library_id":458,"user_id":21,"meeting_id":426,"created_at":"2022-05-09T09:13:24.000000Z","updated_at":"2022-05-09T09:13:24.000000Z","edited_library_id":473}]
// /// talkingpoints : [{"id":293,"meeting_id":404,"creator_id":21,"title":"Agend1","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":404,"title":"test 1","owner_id":75,"committee_id":36,"description":"","start_date":"2022-04-21 11:55:00","duration":60,"location":"muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":null,"last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-04-26 11:20 AM","current_member":null,"members":[{"id":2656,"meeting_id":404,"user_id":null,"user_email":"ahmed@lamma.om","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":"b5d96273a8f24e46a7376a208dbd112e","user":null,"type":"Viewer"},{"id":2655,"meeting_id":404,"user_id":null,"user_email":"sultansalem70@gmail.com","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":"3e5ea4302f87915996dfd211563da1ea","user":null,"type":"Viewer"},{"id":2646,"meeting_id":404,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2648,"meeting_id":404,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2649,"meeting_id":404,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2650,"meeting_id":404,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2651,"meeting_id":404,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2652,"meeting_id":404,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2653,"meeting_id":404,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2654,"meeting_id":404,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":296,"meeting_id":410,"creator_id":75,"title":"sdfghj","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":410,"title":"test","owner_id":75,"committee_id":36,"description":"","start_date":"2022-04-26 12:54:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":null,"mom_conclusion":null,"library_id":null,"attendance_status":"Going","last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-04-26 11:19 AM","current_member":{"id":2683,"meeting_id":410,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2682,"meeting_id":410,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2683,"meeting_id":410,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2684,"meeting_id":410,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2685,"meeting_id":410,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Not going","status_reason":"i have another me","token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2686,"meeting_id":410,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2687,"meeting_id":410,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2688,"meeting_id":410,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2689,"meeting_id":410,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2690,"meeting_id":410,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":303,"meeting_id":426,"creator_id":75,"title":"Agenda","duration":180,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":426,"title":"test5567","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-10 10:16:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Ahmed ALReesi change meeting status to Archived 2022-05-09 1:46 PM","current_member":{"id":2757,"meeting_id":426,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2756,"meeting_id":426,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2757,"meeting_id":426,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2758,"meeting_id":426,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2759,"meeting_id":426,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2760,"meeting_id":426,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2761,"meeting_id":426,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2762,"meeting_id":426,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2763,"meeting_id":426,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2764,"meeting_id":426,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2765,"meeting_id":426,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":308,"meeting_id":437,"creator_id":75,"title":"test1","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":309,"meeting_id":437,"creator_id":75,"title":"test2","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":314,"meeting_id":443,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":443,"title":"اجتماع مجلس الإدارة الثاني","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-18 09:13:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-05-18 5:09 PM","current_member":{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2974,"meeting_id":443,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2976,"meeting_id":443,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2977,"meeting_id":443,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2978,"meeting_id":443,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2979,"meeting_id":443,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2980,"meeting_id":443,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2981,"meeting_id":443,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2982,"meeting_id":443,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2983,"meeting_id":443,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":318,"meeting_id":445,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":445,"title":"اجتماع مجلس الادارة الاول 2022","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-31 10:00:00","duration":60,"location":"المنى الرئيسي قاعة رقم 5","meeting_status_id":3,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"jamila Update decision التصويت على قرار تعين جديد 2022-07-03 11:13 AM","current_member":{"id":2986,"meeting_id":445,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2985,"meeting_id":445,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2986,"meeting_id":445,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2987,"meeting_id":445,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2988,"meeting_id":445,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2989,"meeting_id":445,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2990,"meeting_id":445,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2991,"meeting_id":445,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2992,"meeting_id":445,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2993,"meeting_id":445,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2994,"meeting_id":445,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}},{"id":322,"meeting_id":450,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":331,"meeting_id":457,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":45,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":null},{"id":384,"meeting_id":533,"creator_id":75,"title":"مناقشة الاجتماع السابق","duration":15,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":458,"meeting":{"id":533,"title":"اجتماع وزارة التربيه","owner_id":75,"committee_id":3,"description":"","start_date":"2022-06-30 07:00:00","duration":60,"location":"Muscat- Ghala","meeting_status_id":3,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":null,"mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Zainab Al- Ajmi change meeting status to Live 2022-06-28 12:23 PM","current_member":{"id":3916,"meeting_id":533,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":3914,"meeting_id":533,"user_id":3,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"said.sale7@gmail.com","image":"https://test.ijtimaati.com/api/public/uploads/images/oNBWLjycUr.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3934,"meeting_id":533,"user_id":21,"user_email":"","can_edit":1,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Editor"},{"id":3935,"meeting_id":533,"user_id":26,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Omar Abdelaziz","email":"zezoomar674@yahoo.com","image":"https://test.ijtimaati.com/api/public/uploads/images/GwvmPMsKbi.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3915,"meeting_id":533,"user_id":31,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Maryam AL Rasbi","email":"Maryam@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3916,"meeting_id":533,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3917,"meeting_id":533,"user_id":38,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Hilal","email":"hilal@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/koU0KGKcAO.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3918,"meeting_id":533,"user_id":45,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mr. Abdulaziz","email":"abdulaziz@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/jdNrfSL35P.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3919,"meeting_id":533,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3920,"meeting_id":533,"user_id":60,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Rayah Al Rasbi","email":"rayah@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3921,"meeting_id":533,"user_id":71,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abeer Al Rawahi","email":"abeer@ijtimaati.com","image":null,"position":"Sales Account Manager","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3922,"meeting_id":533,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3923,"meeting_id":533,"user_id":80,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Clariza Vale","email":"clariza@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/IMRRJEPsXj.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3924,"meeting_id":533,"user_id":81,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Waleed","email":"waleed@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3925,"meeting_id":533,"user_id":83,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"andullah","email":"abdullah@globcom-oman.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3926,"meeting_id":533,"user_id":85,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Qusai Mohammed","email":"qusai@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3927,"meeting_id":533,"user_id":86,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Marwa Al Rawahi","email":"marwa@gcntoman.com","image":"https://test.ijtimaati.com/api/public/uploads/images/OjSEgHljVF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3930,"meeting_id":533,"user_id":103,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Joury","email":"hmz.942@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":3932,"meeting_id":533,"user_id":106,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Thththaaa","email":"Thththaaa@hotmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}}]
// /// talkingpointsubpoints : []
// /// decisions : [{"id":252,"meeting_id":443,"creator_id":75,"title":"التصويت على قرار اسناد المناقصة رقم 5","deadline":"2022-06-07 09:26:13","description":null,"created_at":"2022-05-17T05:24:28.000000Z","order":0,"talkingpoint_id":317,"mom_conclusion":null,"mom_active":1,"talkingpoint_subpoint_id":null,"laravel_through_key":458,"meeting":{"id":443,"title":"اجتماع مجلس الإدارة الثاني","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-18 09:13:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-05-18 5:09 PM","current_member":{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2974,"meeting_id":443,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2976,"meeting_id":443,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2977,"meeting_id":443,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2978,"meeting_id":443,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2979,"meeting_id":443,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2980,"meeting_id":443,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2981,"meeting_id":443,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2982,"meeting_id":443,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2983,"meeting_id":443,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}}]
// /// actions : []
//
// class Library {
//   Library({
//       int id,
//       int userId,
//       dynamic libraryCategoryId,
//       String name,
//       String type,
//       String filePath,
//       String createdAt,
//       String updatedAt,
//       int hidden,
//       String fileUrl,
//       String size,
//       UsedIn usedIn,
//       List<EditedFile> editedFile,
//       List<Talkingpoints> talkingpoints,
//       List<dynamic> talkingpointsubpoints,
//       List<Decisions> decisions,
//       List<dynamic> actions,}){
//     _id = id;
//     _userId = userId;
//     _libraryCategoryId = libraryCategoryId;
//     _name = name;
//     _type = type;
//     _filePath = filePath;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//     _hidden = hidden;
//     _fileUrl = fileUrl;
//     _size = size;
//     _usedIn = usedIn;
//     _editedFile = editedFile;
//     _talkingpoints = talkingpoints;
//     _talkingpointsubpoints = talkingpointsubpoints;
//     _decisions = decisions;
//     _actions = actions;
// }
//
//   Library.fromJson(dynamic json) {
//     _id = json['id'];
//     _userId = json['user_id'];
//     _libraryCategoryId = json['library_category_id'];
//     _name = json['name'];
//     _type = json['type'];
//     _filePath = json['file_path'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//     _hidden = json['hidden'];
//     _fileUrl = json['file_url'];
//     _size = json['size'];
//     _usedIn = json['used_in'] != null ? UsedIn.fromJson(json['usedIn']) : null;
//     if (json['edited_file'] != null) {
//       _editedFile = [];
//       json['edited_file'].forEach((v) {
//         _editedFile.add(EditedFile.fromJson(v));
//       });
//     }
//     if (json['talkingpoints'] != null) {
//       _talkingpoints = [];
//       json['talkingpoints'].forEach((v) {
//         _talkingpoints.add(Talkingpoints.fromJson(v));
//       });
//     }
//     if (json['talkingpointsubpoints'] != null) {
//       _talkingpointsubpoints = [];
//       json['talkingpointsubpoints'].forEach((v) {
//         _talkingpointsubpoints.add(Talkingpoints.fromJson(v));
//       });
//     }
//     if (json['decisions'] != null) {
//       _decisions = [];
//       json['decisions'].forEach((v) {
//         _decisions.add(Decisions.fromJson(v));
//       });
//     }
//     if (json['actions'] != null) {
//       _actions = [];
//       json['actions'].forEach((v) {
//         // _actions.add(Dynamic.fromJson(v));
//       });
//     }
//   }
//   int _id;
//   int _userId;
//   dynamic _libraryCategoryId;
//   String _name;
//   String _type;
//   String _filePath;
//   String _createdAt;
//   String _updatedAt;
//   int _hidden;
//   String _fileUrl;
//   String _size;
//   UsedIn _usedIn;
//   List<EditedFile> _editedFile;
//   List<Talkingpoints> _talkingpoints;
//   List<dynamic> _talkingpointsubpoints;
//   List<Decisions> _decisions;
//   List<dynamic> _actions;
//
//   int get id => _id;
//   int get userId => _userId;
//   dynamic get libraryCategoryId => _libraryCategoryId;
//   String get name => _name;
//   String get type => _type;
//   String get filePath => _filePath;
//   String get createdAt => _createdAt;
//   String get updatedAt => _updatedAt;
//   int get hidden => _hidden;
//   String get fileUrl => _fileUrl;
//   String get size => _size;
//   UsedIn get usedIn => _usedIn;
//   List<EditedFile> get editedFile => _editedFile;
//   List<Talkingpoints> get talkingpoints => _talkingpoints;
//   List<dynamic> get talkingpointsubpoints => _talkingpointsubpoints;
//   List<Decisions> get decisions => _decisions;
//   List<dynamic> get actions => _actions;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['user_id'] = _userId;
//     map['library_category_id'] = _libraryCategoryId;
//     map['name'] = _name;
//     map['type'] = _type;
//     map['file_path'] = _filePath;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     map['hidden'] = _hidden;
//     map['file_url'] = _fileUrl;
//     map['size'] = _size;
//     if (_usedIn != null) {
//       map['used_in'] = _usedIn.toJson();
//     }
//     if (_editedFile != null) {
//       map['edited_file'] = _editedFile.map((v) => v.toJson()).toList();
//     }
//     if (_talkingpoints != null) {
//       map['talkingpoints'] = _talkingpoints.map((v) => v.toJson()).toList();
//     }
//     if (_talkingpointsubpoints != null) {
//       map['talkingpointsubpoints'] = _talkingpointsubpoints.map((v) => v.toJson()).toList();
//     }
//     if (_decisions != null) {
//       map['decisions'] = _decisions.map((v) => v.toJson()).toList();
//     }
//     if (_actions != null) {
//       map['actions'] = _actions.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// /// id : 252
// /// meeting_id : 443
// /// creator_id : 75
// /// title : "التصويت على قرار اسناد المناقصة رقم 5"
// /// deadline : "2022-06-07 09:26:13"
// /// description : null
// /// created_at : "2022-05-17T05:24:28.000000Z"
// /// order : 0
// /// talkingpoint_id : 317
// /// mom_conclusion : null
// /// mom_active : 1
// /// talkingpoint_subpoint_id : null
// /// laravel_through_key : 458
// /// meeting : {"id":443,"title":"اجتماع مجلس الإدارة الثاني","owner_id":75,"committee_id":36,"description":"","start_date":"2022-05-18 09:13:00","duration":60,"location":"Muscat","meeting_status_id":5,"virtual":1,"order":"TalkingPoints,Decisions,Actions","virtual_type":"ijmeet","mom":null,"mom_settings":"1","mom_conclusion":null,"library_id":null,"attendance_status":"Pending","last_activity":"Zainab Al- Ajmi change meeting status to Archived 2022-05-18 5:09 PM","current_member":{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":2974,"meeting_id":443,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2976,"meeting_id":443,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2977,"meeting_id":443,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2978,"meeting_id":443,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2979,"meeting_id":443,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2980,"meeting_id":443,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2981,"meeting_id":443,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2982,"meeting_id":443,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2983,"meeting_id":443,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}
//
// class UsedIn {
//   UsedIn({
//     List<Talkingpoints> talkingpoints,
//     List<dynamic> talkingpointsubpoints,
//     List<Decisions> decisions,
//     List<dynamic> actions,}){
//     _talkingpoints = talkingpoints;
//     _talkingpointsubpoints = talkingpointsubpoints;
//     _decisions = decisions;
//     _actions = actions;
//   }
//
//   UsedIn.fromJson(dynamic json) {
//     if (json['talkingpoints'] != null) {
//       _talkingpoints = [];
//       json['talkingpoints'].forEach((v) {
//         _talkingpoints.add(Talkingpoints.fromJson(v));
//       });
//     }
//     if (json['talkingpointsubpoints'] != null) {
//       _talkingpointsubpoints = [];
//       json['talkingpointsubpoints'].forEach((v) {
//         _talkingpointsubpoints.add(Talkingpoints.fromJson(v));
//       });
//     }
//     if (json['decisions'] != null) {
//       _decisions = [];
//       json['decisions'].forEach((v) {
//         _decisions.add(Decisions.fromJson(v));
//       });
//     }
//     if (json['actions'] != null) {
//       _actions = [];
//       json['actions'].forEach((v) {
//         // _actions.add(Dynamic.fromJson(v));
//       });
//     }
//   }
//   List<Talkingpoints> _talkingpoints;
//   List<dynamic> _talkingpointsubpoints;
//   List<Decisions> _decisions;
//   List<dynamic> _actions;
//
//   List<Talkingpoints> get talkingpoints => _talkingpoints;
//   List<dynamic> get talkingpointsubpoints => _talkingpointsubpoints;
//   List<Decisions> get decisions => _decisions;
//   List<dynamic> get actions => _actions;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (_talkingpoints != null) {
//       map['talkingpoints'] = _talkingpoints.map((v) => v.toJson()).toList();
//     }
//     if (_talkingpointsubpoints != null) {
//       map['talkingpointsubpoints'] = _talkingpointsubpoints.map((v) => v.toJson()).toList();
//     }
//     if (_decisions != null) {
//       map['decisions'] = _decisions.map((v) => v.toJson()).toList();
//     }
//     if (_actions != null) {
//       map['actions'] = _actions.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// class Decisions {
//   Decisions({
//       int id,
//       int meetingId,
//       int creatorId,
//       String title,
//       String deadline,
//       dynamic description,
//       String createdAt,
//       int order,
//       int talkingpointId,
//       dynamic momConclusion,
//       int momActive,
//       dynamic talkingpointSubpointId,
//       int laravelThroughKey,
//       Meeting meeting,}){
//     _id = id;
//     _meetingId = meetingId;
//     _creatorId = creatorId;
//     _title = title;
//     _deadline = deadline;
//     _description = description;
//     _createdAt = createdAt;
//     _order = order;
//     _talkingpointId = talkingpointId;
//     _momConclusion = momConclusion;
//     _momActive = momActive;
//     _talkingpointSubpointId = talkingpointSubpointId;
//     _laravelThroughKey = laravelThroughKey;
//     _meeting = meeting;
// }
//
//   Decisions.fromJson(dynamic json) {
//     _id = json['id'];
//     _meetingId = json['meeting_id'];
//     _creatorId = json['creator_id'];
//     _title = json['title'];
//     _deadline = json['deadline'];
//     _description = json['description'];
//     _createdAt = json['created_at'];
//     _order = json['order'];
//     _talkingpointId = json['talkingpoint_id'];
//     _momConclusion = json['mom_conclusion'];
//     _momActive = json['mom_active'];
//     _talkingpointSubpointId = json['talkingpoint_subpoint_id'];
//     _laravelThroughKey = json['laravel_through_key'];
//     _meeting = json['meeting'] != null ? Meeting.fromJson(json['meeting']) : null;
//   }
//   int _id;
//   int _meetingId;
//   int _creatorId;
//   String _title;
//   String _deadline;
//   dynamic _description;
//   String _createdAt;
//   int _order;
//   int _talkingpointId;
//   dynamic _momConclusion;
//   int _momActive;
//   dynamic _talkingpointSubpointId;
//   int _laravelThroughKey;
//   Meeting _meeting;
//
//   int get id => _id;
//   int get meetingId => _meetingId;
//   int get creatorId => _creatorId;
//   String get title => _title;
//   String get deadline => _deadline;
//   dynamic get description => _description;
//   String get createdAt => _createdAt;
//   int get order => _order;
//   int get talkingpointId => _talkingpointId;
//   dynamic get momConclusion => _momConclusion;
//   int get momActive => _momActive;
//   dynamic get talkingpointSubpointId => _talkingpointSubpointId;
//   int get laravelThroughKey => _laravelThroughKey;
//   Meeting get meeting => _meeting;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['meeting_id'] = _meetingId;
//     map['creator_id'] = _creatorId;
//     map['title'] = _title;
//     map['deadline'] = _deadline;
//     map['description'] = _description;
//     map['created_at'] = _createdAt;
//     map['order'] = _order;
//     map['talkingpoint_id'] = _talkingpointId;
//     map['mom_conclusion'] = _momConclusion;
//     map['mom_active'] = _momActive;
//     map['talkingpoint_subpoint_id'] = _talkingpointSubpointId;
//     map['laravel_through_key'] = _laravelThroughKey;
//     if (_meeting != null) {
//       map['meeting'] = _meeting.toJson();
//     }
//     return map;
//   }
//
// }
//
// /// id : 443
// /// title : "اجتماع مجلس الإدارة الثاني"
// /// owner_id : 75
// /// committee_id : 36
// /// description : ""
// /// start_date : "2022-05-18 09:13:00"
// /// duration : 60
// /// location : "Muscat"
// /// meeting_status_id : 5
// /// virtual : 1
// /// order : "TalkingPoints,Decisions,Actions"
// /// virtual_type : "ijmeet"
// /// mom : null
// /// mom_settings : "1"
// /// mom_conclusion : null
// /// library_id : null
// /// attendance_status : "Pending"
// /// last_activity : "Zainab Al- Ajmi change meeting status to Archived 2022-05-18 5:09 PM"
// /// current_member : {"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}
// /// members : [{"id":2974,"meeting_id":443,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2975,"meeting_id":443,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2976,"meeting_id":443,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2977,"meeting_id":443,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2978,"meeting_id":443,"user_id":89,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2979,"meeting_id":443,"user_id":93,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/esSP3HHW0M.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2980,"meeting_id":443,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2981,"meeting_id":443,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2982,"meeting_id":443,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":2983,"meeting_id":443,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]
//
// class Meeting {
//   Meeting({
//       int id,
//       String title,
//       int ownerId,
//       int committeeId,
//       String description,
//       String startDate,
//       int duration,
//       String location,
//       int meetingStatusId,
//       int virtual,
//       String order,
//       String virtualType,
//       dynamic mom,
//       String momSettings,
//       dynamic momConclusion,
//       dynamic libraryId,
//       String attendanceStatus,
//       String lastActivity,
//       CurrentMember currentMember,
//       List<Members> members,}){
//     _id = id;
//     _title = title;
//     _ownerId = ownerId;
//     _committeeId = committeeId;
//     _description = description;
//     _startDate = startDate;
//     _duration = duration;
//     _location = location;
//     _meetingStatusId = meetingStatusId;
//     _virtual = virtual;
//     _order = order;
//     _virtualType = virtualType;
//     _mom = mom;
//     _momSettings = momSettings;
//     _momConclusion = momConclusion;
//     _libraryId = libraryId;
//     _attendanceStatus = attendanceStatus;
//     _lastActivity = lastActivity;
//     _currentMember = currentMember;
//     _members = members;
// }
//
//   Meeting.fromJson(dynamic json) {
//     _id = json['id'];
//     _title = json['title'];
//     _ownerId = json['owner_id'];
//     _committeeId = json['committee_id'];
//     _description = json['description'];
//     _startDate = json['start_date'];
//     _duration = json['duration'];
//     _location = json['location'];
//     _meetingStatusId = json['meeting_status_id'];
//     _virtual = json['virtual'];
//     _order = json['order'];
//     _virtualType = json['virtual_type'];
//     _mom = json['mom'];
//     _momSettings = json['mom_settings'];
//     _momConclusion = json['mom_conclusion'];
//     _libraryId = json['library_id'];
//     _attendanceStatus = json['attendance_status'];
//     _lastActivity = json['last_activity'];
//     _currentMember = json['current_member'] != null ? CurrentMember.fromJson(json['currentMember']) : null;
//     if (json['members'] != null) {
//       _members = [];
//       json['members'].forEach((v) {
//         _members.add(Members.fromJson(v));
//       });
//     }
//   }
//   int _id;
//   String _title;
//   int _ownerId;
//   int _committeeId;
//   String _description;
//   String _startDate;
//   int _duration;
//   String _location;
//   int _meetingStatusId;
//   int _virtual;
//   String _order;
//   String _virtualType;
//   dynamic _mom;
//   String _momSettings;
//   dynamic _momConclusion;
//   dynamic _libraryId;
//   String _attendanceStatus;
//   String _lastActivity;
//   CurrentMember _currentMember;
//   List<Members> _members;
//
//   int get id => _id;
//   String get title => _title;
//   int get ownerId => _ownerId;
//   int get committeeId => _committeeId;
//   String get description => _description;
//   String get startDate => _startDate;
//   int get duration => _duration;
//   String get location => _location;
//   int get meetingStatusId => _meetingStatusId;
//   int get virtual => _virtual;
//   String get order => _order;
//   String get virtualType => _virtualType;
//   dynamic get mom => _mom;
//   String get momSettings => _momSettings;
//   dynamic get momConclusion => _momConclusion;
//   dynamic get libraryId => _libraryId;
//   String get attendanceStatus => _attendanceStatus;
//   String get lastActivity => _lastActivity;
//   CurrentMember get currentMember => _currentMember;
//   List<Members> get members => _members;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['title'] = _title;
//     map['owner_id'] = _ownerId;
//     map['committee_id'] = _committeeId;
//     map['description'] = _description;
//     map['start_date'] = _startDate;
//     map['duration'] = _duration;
//     map['location'] = _location;
//     map['meeting_status_id'] = _meetingStatusId;
//     map['virtual'] = _virtual;
//     map['order'] = _order;
//     map['virtual_type'] = _virtualType;
//     map['mom'] = _mom;
//     map['mom_settings'] = _momSettings;
//     map['mom_conclusion'] = _momConclusion;
//     map['library_id'] = _libraryId;
//     map['attendance_status'] = _attendanceStatus;
//     map['last_activity'] = _lastActivity;
//     if (_currentMember != null) {
//       map['current_member'] = _currentMember.toJson();
//     }
//     if (_members != null) {
//       map['members'] = _members.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// /// id : 2974
// /// meeting_id : 443
// /// user_id : 21
// /// user_email : ""
// /// can_edit : 0
// /// attendance_status : "Pending"
// /// status_reason : null
// /// token : null
// /// user : {"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null}
// /// type : "Viewer"
//
// class Members {
//   Members({
//       int id,
//       int meetingId,
//       int userId,
//       String userEmail,
//       int canEdit,
//       String attendanceStatus,
//       dynamic statusReason,
//       dynamic token,
//       User user,
//       String type,}){
//     _id = id;
//     _meetingId = meetingId;
//     _userId = userId;
//     _userEmail = userEmail;
//     _canEdit = canEdit;
//     _attendanceStatus = attendanceStatus;
//     _statusReason = statusReason;
//     _token = token;
//     _user = user;
//     _type = type;
// }
//
//   Members.fromJson(dynamic json) {
//     _id = json['id'];
//     _meetingId = json['meeting_id'];
//     _userId = json['user_id'];
//     _userEmail = json['user_email'];
//     _canEdit = json['can_edit'];
//     _attendanceStatus = json['attendance_status'];
//     _statusReason = json['status_reason'];
//     _token = json['token'];
//     _user = json['user'] != null ? User.fromJson(json['user']) : null;
//     _type = json['type'];
//   }
//   int _id;
//   int _meetingId;
//   int _userId;
//   String _userEmail;
//   int _canEdit;
//   String _attendanceStatus;
//   dynamic _statusReason;
//   dynamic _token;
//   User _user;
//   String _type;
//
//   int get id => _id;
//   int get meetingId => _meetingId;
//   int get userId => _userId;
//   String get userEmail => _userEmail;
//   int get canEdit => _canEdit;
//   String get attendanceStatus => _attendanceStatus;
//   dynamic get statusReason => _statusReason;
//   dynamic get token => _token;
//   User get user => _user;
//   String get type => _type;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['meeting_id'] = _meetingId;
//     map['user_id'] = _userId;
//     map['user_email'] = _userEmail;
//     map['can_edit'] = _canEdit;
//     map['attendance_status'] = _attendanceStatus;
//     map['status_reason'] = _statusReason;
//     map['token'] = _token;
//     if (_user != null) {
//       map['user'] = _user.toJson();
//     }
//     map['type'] = _type;
//     return map;
//   }
//
// }
//
//
//
// /// id : 2975
// /// meeting_id : 443
// /// user_id : 35
// /// user_email : ""
// /// can_edit : 0
// /// attendance_status : "Pending"
// /// status_reason : null
// /// token : null
// /// user : {"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"https://test.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null}
// /// type : "Viewer"
//
// class CurrentMember {
//   CurrentMember({
//       int id,
//       int meetingId,
//       int userId,
//       String userEmail,
//       int canEdit,
//       String attendanceStatus,
//       dynamic statusReason,
//       dynamic token,
//       User user,
//       String type,}){
//     _id = id;
//     _meetingId = meetingId;
//     _userId = userId;
//     _userEmail = userEmail;
//     _canEdit = canEdit;
//     _attendanceStatus = attendanceStatus;
//     _statusReason = statusReason;
//     _token = token;
//     _user = user;
//     _type = type;
// }
//
//   CurrentMember.fromJson(dynamic json) {
//     _id = json['id'];
//     _meetingId = json['meeting_id'];
//     _userId = json['user_id'];
//     _userEmail = json['user_email'];
//     _canEdit = json['can_edit'];
//     _attendanceStatus = json['attendance_status'];
//     _statusReason = json['status_reason'];
//     _token = json['token'];
//     _user = json['user'] != null ? User.fromJson(json['user']) : null;
//     _type = json['type'];
//   }
//   int _id;
//   int _meetingId;
//   int _userId;
//   String _userEmail;
//   int _canEdit;
//   String _attendanceStatus;
//   dynamic _statusReason;
//   dynamic _token;
//   User _user;
//   String _type;
//
//   int get id => _id;
//   int get meetingId => _meetingId;
//   int get userId => _userId;
//   String get userEmail => _userEmail;
//   int get canEdit => _canEdit;
//   String get attendanceStatus => _attendanceStatus;
//   dynamic get statusReason => _statusReason;
//   dynamic get token => _token;
//   User get user => _user;
//   String get type => _type;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['meeting_id'] = _meetingId;
//     map['user_id'] = _userId;
//     map['user_email'] = _userEmail;
//     map['can_edit'] = _canEdit;
//     map['attendance_status'] = _attendanceStatus;
//     map['status_reason'] = _statusReason;
//     map['token'] = _token;
//     if (_user != null) {
//       map['user'] = _user.toJson();
//     }
//     map['type'] = _type;
//     return map;
//   }
//
// }
//
//
// class Talkingpoints {
//   Talkingpoints({
//       int id,
//       int meetingId,
//       int creatorId,
//       String title,
//       int duration,
//       dynamic description,
//       int order,
//       dynamic momConclusion,
//       int momActive,
//       int laravelThroughKey,
//       Meeting meeting,}){
//     _id = id;
//     _meetingId = meetingId;
//     _creatorId = creatorId;
//     _title = title;
//     _duration = duration;
//     _description = description;
//     _order = order;
//     _momConclusion = momConclusion;
//     _momActive = momActive;
//     _laravelThroughKey = laravelThroughKey;
//     _meeting = meeting;
// }
//
//   Talkingpoints.fromJson(dynamic json) {
//     _id = json['id'];
//     _meetingId = json['meeting_id'];
//     _creatorId = json['creator_id'];
//     _title = json['title'];
//     _duration = json['duration'];
//     _description = json['description'];
//     _order = json['order'];
//     _momConclusion = json['mom_conclusion'];
//     _momActive = json['mom_active'];
//     _laravelThroughKey = json['laravel_through_key'];
//     _meeting = json['meeting'] != null ? Meeting.fromJson(json['meeting']) : null;
//   }
//   int _id;
//   int _meetingId;
//   int _creatorId;
//   String _title;
//   int _duration;
//   dynamic _description;
//   int _order;
//   dynamic _momConclusion;
//   int _momActive;
//   int _laravelThroughKey;
//   Meeting _meeting;
//
//   int get id => _id;
//   int get meetingId => _meetingId;
//   int get creatorId => _creatorId;
//   String get title => _title;
//   int get duration => _duration;
//   dynamic get description => _description;
//   int get order => _order;
//   dynamic get momConclusion => _momConclusion;
//   int get momActive => _momActive;
//   int get laravelThroughKey => _laravelThroughKey;
//   Meeting get meeting => _meeting;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['meeting_id'] = _meetingId;
//     map['creator_id'] = _creatorId;
//     map['title'] = _title;
//     map['duration'] = _duration;
//     map['description'] = _description;
//     map['order'] = _order;
//     map['mom_conclusion'] = _momConclusion;
//     map['mom_active'] = _momActive;
//     map['laravel_through_key'] = _laravelThroughKey;
//     if (_meeting != null) {
//       map['meeting'] = _meeting.toJson();
//     }
//     return map;
//   }
//
// }
//
//
//
// /// id : 28
// /// file_path : null
// /// library_id : 458
// /// user_id : 21
// /// meeting_id : 426
// /// created_at : "2022-05-09T09:13:24.000000Z"
// /// updated_at : "2022-05-09T09:13:24.000000Z"
// /// edited_library_id : 473
//
// class EditedFile {
//   EditedFile({
//       int id,
//       dynamic filePath,
//       int libraryId,
//       int userId,
//       int meetingId,
//       String createdAt,
//       String updatedAt,
//       int editedLibraryId,}){
//     _id = id;
//     _filePath = filePath;
//     _libraryId = libraryId;
//     _userId = userId;
//     _meetingId = meetingId;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//     _editedLibraryId = editedLibraryId;
// }
//
//   EditedFile.fromJson(dynamic json) {
//     _id = json['id'];
//     _filePath = json['file_path'];
//     _libraryId = json['library_id'];
//     _userId = json['user_id'];
//     _meetingId = json['meeting_id'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//     _editedLibraryId = json['edited_library_id'];
//   }
//   int _id;
//   dynamic _filePath;
//   int _libraryId;
//   int _userId;
//   int _meetingId;
//   String _createdAt;
//   String _updatedAt;
//   int _editedLibraryId;
//
//   int get id => _id;
//   dynamic get filePath => _filePath;
//   int get libraryId => _libraryId;
//   int get userId => _userId;
//   int get meetingId => _meetingId;
//   String get createdAt => _createdAt;
//   String get updatedAt => _updatedAt;
//   int get editedLibraryId => _editedLibraryId;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['file_path'] = _filePath;
//     map['library_id'] = _libraryId;
//     map['user_id'] = _userId;
//     map['meeting_id'] = _meetingId;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     map['edited_library_id'] = _editedLibraryId;
//     return map;
//   }
//
// }
//
//
//
//
//
// /// id : 75
// /// name : "Zainab Al- Ajmi"
// /// email : "zainab@ijtimaati.com"
// /// updated_at : "2022-07-21T07:59:14.000000Z"
// /// role_id : 1
// /// phone : "96281874"
// /// birthdate : "1990-01-01"
// /// team : 3
// /// image : "https://test.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg"
// /// status : 1
// /// position : null
// /// two_auth : "1"
// /// verification_code : null
// /// signature : "uploads/approvals/3KJUOAwy26.png"
// /// deleted : "0"
// /// team_name : "Ijtimaati Team"
// /// role_name : "Admins"
// /// committee : [{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2021-11-01T19:33:28.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":3}},{"id":36,"name":"Board Committee","description":"","created_at":"2022-03-10T06:36:00.000000Z","updated_at":"2022-03-10T06:36:00.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":36}},{"id":37,"name":"sales committee","description":"","created_at":"2022-03-13T05:03:22.000000Z","updated_at":"2022-03-23T08:10:30.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":37}},{"id":41,"name":"sales2","description":"_","created_at":"2022-03-23T08:23:21.000000Z","updated_at":"2022-03-23T08:23:21.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":41}},{"id":43,"name":"رؤية عمان 2040","description":"","created_at":"2022-04-03T04:50:24.000000Z","updated_at":"2022-04-03T04:50:24.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":43}}]
// /// role : {"id":1,"name":"Admins","slug":"Admins","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-04-05T05:48:25.000000Z","status":"1"}
//
// class Sender {
//   Sender({
//       int id,
//       String name,
//       String email,
//       String updatedAt,
//       int roleId,
//       String phone,
//       String birthdate,
//       int team,
//       String image,
//       int status,
//       dynamic position,
//       String twoAuth,
//       dynamic verificationCode,
//       String signature,
//       String deleted,
//       String teamName,
//       String roleName,
//       List<Committee> committee,
//       Role role,}){
//     _id = id;
//     _name = name;
//     _email = email;
//     _updatedAt = updatedAt;
//     _roleId = roleId;
//     _phone = phone;
//     _birthdate = birthdate;
//     _team = team;
//     _image = image;
//     _status = status;
//     _position = position;
//     _twoAuth = twoAuth;
//     _verificationCode = verificationCode;
//     _signature = signature;
//     _deleted = deleted;
//     _teamName = teamName;
//     _roleName = roleName;
//     _committee = committee;
//     _role = role;
// }
//
//   Sender.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//     _email = json['email'];
//     _updatedAt = json['updated_at'];
//     _roleId = json['role_id'];
//     _phone = json['phone'];
//     _birthdate = json['birthdate'];
//     _team = json['team'];
//     _image = json['image'];
//     _status = json['status'];
//     _position = json['position'];
//     _twoAuth = json['two_auth'];
//     _verificationCode = json['verification_code'];
//     _signature = json['signature'];
//     _deleted = json['deleted'];
//     _teamName = json['team_name'];
//     _roleName = json['role_name'];
//     if (json['committee'] != null) {
//       _committee = [];
//       json['committee'].forEach((v) {
//         _committee.add(Committee.fromJson(v));
//       });
//     }
//     _role = json['role'] != null ? Role.fromJson(json['role']) : null;
//   }
//   int _id;
//   String _name;
//   String _email;
//   String _updatedAt;
//   int _roleId;
//   String _phone;
//   String _birthdate;
//   int _team;
//   String _image;
//   int _status;
//   dynamic _position;
//   String _twoAuth;
//   dynamic _verificationCode;
//   String _signature;
//   String _deleted;
//   String _teamName;
//   String _roleName;
//   List<Committee> _committee;
//   Role _role;
//
//   int get id => _id;
//   String get name => _name;
//   String get email => _email;
//   String get updatedAt => _updatedAt;
//   int get roleId => _roleId;
//   String get phone => _phone;
//   String get birthdate => _birthdate;
//   int get team => _team;
//   String get image => _image;
//   int get status => _status;
//   dynamic get position => _position;
//   String get twoAuth => _twoAuth;
//   dynamic get verificationCode => _verificationCode;
//   String get signature => _signature;
//   String get deleted => _deleted;
//   String get teamName => _teamName;
//   String get roleName => _roleName;
//   List<Committee> get committee => _committee;
//   Role get role => _role;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     map['email'] = _email;
//     map['updated_at'] = _updatedAt;
//     map['role_id'] = _roleId;
//     map['phone'] = _phone;
//     map['birthdate'] = _birthdate;
//     map['team'] = _team;
//     map['image'] = _image;
//     map['status'] = _status;
//     map['position'] = _position;
//     map['two_auth'] = _twoAuth;
//     map['verification_code'] = _verificationCode;
//     map['signature'] = _signature;
//     map['deleted'] = _deleted;
//     map['team_name'] = _teamName;
//     map['role_name'] = _roleName;
//     if (_committee != null) {
//       map['committee'] = _committee.map((v) => v.toJson()).toList();
//     }
//     if (_role != null) {
//       map['role'] = _role.toJson();
//     }
//     return map;
//   }
//
// }
//
