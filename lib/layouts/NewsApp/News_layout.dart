import 'package:first_project/layouts/NewsApp/cubit/NewsCubit.dart';
import 'package:first_project/layouts/NewsApp/cubit/NewsStates.dart';
import 'package:first_project/moduels/NewsSearch/SearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Newslayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder:  (context,state){
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("News App"),
            actions: [
              IconButton(onPressed: (){
                cubit.search = [];
                Navigator.push(context,MaterialPageRoute(builder: (context) => SearchScreen()));
              }, icon: const Icon(Icons.search)),
              IconButton(onPressed: (){
                cubit.changeAppMode();
              }, icon: const Icon(Icons.brightness_4_outlined))

            ],
            //backgroundColor: Colors.blue,
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){ 
              cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomItems,

          ),

        );
      },

    );
  }

}

