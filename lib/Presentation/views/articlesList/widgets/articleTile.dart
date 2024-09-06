import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nytimes_feed/Domain/Entities/article.dart';
import 'package:nytimes_feed/Presentation/utils/dateTimeFormatters.dart';

class ArticleTile extends StatelessWidget {
  Article article;
  void Function(Article) onTap;
  ArticleTile({super.key, required this.article, required this.onTap});
  void _onTapped() {
    onTap(article);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: _onTapped,
      leading: CircleAvatar(child: Icon(Icons.article_rounded)),
      title: Text(
        article.title,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
      subtitle: _subTitle(),
      trailing: IconButton(
        icon: Icon(Icons.arrow_forward_ios_rounded),
        onPressed: _onTapped,
      ),
    );
  }

  Wrap _subTitle() {
    return Wrap(
      runAlignment: WrapAlignment.spaceBetween,
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.spaceBetween,
      children: [
        Text(
          article.byline,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.calendar_today),
            const SizedBox(
              width: 8,
            ),
            Text(article.publishedDate.ymd())
          ],
        )
      ],
    );
  }
}
