import 'package:first_project/layouts/NewsApp/cubit/NewsCubit.dart';
import 'package:first_project/layouts/NewsApp/cubit/NewsStates.dart';
import 'package:first_project/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, NewsStates state) {},
      builder: (BuildContext context, NewsStates state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    validate: (value){
                      if(value!.isEmpty || value == null)
                        return 'Search must not be empty';
                    },
                    label: "Search",
                    prefix: Icons.search,
                    onchange: (searchController){
                      NewsCubit.get(context).getSearch(searchController);
                    }
                ),
              ),// DefaultFormField
              Expanded(
                child: Container(

                    child:
                    Conditional.single(
                        context: context,
                        conditionBuilder: (BuildContext context) => list.isNotEmpty,
                        widgetBuilder: (BuildContext context) => ListView.separated(
                            //physics: BouncingScrollPhysics() ,
                            itemBuilder: (context,index) => buildArticleItem(list[index],context),
                            separatorBuilder: (context,index) => Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.grey[300],

                            ),
                            itemCount: 100) ,
                        fallbackBuilder:(BuildContext context) => Container() )

                ),
              )
            ],
          ),

        );

      },


    );
  }
}
