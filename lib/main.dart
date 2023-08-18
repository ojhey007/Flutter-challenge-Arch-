import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xflutter/blocs/article/categories/category_bloc.dart';
import 'package:xflutter/blocs/article/categories/category_event.dart';
import 'package:xflutter/repository/repositories.dart';
import 'package:xflutter/ui/home.dart';

import 'blocs/article/article_bloc.dart';
import 'blocs/article/article_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Flutter Challenge',
          theme: ThemeData(),
          home: MultiBlocProvider(
            providers: [
              BlocProvider<ArticleBloc>(
                create: (BuildContext context) =>
                    ArticleBloc(RepositoryProvider.of(context))
                      ..add(LoadArticleEvent()),
              )
            ],
            child: RepositoryProvider(
                create: (BuildContext context) => FetchDataRepository(),
                child: const HomePage()),
          ),
        );
      },
    );
  }
}
