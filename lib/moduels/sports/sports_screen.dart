import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import '../../layouts/NewsApp/cubit/NewsCubit.dart';
import '../../layouts/NewsApp/cubit/NewsStates.dart';
import '../../shared/components/components.dart';
class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){} ,
      builder: (context,state){
        var list = NewsCubit.get(context).sports;
        return Container(
            child:
            Conditional.single(
                context: context,
                conditionBuilder: (BuildContext context) => list.isNotEmpty,
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
