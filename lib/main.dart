import 'package:bloc/bloc.dart';
import 'package:first_project/layouts/NewsApp/News_layout.dart';
import 'package:first_project/layouts/NewsApp/cubit/NewsCubit.dart';
import 'package:first_project/layouts/NewsApp/cubit/NewsStates.dart';
import 'package:first_project/shared/components/constants.dart';
import 'package:first_project/shared/network/local/cache_helper.dart';
import 'package:first_project/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


void main() async{
  
  WidgetsFlutterBinding.ensureInitialized(); 
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark= CacheHelper.getData(key: 'isDark');
  runApp(Myapp(isDark!));
  //runApp(Myapp());

}
class Myapp extends StatelessWidget  
{
  late final bool isDark;
  Myapp(this.isDark);

  @override
  Widget build(BuildContext context) { 
    return BlocProvider( 
      create: (BuildContext context) =>NewsCubit()..getBusiness()..changeAppMode(fromShared: isDark),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state) {
          return MaterialApp(  
            home:Directionality(
                textDirection: TextDirection.ltr, 
                child: Newslayout()),
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle( 
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark
                  ),
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  titleTextStyle: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed, 
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.white,
              ),
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                ),

              ),
            ),
            darkTheme: ThemeData(
              appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle( 
                      statusBarColor: HexColor('333739'),
                      statusBarIconBrightness: Brightness.dark
                  ),
                  iconTheme: IconThemeData(color: Colors.white),
                  backgroundColor: HexColor('333739'),
                  titleTextStyle: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold)
              ),

              scaffoldBackgroundColor: HexColor('333739'),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: HexColor('333739'),
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey
              ),
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                ),

              ),
            ),
            themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,

          );
        },

      ),
    );
  }

}



