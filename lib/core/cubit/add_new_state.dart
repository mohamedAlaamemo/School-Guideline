part of 'add_new_cubit.dart';

@immutable
abstract class AddNewState {}

class AddNewInitial extends AddNewState {}
class AddNewEmit extends AddNewState {}
class AddNewChangeIndexNavBarAdmin extends AddNewState {}


class RegisterNewUserLodingState extends AddNewState {}
class RegisterNewUserSuccessState extends AddNewState {}
class RegisterNewUserErrorState extends AddNewState {}


class CreateUserLodingState extends AddNewState {}
class CreateUserSuccessState extends AddNewState {}
class CreateUserErrorState extends AddNewState {}




class DeleteUserLodingState extends AddNewState {}
class DeleteUserState extends AddNewState {}

