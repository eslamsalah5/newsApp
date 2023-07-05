abstract class NewsState {
}

class NewsInitState extends NewsState {}
class ChangeBottomBarState extends NewsState {}
class ChangeModeAppState extends NewsState {}
class GetBusinessSuccessState extends NewsState {}
class GetBusinessErrorState extends NewsState {final String error;

  GetBusinessErrorState(this.error); }
class GetBusinessLoadingState extends NewsState {}
class GetSportSuccessState extends NewsState {}
class GetSportErrorState extends NewsState {final String error;

  GetSportErrorState(this.error); }
class GetSportLoadingState extends NewsState {}
class GetScienceSuccessState extends NewsState {}
class GetScienceErrorState extends NewsState {final String error;

  GetScienceErrorState(this.error); }
class GetScienceLoadingState extends NewsState {}
class GetSearchSuccessState extends NewsState {}
class GetSearchErrorState extends NewsState {final String error;

GetSearchErrorState(this.error); }
class GetSearchLoadingState extends NewsState {}
class OpenWebViewState extends NewsState {}