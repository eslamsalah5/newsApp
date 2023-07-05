import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../modules/search_screen.dart';
import '../../../shared/components/widgets/navigate_to.dart';
import 'cubit.dart';
import 'state.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) => BlocConsumer<NewsCubit, NewsState>(
              listener: (context, state) {},
              builder: (context, state) {
                NewsCubit cubit = NewsCubit.get(context);
                return Scaffold(
                  appBar: AppBar(
                    title: Text(cubit.titles[cubit.currentPage]),
                    actions: [
                      IconButton(
                          onPressed: () {
                            navigateTo(context, SearchScreen());
                          }, icon: const Icon(Icons.search)),
                      IconButton(
                          onPressed: () {
                            cubit.changeModeApp();
                            print(cubit.isDark);
                          },
                          icon: const Icon(Icons.brightness_4_outlined)),
                    ],
                  ),
                  body: cubit.page[cubit.currentPage],
                  bottomNavigationBar: BottomNavigationBar(
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.business), label: 'business'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.sports_baseball_rounded),
                          label: 'sports'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.science), label: 'science'),
                    ],
                    currentIndex: cubit.currentPage,
                    onTap: (value) {
                      cubit.changeIndex(value);
                    },
                    type: BottomNavigationBarType.fixed,
                  ),
                );
              },
            ));
  }
}
