import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/summary_card.dart';
import 'package:task_manager/ui/widgets/task_list_tile.dart';

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
            const ListTile(
              contentPadding:EdgeInsets.symmetric(vertical: 0, horizontal: 16) ,
              tileColor: Colors.green,
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg"),
                  ),
                  title: Text("User name",style: TextStyle(fontSize: 14,color: Colors.white),),
                  subtitle: Text("User email",style: TextStyle(fontSize: 14,color: Colors.white)),
                ),
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
    );
  }
}
