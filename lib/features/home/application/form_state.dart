part of 'form_cubit.dart';

@immutable
abstract class FormStates {}

class FormInitial extends FormStates {}
class AddNewFormLodingStates extends FormStates {}
class AddNewFormSuccessStates extends FormStates {}
class AddNewFormErrorStates extends FormStates {}


class GetAllFormLodingStates extends FormStates {}
class GetAllFormASuccessStates extends FormStates {}
class GetAllFormErrorStates extends FormStates {}


class DeleteFormLodingStates extends FormStates {}
class DeleteFormASuccessStates extends FormStates {}
class DeleteFormErrorStates extends FormStates {}