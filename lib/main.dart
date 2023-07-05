import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news1/shared/components/widgets/bloc_observe.dart';
import 'package:news1/shared/network/remote/dio_helper.dart';
import 'package:news1/shared/network/local/cache_helper.dart';
import 'package:news1/shared/styles/themes.dart';
import 'layout/news_app/news/cubit.dart';
import 'layout/news_app/news/state.dart';
import 'layout/news_app/news/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');

  runApp(MyApp(
    isDark,
  ));
}

class MyApp extends StatelessWidget {
  bool? isDark;

  MyApp(this.isDark, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NewsCubit()
              ..changeModeApp(fromShared: isDark)
              ..getBusiness()
              ..getSports()
              ..getScience()),
      ],
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
              home: const NewsPage());
        },
      ),
    );
  }
}
