import 'package:flutter/material.dart';
import 'package:todo_app/data/models/todo_model.dart';

class ListController {
  final _fullList = <TodoModel>[
    TodoModel(
      title: 'Title 1',
      description: "Description about the title 1",
      imagePath: null,
    ),
    TodoModel(
      title: 'Title 2',
      description: "Description about the title 2",
      imagePath: null,
    ),
    TodoModel(
      title: 'Title 3',
      description: "Description about the title 3",
      imagePath: null,
    ),
  ];
  final list = ValueNotifier(<TodoModel>[]);

  void onInit() {
    list.value.addAll(_fullList);
  }

  void onChangeSearchInput(String value) {
    list.value.clear();
    list.value.addAll(_fullList.where((item) =>
        item.title.contains(value) || item.description.contains(value)));
  }
}