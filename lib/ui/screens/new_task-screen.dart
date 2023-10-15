import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Row(
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
          Expanded(
              child: ListView.separated(
            itemCount: 20,
            itemBuilder: (context, index) {
              return  ListTile(
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
                        Spacer(),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.delete),color: Colors.red,),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.edit),color: Colors.green  ,),
                      ],
                    )
                  ],
                ),
              );
            }, separatorBuilder: (BuildContext context, int index) { return Divider(height: 4,); },
          ))
        ],
      ),
    );
  }
}
