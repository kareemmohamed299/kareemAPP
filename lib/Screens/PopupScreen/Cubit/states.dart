import 'package:kareemapp/Model/CountriesModel.dart';

abstract class PopupState{}
class PopupInitialState extends PopupState{}

class PopupLoadingState extends PopupState{}

class PopupSuccessState extends PopupState{
 CountriesModel ? countriesModel;
  PopupSuccessState(this.countriesModel);
}

class PopupErrorState extends PopupState{
  String ? error;
  PopupErrorState(error);
}
class PopupSelectGenderState extends PopupState{}

class PopupSelectAgeState extends PopupState{}


