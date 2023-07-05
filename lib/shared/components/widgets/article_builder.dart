import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'news_list_item.dart';

Widget articleBuilder(List list, context,{isSearch = false}) => ConditionalBuilder(
  condition: list.isNotEmpty,
  builder: (context) =>
      ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: list.length),
  fallback: (context) => isSearch ? Container() : const Center(child: CircularProgressIndicator()),
);



