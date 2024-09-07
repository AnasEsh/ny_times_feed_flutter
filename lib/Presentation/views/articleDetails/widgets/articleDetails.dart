import 'package:flutter/material.dart';
import 'package:nytimes_feed/Domain/Entities/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetails extends StatelessWidget {
  final Article article;
  const ArticleDetails({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final th = Theme.of(context);
    return Column(
      children: [
        if (article.imageUrl != null) Image.network(article.imageUrl!),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Column(
            children: [
              Text(
                article.title,
                style: th.textTheme.headlineMedium,
              ),
              const Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.auto_stories_sharp,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    article.byline,
                    style: th.textTheme.labelMedium,
                  ),
                ],
              ),
              const Divider(),
              Text(
                article.abstract,
                style: th.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () async {
                    final uri = Uri.parse(article.url);
                    // if (await canLaunchUrl(uri))
                    launchUrl(uri);
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.open_in_new),
                      SizedBox(
                        width: 4,
                      ),
                      Text("Go to full article"),
                    ],
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
