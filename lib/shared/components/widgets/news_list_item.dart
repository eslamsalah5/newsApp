import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news1/shared/components/widgets/navigate_to.dart';
import '../../../modules/web_view.dart';

Widget    buildArticleItem(article,context) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(url: '${article['url']}'));
  },
  child:   Padding(
        padding: const EdgeInsets.all(16.0),
  
        child: Row(
  
          children: [
  
            Container(
  
              height: 150,
  
              width: 150,
  
              decoration: BoxDecoration(
  
                  borderRadius: BorderRadiusDirectional.circular(10),
  
                  image: DecorationImage(
  
                      image: NetworkImage('${article['urlToImage']}'),
  
                      onError: (exception, stackTrace) {
  
                        print('image error');
  
                      },
  
                      fit: BoxFit.cover)),
  
            ),
  
            const SizedBox(
  
              width: 10,
  
            ),
  
            Expanded(
  
              child: SizedBox(
  
                height: 150,
  
                width: 150,
  
                child: Column(
  
                  crossAxisAlignment: CrossAxisAlignment.start,
  
                  mainAxisAlignment: MainAxisAlignment.start,
  
                  children: [
  
                    Expanded(
  
                        child: Text(
  
                      '${article['title']}',
  
                      maxLines: 3,
  
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
  
                    )),
  
                    Text('${article['publishedAt']}'),
  
                  ],
  
                ),
  
              ),
  
            )
  
          ],
  
        ),
  
      ),
);
