import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xflutter/blocs/article/article_bloc.dart';
import 'package:xflutter/blocs/article/article_event.dart';
import 'package:xflutter/blocs/article/article_state.dart';
import 'package:xflutter/blocs/article/categories/category_bloc.dart';
import 'package:xflutter/blocs/article/categories/category_event.dart';
import 'package:xflutter/model/article_model.dart';
import 'package:xflutter/model/category_model.dart';
import 'package:xflutter/repository/repositories.dart';
import 'package:xflutter/ui/news_tile.dart';
import 'package:xflutter/ui/widget/category_card.dart';
import 'package:xflutter/util/app_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<CategoryModel> categories = [];
FetchDataRepository _dataRepository = FetchDataRepository();
final TextEditingController searchController = TextEditingController();

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    categories = [
      CategoryModel(categoryName: "General", imageAssetUrl: generalCategoryImg),
      CategoryModel(
          categoryName: "Entertainment",
          imageAssetUrl: entertainmentCategoryImg),
      CategoryModel(
          categoryName: "Business", imageAssetUrl: businessCategoryImg),
      CategoryModel(categoryName: "Health", imageAssetUrl: healthCategoryImg),
      CategoryModel(categoryName: "Science", imageAssetUrl: scienceCategoryImg),
      CategoryModel(categoryName: "Sports", imageAssetUrl: sportCategoryImg),
    ];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ArticleBloc>(
            create: (BuildContext context) =>
                ArticleBloc(RepositoryProvider.of(context))
                  ..add(LoadArticleEvent()),
          ),
        ],
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Flutter challenge(Arc)"),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 70,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoryCard(
                            imageAssetUrl: categories[index].imageAssetUrl,
                            categoryName: categories[index].categoryName,
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        if (value.length >= 3) {
                          _dataRepository.searchByKeyWord(value);
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Search',
                        hintText: 'Search for something...',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: BlocBuilder<ArticleBloc, ArticleState>(
                      builder: ((context, state) {
                    if (state is ArticleLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                      // debugPrint("Loading ...");
                    }
                    if (state is ArticleLoadedState) {
                      List<Articles> articles = state.articles;
                      return SingleChildScrollView(
                        child: SizedBox(
                          height: 400.h,
                          child: ListView.builder(
                              itemCount: articles.length,
                              itemBuilder: (context, index) {
                                return NewsTile(
                                    imgUrl:
                                        "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                                    title: articles[index].title,
                                    description: articles[index].source?.name,
                                    articleUrl: articles[index].url);
                              }),
                        ),
                      );
                    }
                    return Container();
                  })),
                ),
              ],
            )));
  }
}
