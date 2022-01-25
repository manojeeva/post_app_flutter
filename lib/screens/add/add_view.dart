import 'package:flutter/material.dart';
import 'package:todo_app/data/models/todo_model.dart';
import 'package:todo_app/screens/add/add_controller.dart';
import 'package:todo_app/widgets/input.dart';

class AddPage extends StatefulWidget {
  final ValueChanged<PostModel> onSave;
  const AddPage({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final controller = AddController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Post"),
      ),
      body: Column(
        children: [
          TextFieldWidget(
            onChangeInput: (v) => controller.title = v,
            label: "Title",
          ),
          TextFieldWidget(
            label: "Description",
            onChangeInput: (v) => controller.description = v,
          ),
          const AspectRatio(
            aspectRatio: 2 / 1,
            child: Placeholder(),
          ),
          ElevatedButton(
            onPressed: () {
              widget.onSave(PostModel(
                description: controller.description,
                title: controller.title,
                imagePath: null,
              ));
              Navigator.of(context).pop();
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}
