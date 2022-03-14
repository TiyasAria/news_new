import 'package:flutter/material.dart';
import 'package:news_new/utils/utils.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../model/article.dart';

class NewsItem extends StatelessWidget {

  final Article article;
  NewsItem({
    required this.article
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Card(
        elevation: 5,
        color: Colors.white,
        margin: EdgeInsets.only(bottom: edgeDetail),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child:  Container(
          // width: 300,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(
                    article.urlToImage,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                  child: Container(
                    width: 210,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: titleArticle.copyWith(
                              fontSize: 14
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined, size: 12,
                                ),
                                SizedBox(width: 3,),
                                Container(
                                  width: 70 ,
                                  child: Text(
                                    timeUntil(DateTime.parse(article.publishedAt)),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: authorDateArticle.copyWith(
                                        fontSize: 12
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.person, size: 12,
                                ),
                                SizedBox(width: 3,),
                                Container(
                                  width: 70,
                                  child: Text(
                                    article.author,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: authorDateArticle.copyWith(
                                        fontSize: 12
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
              ),
              Padding(
                padding: EdgeInsets.only(right: 5),
                  child: Icon(Icons.bookmark_border_rounded))
            ],
          ),
        ),
      ),
    );
  }

  String timeUntil(DateTime parse){
    return  timeago.format(parse, allowFromNow: true, locale: 'en');
  }
}
