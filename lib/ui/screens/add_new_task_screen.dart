import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/user_profile_banner.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserProfileBanner(),
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
                    decoration: InputDecoration(
                      hintText: "Title",
                      
                    ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Description",
                      
                  
                    ),
                    ),
                    SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        
                      },
                      child: const Icon(Icons.arrow_forward),
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