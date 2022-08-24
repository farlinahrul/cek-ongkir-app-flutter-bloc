import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startercode_project/data/blocs/article/use_cubit/fetch_articles/fetch_articles_cubit.dart';
import 'package:startercode_project/data/blocs/article/without_cubit/article/article_bloc.dart';
import 'package:startercode_project/data/models/article.dart';
import 'package:startercode_project/ui/screens/screens.dart';
import 'package:startercode_project/utils/colors.dart' as AppColor;
import 'package:startercode_project/utils/extensions.dart' as AppExt;

class ArticleScreenWithoutCubitScreen extends StatefulWidget {
  const ArticleScreenWithoutCubitScreen({Key? key}) : super(key: key);

  @override
  State<ArticleScreenWithoutCubitScreen> createState() =>
      _ArticleScreenWithoutCubitScreenState();
}

class _ArticleScreenWithoutCubitScreenState
    extends State<ArticleScreenWithoutCubitScreen> {
  late ArticleBloc _articleBloc;

  @override
  void initState() {
    _articleBloc = ArticleBloc()..add(ArticleFetched());
    super.initState();
  }

  @override
  void dispose() {
    _articleBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => _articleBloc,
          ),
        ],
        child: MultiBlocListener(
            listeners: [
              BlocListener<ArticleBloc, ArticleState>(
                  listener: (context, state) {
                if (state is ArticleSuccess) {
                  print("SUKSES FETCH");
                }
                if (state is ArticleFailure) {
                  print("GAGAL FETCH :" + state.message);
                  const SnackBar(
                      margin: EdgeInsets.zero,
                      duration: Duration(seconds: 2),
                      content: Text('GAGAL'),
                      backgroundColor: Colors.red,
                      behavior: SnackBarBehavior.floating,
                    );
                }
              })
            ],
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("List Article Without Cubit"),
              ),
              body: Container(
                  child: BlocBuilder<ArticleBloc, ArticleState>(
                      builder: (context, state) => state is ArticleLoading
                          ? Center(child: CircularProgressIndicator())
                          : state is ArticleFailure
                              ? Center(child: Text("terjadi kesalahan"))
                              : state is ArticleSuccess
                                  ? Column(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            bool isRefresh =
                                                await AppExt.pushScreen(context,
                                                    EntryArticleWithoutCubitScreen());
                                            if (isRefresh) {
                                              _articleBloc
                                                  .add(ArticleFetched());
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
                                            itemCount: state.data!.length,
                                            separatorBuilder:
                                                (context, index) => SizedBox(
                                              height: 5,
                                            ),
                                            itemBuilder: (context, index) {
                                              Article article =
                                                  state.data![index];
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
