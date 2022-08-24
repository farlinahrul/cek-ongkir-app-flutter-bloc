import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startercode_project/data/blocs/article/use_cubit/fetch_articles/fetch_articles_cubit.dart';
import 'package:startercode_project/data/models/article.dart';
import 'package:startercode_project/ui/screens/screens.dart';
import 'package:startercode_project/utils/colors.dart' as AppColor;
import 'package:startercode_project/utils/extensions.dart' as AppExt;

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final FetchArticlesCubit _fetchArticlesCubit = FetchArticlesCubit()
    ..fetchArticles();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _fetchArticlesCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => _fetchArticlesCubit,
          ),
        ],
        child: MultiBlocListener(
            listeners: [
              BlocListener(
                  bloc: _fetchArticlesCubit,
                  listener: (context, state) {
                    if (state is FetchArticlesSuccess) {
                      print("SUKSES FETCH");
                    }
                    if (state is FetchArticlesFailure) {
                      print("GAGAL FETCH :" + state.message);
                    }
                  })
            ],
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("List Article"),
              ),
              body: Container(
                  child: BlocBuilder(
                      bloc: _fetchArticlesCubit,
                      builder: (context, state) => state is FetchArticlesLoading
                          ? Center(child: CircularProgressIndicator())
                          : state is FetchArticlesFailure
                              ? Center(child: Text("terjadi kesalahan"))
                              : state is FetchArticlesSuccess
                                  ? Column(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            bool isRefresh =
                                                await AppExt.pushScreen(context,
                                                    EntryArticleScreen());
                                            if (isRefresh) {
                                              _fetchArticlesCubit
                                                  .fetchArticles();
                                            }
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 70,
                                            color: AppColor.primary,
                                            child: Center(
                                                child: Text(
                                                    "Klik Tambah Article")),
                                          ),
                                        ),
                                        Expanded(
                                          child: ListView.separated(
                                            itemCount: state.data.length,
                                            separatorBuilder:
                                                (context, index) => SizedBox(
                                              height: 5,
                                            ),
                                            itemBuilder: (context, index) {
                                              Article article =
                                                  state.data[index];
                                              return Card(
                                                child: Column(
                                                  children: [
                                                    Text(article.id.toString()),
                                                    Text(article.title),
                                                    Text(article.body)
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox.shrink())),
            )));
  }
}
