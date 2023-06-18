part of 'layout_cubit.dart';

@immutable
abstract class LayoutState {}

class LayoutInitial extends LayoutState {}
class LayoutChangeScreenState extends LayoutState {}

// Get all information about user
class LayoutGitUserDataLodingState extends LayoutState {}
class LayoutGitUserDataSuccessState extends LayoutState {}
class LayoutGitUserDataErrorState extends LayoutState {}

//Post Page
class LayoutScreenOfAddPostState extends LayoutState {}


class LayoutGetImageSuccessState extends LayoutState {}
class LayoutGetImageErrorState extends LayoutState {}



class LayoutGetImageCoverSuccessState extends LayoutState {}
class LayoutGetImageCoverErrorState extends LayoutState {}


class LayoutGetImageNewPostSuccessState extends LayoutState {}
class LayoutGetImageNewPostErrorState extends LayoutState {}

class LayoutRemoveImageNewPostState extends LayoutState {}


class LayoutUploadImageProfileSuccessState extends LayoutState {}
class LayoutUploadImageProfileErrorState extends LayoutState {}


class LayoutUploadImageCoverSuccessState extends LayoutState {}
class LayoutUploadImageCoverErrorState extends LayoutState {}





class LayoutUpDateUserErrorState extends LayoutState {}
class LayoutUpDateUserLodingState extends LayoutState {}



//CreateNewPost

class LayoutCreateNewPostLodingState extends LayoutState {}
class LayoutCreateNewPostSuccessState extends LayoutState {}
class LayoutCreateNewPostErrorState extends LayoutState {}


class LayoutUploadImageNewPostLodingState extends LayoutState {}
class LayoutUploadImageNewPostSuccessState extends LayoutState {}
class LayoutUploadImageNewPostErrorState extends LayoutState {}



class LayoutGetAllPostsLodingState extends LayoutState {}
class LayoutGetAllPostsSuccessState extends LayoutState {}
class LayoutGetAllPostsErrorState extends LayoutState {}


class LayoutLikePostLodingState extends LayoutState {}
class LayoutLikePostSuccessState extends LayoutState {}
class LayoutLikePostErrorState extends LayoutState {}


class LayoutGetAllUsersLodingState extends LayoutState {}
class LayoutGetAllUsersSuccessState extends LayoutState {}
class LayoutGetAllUsersErrorState extends LayoutState {}


class LayoutGetAllAdminLodingState extends LayoutState {}
class LayoutGetAllAdminSuccessState extends LayoutState {}
class LayoutGetAllAdminErrorState extends LayoutState {}


class LayoutSendMessageLodingState extends LayoutState {}
class LayoutSendMessageSuccessState extends LayoutState {}
class LayoutSendMessageErrorState extends LayoutState {}

class LayoutInsertStudentToParentLodingState extends LayoutState {}
class LayoutInsertStudentToParentSuccessState extends LayoutState {}
class LayoutInsertStudentToParentErrorState extends LayoutState {}

class LayoutAddStudentToLevelLodingState extends LayoutState {}
class LayoutAddStudentToLevelSuccessState extends LayoutState {}
class LayoutAddStudentToLevelErrorState extends LayoutState {}

class LayoutGetAllStudentParentLodingState extends LayoutState {}
class LayoutGetAllStudentParentSuccessState extends LayoutState {}
class LayoutGetAllStudentParentErrorState extends LayoutState {}

class LayoutGetAllStudentLevelLodingState extends LayoutState {}
class LayoutGetAllStudentLevelSuccessState extends LayoutState {}
class LayoutGetAllStudentLevelErrorState extends LayoutState {}


class LayoutSelectFileLodingState extends LayoutState {}
class LayoutSelectFileSuccessState extends LayoutState {}
class LayoutSelectFileErrorState extends LayoutState {}

class LayoutGetAllAssignmentStudentLodingState extends LayoutState {}
class LayoutGetAllAssignmentStudentSuccessState extends LayoutState {}
class LayoutGetAllAssignmentStudentErrorState extends LayoutState {}


class LayoutSelectFileToSendAssignmentToTeatcherLodingState extends LayoutState {}
class LayoutSelectFileToSendAssignmentToTeatcherSuccessState extends LayoutState {}
class LayoutSelectFileToSendAssignmentToTeatcherErrorState extends LayoutState {}

class LayoutAddFileAssignmentToTeacherLodingState extends LayoutState {}
class LayoutAddFileAssignmentToTeacherSuccessState extends LayoutState {}
class LayoutAddFileAssignmentToTeacherErrorState extends LayoutState {}


class LayoutAddFileAssignmentLodingState extends LayoutState {}
class LayoutAddFileAssignmentSuccess1State extends LayoutState {}
class LayoutAddFileAssignmentSuccess2State extends LayoutState {}
class LayoutAddFileAssignmentError1State extends LayoutState {}
class LayoutAddFileAssignmentError2State extends LayoutState {}


class LayoutChooseAssignmentLeveSuccessState extends LayoutState {}


class LayoutUploadFileSuccessState extends LayoutState {}
class LayoutUploadFileErrorState extends LayoutState {}









class LayoutEmitState extends LayoutState {}
class LayoutGetMessageInChatState extends LayoutState {}


class LayoutGetDownloadURLSuccessState extends LayoutState {}
class LayoutGetDownloadURLErrorState extends LayoutState {}




class GetAllTeacherLodingState extends LayoutState {}
class GetAllTeacherSuccessState extends LayoutState {}
class GetAllTeacherErrorState extends LayoutState {}

class GetAllParentLodingState extends LayoutState {}
class GetAllParentSuccessState extends LayoutState {}
class GetAllParentErrorState extends LayoutState {}

class DeleteUserLodingState extends LayoutState {}
class DeleteUserState extends LayoutState {}



class LayoutGetAllAssignmentFromStudentToTeacherLodingState extends LayoutState {}
class LayoutGetAllAssignmentFromStudentToTeacherSuccessState extends LayoutState {}
class LayoutGetAllAssignmentFromStudentToTeacherErrorState extends LayoutState {}


class LayoutInsertGradeToStudentLodingState extends LayoutState {}
class LayoutInsertGradeToStudentSuccessState extends LayoutState {}
class LayoutInsertGradeToStudentErrorState extends LayoutState {}

class LayoutGetAllGradeForStudentLodingState extends LayoutState {}
class LayoutGetAllGradeForStudentSuccessState extends LayoutState {}
class LayoutGetAllGradeForStudentErrorState extends LayoutState {}


class LayoutDownLoadFileLodingState extends LayoutState {}
class LayoutDownLoadFileSuccessState extends LayoutState {}
class LayoutDownLoadFileErrorState extends LayoutState {}


class LayoutInsertTableLodingState extends LayoutState {}
class LayoutInsertTableSuccessState extends LayoutState {}
class LayoutInsertTableErrorState extends LayoutState {}

class LayoutGetTableListLodingState extends LayoutState {}
class LayoutGetTableListSuccessState extends LayoutState {}
class LayoutGetTableListErrorState extends LayoutState {}


class LayoutDeleteItemTableLodingState extends LayoutState {}
class LayoutDeleteItemTableSuccessState extends LayoutState {}