abstract class NewsStates {}


class NewsInitState extends NewsStates{}

class NewsBottomNavBarState extends NewsStates{}

class NewsChangeButtomNavBarState extends NewsStates{}


class NewsGetBusinessLoadingState extends NewsStates{}



class NewsGetBusinessDataSuccess extends NewsStates{}

class NewsGetBusinessDataError extends NewsStates{
  final String error;
  NewsGetBusinessDataError(this.error);

}



class NewsGetScienceLoadingState extends NewsStates{}



class NewsGetScienceDataSuccess extends NewsStates{}

class NewsGetScienceDataError extends NewsStates{
  final String error;
  NewsGetScienceDataError(this.error);

}



class NewsGetSportsLoadingState extends NewsStates{}



class NewsGetSportsDataSuccess extends NewsStates{}

class NewsGetSportsDataError extends NewsStates{
  final String error;
  NewsGetSportsDataError(this.error);

}

class NewsGetSearchLoadingState extends NewsStates{}



class NewsGetSearchDataSuccess extends NewsStates{}

class NewsGetSearchDataError extends NewsStates{
  final String error;
  NewsGetSearchDataError(this.error);

}





