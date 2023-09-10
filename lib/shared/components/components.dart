import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/module/web_view/web_view.dart';

Widget buildArticleItems(article ,context) => InkWell(
  onTap: (){
    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WebViewScreen(article['url']))
);},
  child: Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage("${article['urlToImage']}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${article['title']}",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium
                ),
                Text(
                  "${article['publishedAt']}",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
);

Widget articleBuilder(list, context) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) => ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) => buildArticleItems(list[index], context),
    separatorBuilder: (context, index) => Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey,
    ),
    itemCount: list.length, // Update the itemCount to list.length
  ),
  fallback: (context) => Center(child: CircularProgressIndicator()),
);



Widget defaultTextFormField ({
required TextEditingController Controller,
required Function? validate,
required String label,
Function()? onTap ,
Function? onChanged ,
required IconData prifix,
required TextInputType type,
}
) => TextFormField(
  onChanged: onChanged!(onChanged),
    

 
  cursorColor: Colors.deepOrange,
  controller: Controller,
  onTap: onTap,
   validator: (value) => validate!(value),
  keyboardType: type,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(prifix),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15)
    )
  )

);