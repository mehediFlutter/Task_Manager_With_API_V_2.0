import 'package:flutter/material.dart';
import 'package:task_manager/data/model/task_list_model.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key, required this.data,
  });
  final TaskData data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:  Text(data.title??'Unknown'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(data.description??''),
           Text(data.createdDate??''),
          Row(
            children: [
               Chip(
                label: Text(
                data.status??  'New',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.blue,
              ),
              const Spacer(),
              IconButton(onPressed: (){}, icon: const Icon(Icons.delete),color: Colors.red,),
              IconButton(onPressed: (){}, icon: const Icon(Icons.edit),color: Colors.green  ,),
            ],
          )
        ],
      ),
    );
  }
}