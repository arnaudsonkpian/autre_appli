import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widgets/task_title.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final tasks=Provider.of<TaskProvider>(context).tasks;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notre fameux TODO LIST'),
      ),
      body:ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context ,index){
        final task=tasks[index];
        return TaskTitle( task:task,id: task.id, title: task.title, isDone: task.isDone, onChanged: (value){
          Provider.of<TaskProvider>(context, listen: false).updateCheckBox(task.id);
          
        },
        onDelete:(){
          Provider.of<TaskProvider>(context,listen:false).removeTask(task);
        },       
        
        
         updateTask: () { 
          Provider.of<TaskProvider>(context,listen: false).updateTask(task);
         },  
              
        
        
        );
          
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add-task');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
