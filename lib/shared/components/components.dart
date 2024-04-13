import 'package:first_project/moduels/NewsWebView/WebviewScreen.dart';
import 'package:flutter/material.dart';


Widget defaultButton({
  double width= double.infinity,
  Color background= Colors.blue,
  bool isUpperCase = true,
  required Function() function,
  required String text,}) => Container(
      width: width,
      color: background,
      child: MaterialButton(
        onPressed: function,
        child: Text(isUpperCase ? text.toUpperCase() : text,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

      ),
    );
//----------------------------------------------------------------------------
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  bool isPassword = false,
  Function(String)? onSubmit,
  Function()? ontap,
  Function(String)? onchange,
  required String? Function(String?)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function()? suffixPressed,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  onFieldSubmitted: onSubmit,
  validator: validate,
  onChanged: onchange,
  onTap : ontap,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: suffix != null ? IconButton(
      onPressed: suffixPressed,
      icon: Icon(
        suffix,color: Colors.blue,
      ),
    ) : null,
    border: const OutlineInputBorder(),
  ),
);

//-------------------------------------------------------------------------------
Widget buildArticleItem(article,context) => InkWell(
  onTap: (){
    Navigator.push(context,MaterialPageRoute(builder: (context) => WebViewScreen(article['url'])));
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          height: 120.0,
          width: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: const DecorationImage(
              image: NetworkImage("https://mediaaws.almasryalyoum.com/news/large/2024/01/17/2300848_0.jpg"),
              //image: NetworkImage('${article['urlToImage']}'),
             
              fit: BoxFit.cover,
            ),
  
          ),
        ),
        const SizedBox(width: 20.0,),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                Expanded(
                  child: Text("${article['title']}", style: Theme.of(context).textTheme.bodyLarge,maxLines: 3, overflow: TextOverflow.ellipsis,)), 
                const SizedBox(height: 10.0,),
                Text("${article['publishedAt']}", style: Theme.of(context).textTheme.bodyLarge,maxLines: 3, overflow: TextOverflow.ellipsis,),
  
              ],
            ),
          ),
        )
      ],
    ),
  ),
);
