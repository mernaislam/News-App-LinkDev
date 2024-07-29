import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/service/news_service.dart';
import 'package:news_app/widgets/grid_view_builder.dart';
import 'package:news_app/widgets/news_failed.dart';

final dioProvider = Provider<Dio>(
  (_) => Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org',
    ),
  ),
);

final getNewsFutureProvider = FutureProvider<List<ArticleModel>>(
  (ref) => NewsService(dio: ref.watch(dioProvider)).getNews(),
);

class NewsFutureBuilder extends ConsumerStatefulWidget {
  const NewsFutureBuilder({super.key});

  @override
  ConsumerState<NewsFutureBuilder> createState() => _NewsFutureBuilderState();
}

class _NewsFutureBuilderState extends ConsumerState<NewsFutureBuilder> {
  Future<void> _onRefresh() async {
    setState(() {
      ref.invalidate(getNewsFutureProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ref.watch(getNewsFutureProvider).when(
        data: (data) {
          return GridViewBuilder(
            articles: data,
          );
        },
        error: (_, __) {
          return NewsFailed(onRefresh: _onRefresh);
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }
}
