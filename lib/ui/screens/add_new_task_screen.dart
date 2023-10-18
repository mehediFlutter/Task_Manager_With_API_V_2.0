import 'package:flutter/material.dart';
import 'package:task_manager/data/model/network_response.dart';
import 'package:task_manager/data/service/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/user_profile_banner.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();

  bool _addNewTaskInProgress = false;

  Future<void> addNewTask() async {
    _addNewTaskInProgress = true;
    setState(() {});
    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.createTask, <String, dynamic>{
      "title": _titleTEController.text.trim(),
      "description": _descriptionTEController.text.trim(),
      "status": "New"
    });
    _addNewTaskInProgress = false;
    setState(() {});
    print(response.isSuccess);
   

    if (response.isSuccess == true) {
      _titleTEController.clear();
      _descriptionTEController.clear();
      setState(() {
        
      });
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Task added successfyll")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Task added faild")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserProfileBanner(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      "Add New Task",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _titleTEController,
                      decoration: const InputDecoration(
                        hintText: "Title",
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _descriptionTEController,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        hintText: "Description",
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: _addNewTaskInProgress==false,
                        replacement: const Center(child: CircularProgressIndicator(),),
                        child: ElevatedButton(
                          onPressed: () {
                            addNewTask();
                          },
                          child: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
