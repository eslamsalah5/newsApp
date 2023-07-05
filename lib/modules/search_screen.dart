import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../layout/news_app/news/cubit.dart';
import '../layout/news_app/news/state.dart';
import '../shared/components/widgets/article_builder.dart';
import '../shared/components/widgets/text_field.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  var textSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: defaultFormField(controller: textSearchController,
                  type: TextInputType.text,
                  label: 'Search',
                  prefix: (Icons.search),
                  isAutoFocus: true,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'search must not be empty';
                    }
                    return null;
                  },
                  onChange: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                ),
              ),

               Expanded(child: articleBuilder(list,context , isSearch: true))
            ],
          ),
        );
      },
    );
  }
}
