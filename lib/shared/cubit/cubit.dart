import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/local/Cached_Helper.dart';

class AppCubit  extends Cubit <AppStates> {
  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of(context);


  
    bool isDark =false;
    void changeAppMode ({ bool ?fromShared})
    {
      if(fromShared!=null ){
        isDark=fromShared;
         emit(AppChangeModeState());
      }
         
         else {
          isDark = !isDark;
          ChachedHelper.putData(key :'isDark' ,value : isDark )?.then((value){
              emit(AppChangeModeState());


      });

         }
      
      

    }

}