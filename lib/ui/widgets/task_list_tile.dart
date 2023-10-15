import 'package:flutter/material.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Title will be here"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Sub-title will be here"),
          const Text("Date"),
          Row(
            children: [
              const Chip(
                label: Text(
                  'New',
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