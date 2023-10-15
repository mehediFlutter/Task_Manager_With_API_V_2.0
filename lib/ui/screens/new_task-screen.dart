import 'package:flutter/material.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Column(
        children: [
          Row(
            
            children: [
              
              Expanded(child: SummaryCard(number: '123', title: 'New',)),
              Expanded(child: SummaryCard(number: '123', title: 'In Progress',)),
              Expanded(child: SummaryCard(number: '123', title: 'Cancelled',)),
              Expanded(child: SummaryCard(number: '123', title: 'Completed',)),
            ],
          )
        ],
      ),
    );
  }
}



class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key, required this.number, required this.title,
  });
     

     final String number ;
     final String title ;
  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 4,
      child: Column(
        children: [
          Text("123",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 24),),
          Text("New"),
        ],
      ),
    );
  }
}