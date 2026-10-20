
import 'package:flutter/material.dart';
import '../presenters/assignment_presenter.dart';

class AssignmentListScreen extends StatefulWidget {
  const AssignmentListScreen({super.key});

  @override
  State<AssignmentListScreen> createState() =>
      _AssignmentListScreenState();
}

class _AssignmentListScreenState
    extends State<AssignmentListScreen> {
  final AssignmentPresenter _presenter = AssignmentPresenter();

  void _showAddAssignmentDialog() {
    String newAssignmentTitle = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Assignment'),
          content: TextField(
            onChanged: (value) {
              newAssignmentTitle = value;
            },
            decoration: const InputDecoration(
              hintText: 'Enter assignment name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (newAssignmentTitle.isNotEmpty) {
                  setState(() {
                    _presenter.addAssignment(newAssignmentTitle.trim());
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    final assignments = _presenter.assignments;

    return Scaffold(
      appBar: AppBar(title: const Text('Assignments')),
      body: ListView.builder(
        itemCount: assignments.length,
        itemBuilder: (context, index) {
          final assignment = assignments[index];
          return CheckboxListTile(
            title: Text(assignment.title),
            value: assignment.isCompleted,
            onChanged: (value) {
              setState(() {
                _presenter.toggleCompleted(index);
              });
            },
          ); // CheckboxListTile
        },
      ), // ListView.builder
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddAssignmentDialog,
        child: const Icon(Icons.add),
      ), // FloatingActionButton
    ); // Scaffold
  }
}
