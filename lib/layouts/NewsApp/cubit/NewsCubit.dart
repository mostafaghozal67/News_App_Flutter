import 'package:first_project/layouts/NewsApp/cubit/NewsStates.dart';
import 'package:first_project/moduels/business/business_screen.dart';
import 'package:first_project/moduels/science/science_screen.dart';
import 'package:first_project/moduels/sports/sports_screen.dart';
import 'package:first_project/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{

  NewsCubit () : super(NewsIntialState());


  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;

  List<Widget> screens= [ 
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),

  ];
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: ("Business"),
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: ("Sports"),
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: ("Science"),
    ),




  ];

  List<dynamic> business = [];
  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country' : 'us',
          'category' : 'business',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
        }).then((value) {
      emit(NewsGetBusinessSuceessState());
      //print(value.data.toString());
      business= value.data['articles'];
      //print(business[0]['title']);
    }).catchError((onError){
      emit(NewsGetBusinessErrorState(onError.toString()));
      //print(onError.toString());
    });
    

  }

  List<dynamic> sports = [];
  void getSports(){
    if(sports.isEmpty) {
      emit(NewsGetSportsLoadingState());
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country' : 'eg',
            'category' : 'sports',
            'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
          }).then((value) {
        emit(NewsGetSportsSuceessState());
        //print(value.data.toString());
        sports= value.data['articles'];
        //print(sports[0]['title']);
      }).catchError((onError){
        emit(NewsGetSportsErrorState(onError.toString()));
        //print(onError.toString());
      });

    }
    else {
      emit(NewsGetSportsSuceessState());
    }


  }

  List<dynamic> science = [];
  void getScience(){

    if(science.isEmpty ) {

      emit(NewsGetScienceLoadingState());
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country' : 'eg',
            'category' : 'science',
            'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
          }).then((value) {
        emit(NewsGetScienceSuceessState());
        //print(value.data.toString());
        science= value.data['articles'];
        //print(science[0]['title']);
      }).catchError((onError){
        emit(NewsGetScienceErrorState(onError.toString()));
        //print(onError.toString());
      });

    }
    else {
      emit(NewsGetScienceSuceessState());
    }



  }

  List<dynamic> search = [];
  void getSearch(String value){
    emit(NewsGetSearchLoadingState());
    search = [] ;
    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q' : value,
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
        }).then((value) {
      emit(NewsGetSearchSuceessState());
      //print(value.data.toString());
      search= value.data['articles'];
      //print(science[0]['title']);
    }).catchError((onError){
      emit(NewsGetSearchErrorState(onError.toString()));
      //print(onError.toString());
    });



  }

  String getUrl(String url){
    return url;
  }

  void changeBottomNavBar(int index){
    currentIndex = index;
    if(index ==1 ) {
      getSports();
    } else if(index == 2 )
      getScience();
    emit(NewsButtomNav());
  }

  bool isDark = true ;
  void changeAppMode( {bool? fromShared}){
    if(fromShared != null) {
      isDark = fromShared;
      //emit(NewsAppChangeModeState());
    }
    else{
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark',value: isDark).then((value) {
        emit(NewsAppChangeModeState());
      });
    }


  }



}
