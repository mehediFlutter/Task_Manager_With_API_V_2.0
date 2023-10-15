
import 'package:flutter/material.dart';

class SummaryCount extends StatelessWidget {
  const SummaryCount({
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