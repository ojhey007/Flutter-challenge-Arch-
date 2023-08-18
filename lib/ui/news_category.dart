import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xflutter/blocs/article/categories/category_bloc.dart';
import 'package:xflutter/blocs/article/categories/category_event.dart';
import 'package:xflutter/blocs/article/categories/category_state.dart';
import 'package:xflutter/model/article_model.dart';
import 'package:xflutter/repository/repositories.dart';
import 'package:xflutter/ui/news_tile.dart';
import 'package:xflutter/ui/widget/app_bar.dart';

class NewsCategory extends StatefulWidget {
  NewsCategory({super.key, required this.category, this.categoryImg});
  final String category;
  final categoryImg;

  @override
  State<NewsCategory> createState() => _NewsCategoryState();
}

class _NewsCategoryState extends State<NewsCategory> {
  final CategoryBloc _categoryBloc = CategoryBloc();

  @override
  void initState() {
    _categoryBloc.add(LoadCategoryEvent(widget.category));

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(20, 64),
        child: AppBarMenu(
          appTitle: widget.category.toUpperCase(),
        ),
      ),
      body: BlocProvider(
        create: (BuildContext context) => _categoryBloc,
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (BuildContext context, state) {
            if (state is CategoryLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is CategoryLoadedState) {
              List<Articles> articles = state.categories;
              return SafeArea(
                  child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: ListView.builder(
                      itemCount: articles.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return NewsTile(
                            imgUrl: widget.categoryImg,
                            title: articles[index].title,
                            description: articles[index].source?.name,
                            articleUrl: articles[index].url);
                      }),
                ),
              ));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
