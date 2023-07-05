import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../modules/nav_news/business_nav.dart';
import '../../../modules/nav_news/science_nav.dart';
import '../../../modules/nav_news/sports_nav.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/network/local/cache_helper.dart';
import 'state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentPage = 0;
  void changeIndex(int index) {
    currentPage = index;
    emit(ChangeBottomBarState());
  }
    List<Widget> page = [
      const BusinessNews(),
      const SportsNews(),
      const ScienceNews(),
    ];
    List<String> titles = [
      'Business News',
      'Sports News',
      'Science News',
    ];
    bool isDark = true;

    void changeModeApp({bool? fromShared}) {
      if(fromShared != null) {
        isDark = fromShared;
        emit(ChangeModeAppState());
      }
      else
      {
        isDark = !isDark;
        CacheHelper.putBool(key: 'isDark', value: isDark).then((value) {
          emit(ChangeModeAppState());
        });
      }
    }

    List<dynamic> business = [];
    void getBusiness() {
      emit(GetBusinessLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query:
      {
      'country': 'eg',
      'category': 'business',
      'apiKey': '52b3a675a12247e0994de066d4421d76',
    }).then((value) {
        business = value.data['articles'];
        emit(GetBusinessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetBusinessErrorState(error));
      });
    }

  List<dynamic> sports = [];
  void getSports() {
    emit(GetSportLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query:
    {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '52b3a675a12247e0994de066d4421d76',
    }).then((value) {
      sports = value.data['articles'];
      emit(GetSportSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSportErrorState(error));
    });
  }

  List<dynamic> science = [];
  void getScience() {
    emit(GetScienceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query:
    {
      'country': 'eg',
      'category': 'science',
      'apiKey': '52b3a675a12247e0994de066d4421d76',
    }).then((value) {
      science = value.data['articles'];
      emit(GetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetScienceErrorState(error));
    });
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(GetSearchLoadingState());
    DioHelper.getData(url: 'v2/everything', query:
    {
      'q': value,
      'apiKey': '52b3a675a12247e0994de066d4421d76',
    }).then((value) {
      search = value.data['articles'];
      emit(GetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSearchErrorState(error.toString()));
    });
  }

}
