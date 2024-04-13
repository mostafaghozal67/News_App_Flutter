import 'package:first_project/layouts/NewsApp/cubit/NewsCubit.dart';
import 'package:first_project/layouts/NewsApp/cubit/NewsStates.dart';
import 'package:first_project/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){} ,
      builder: (context,state){
        var list = NewsCubit.get(context).business; 
        return Container(
          child:
            Conditional.single(
                context: context,
                conditionBuilder: (BuildContext context) => state is! NewsGetBusinessLoadingState,
                widgetBuilder: (BuildContext context) => ListView.separated(
                    physics: const BouncingScrollPhysics() ,
                    itemBuilder: (context,index) => buildArticleItem(list[index],context),
                    separatorBuilder: (context,index) => Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey[300],

                    ),
                    itemCount: 20) ,
                fallbackBuilder:(BuildContext context) => const Center(child: CircularProgressIndicator(color: Colors.deepOrange,)) )

        );

      },

    );
  }
}
