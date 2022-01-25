import 'package:flutter/material.dart';
import 'package:todo_app/data/models/todo_model.dart';
import 'package:todo_app/screens/add/add_view.dart';
import 'package:todo_app/screens/list/list_controller.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final controller = ListController();

  @override
  void initState() {
    controller.onInit();
    super.initState();
  }

  void onPressAdd() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return AddPage(onSave: controller.onSaveNewItem);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feed"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressAdd,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          SearchFeedWidget(
            onChangeInput: controller.onChangeSearchInput,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ValueListenableBuilder<List<PostModel>>(
              valueListenable: controller.list,
              builder: (_, value, __) {
                if (value.isEmpty) {
                  return const Center(
                    child: Text("List is empty please add items"),
                  );
                }
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (_, index) {
                    final model = value[index];
                    return ListItem(
                      model: model,
                      onPressFavorite: () {},
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchFeedWidget extends StatelessWidget {
  final ValueChanged<String> onChangeInput;
  const SearchFeedWidget({
    Key? key,
    required this.onChangeInput,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Search",
      ),
      onChanged: onChangeInput,
    );
  }
}

class ListItem extends StatelessWidget {
  final PostModel model;
  final VoidCallback onPressFavorite;
  const ListItem({
    Key? key,
    required this.model,
    required this.onPressFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.title,
            style: textTheme.headline4,
          ),
          const SizedBox(height: 5),
          Text(
            model.description,
            maxLines: 5,
            style: textTheme.bodyText1,
          ),
          const SizedBox(height: 5),
          const AspectRatio(aspectRatio: 2 / 1, child: Placeholder()),
          // AspectRatio(
          //   aspectRatio: 1 / 2,
          //   child: Image.file(model.imagePath),
          // ),
          const SizedBox(height: 5),
          Row(
            children: [
              Container(child: Text("10")),
              const SizedBox(width: 5),
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: onPressFavorite,
              )
            ],
          )
        ],
      ),
    );
  }
}
