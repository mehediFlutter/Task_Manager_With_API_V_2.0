import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileBanner(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
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
                child: ListView.separated(
              itemCount: 20,
              itemBuilder: (context, index) {
                return const TaskListTile();
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 4,
                );
              },
            ))
          ],
        ),
      ),
    floatingActionButton: FloatingActionButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddNewTaskScreen()));
    }, child: const Icon(Icons.add),),
    );
  }
}

