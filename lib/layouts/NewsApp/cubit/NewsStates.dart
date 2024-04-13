abstract class NewsStates {}

class NewsIntialState extends NewsStates{}

class NewsButtomNav extends NewsStates{}

class NewsGetBusinessLoadingState extends NewsStates{}

class NewsGetBusinessSuceessState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates{
  final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsStates{}

class NewsGetSportsSuceessState extends NewsStates{}

class NewsGetSportsErrorState extends NewsStates{
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsStates{}

class NewsGetScienceSuceessState extends NewsStates{}

class NewsGetScienceErrorState extends NewsStates{
  final String error;
  NewsGetScienceErrorState(this.error);
}

class NewsAppChangeModeState extends NewsStates{}

class NewsGetSearchLoadingState extends NewsStates{}

class NewsGetSearchSuceessState extends NewsStates{}

class NewsGetSearchErrorState extends NewsStates{
  final String error;
  NewsGetSearchErrorState(this.error);
}

