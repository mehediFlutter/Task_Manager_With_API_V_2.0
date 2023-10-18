import 'package:flutter/material.dart';
import 'package:task_manager/data/model/network_response.dart';
import 'package:task_manager/data/model/summary_count_model.dart';
import 'package:task_manager/data/model/task_list_model.dart';
import 'package:task_manager/data/service/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
import 'package:task_manager/ui/widgets/summary_card.dart';
import 'package:task_manager/ui/widgets/task_list_tile.dart';
import 'package:task_manager/ui/widgets/user_profile_banner.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool _getCountSummaryInProgress = false, _getNewTaskInProgress = false;
  SummaryCountModel _summaryCountModel = SummaryCountModel();
  TaskListModels _taskListModels = TaskListModels();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getCountSummary();
      getNewTask();
    });
  }

  Future<void> getCountSummary() async {
    _getCountSummaryInProgress = true;
    if (mounted) {
      setState(() {});
    }

    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.taskStatusCount);
    if (response.isSuccess) {
      _summaryCountModel = SummaryCountModel.fromJson(response.body!);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Summary data loaded successfully")));
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Summary data get faild!!")));
      }
    }
    _getCountSummaryInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> getNewTask() async {
    _getNewTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.newTasks);
    if (response.isSuccess) {
      _taskListModels = TaskListModels.fromJson(response.body!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Task Loaded fail!!")));
      }
    }
    _getNewTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileBanner(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _getCountSummaryInProgress
                  ? const LinearProgressIndicator()
                  : const Row(
                      children: [
                        Expanded(
                            child: SummaryCount(
                          number: '123',
                          title: 'New',
                        )),
                        Expanded(
                            child: SummaryCount(
                          number: '123',
                          title: 'In Progress',
                        )),
                        Expanded(
                            child: SummaryCount(
                          number: '123',
                          title: 'Cancelled',
                        )),
                        Expanded(
                            child: SummaryCount(
                          number: '123',
                          title: 'Completed',
                        )),
                      ],
                    ),
            ),
            Expanded(
                child: RefreshIndicator(
              onRefresh: () async {
                getNewTask();
              },
              child:_getNewTaskInProgress?  const Center(child: CircularProgressIndicator()) : ListView.separated(
                itemCount: _taskListModels.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return TaskListTile(
                    data: _taskListModels.data![index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 4,
                  );
                },
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddNewTaskScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
