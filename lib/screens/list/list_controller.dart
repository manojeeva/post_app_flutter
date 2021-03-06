import 'package:flutter/material.dart';
import '../../data/models/todo_model.dart';

class ListController {
  final _fullList = <PostModel>[
    PostModel(
      title: 'Title 1',
      description: "Description about the title 1",
      imagePath: null,
    ),
    PostModel(
      title: 'Title 2',
      description: "Description about the title 2",
      imagePath: null,
    ),
    PostModel(
      title: 'Title 3',
      description: "Description about the title 3",
      imagePath: null,
    ),
  ];
  final list = ValueNotifier(<PostModel>[]);

  String searchText = "";
  void onInit() {
    list.value.addAll(_fullList);
  }

  void onChangeSearchInput(String value) {
    list.value.clear();
    searchText = value;
    if (value.isEmpty) {
      list.value = List.from(_fullList);
    }
    list.value = _fullList
        .where((item) =>
            item.title.contains(value) || item.description.contains(value))
        .toList();
  }

  void onSaveNewItem(PostModel model) {
    _fullList.insert(0, model);
    onChangeSearchInput(searchText);
  }
}
