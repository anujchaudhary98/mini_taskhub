import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../widgets/task_tile.dart';
import 'login_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final client = Supabase.instance.client;
  List<dynamic> tasks = [];

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  void fetchTasks() async {
    final user = client.auth.currentUser;
    final res = await client.from('tasks').select().eq('user_id', user!.id);
    setState(() {
      tasks = res;
    });
  }

  void addTask(String title) async {
    final user = client.auth.currentUser;
    await client.from('tasks').insert({'title': title, 'is_completed': false, 'user_id': user!.id});
    fetchTasks();
  }

  void deleteTask(String id) async {
    await client.from('tasks').delete().eq('id', id);
    fetchTasks();
  }

  void logout() async {
    await client.auth.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
  }

  void showAddTaskDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Add Task'),
        content: TextField(controller: controller, decoration: InputDecoration(hintText: 'Enter task name')),
        actions: [
          TextButton(
            onPressed: () {
              addTask(controller.text);
              Navigator.pop(context);
            },
            child: Text('Add'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout))],
      ),
      body: ListView(
        children: tasks.map((task) => TaskTile(task: task, onDelete: deleteTask)).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddTaskDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
