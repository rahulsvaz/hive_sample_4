import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_sample_4/models/contact_model.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    Box contactBox = Hive.box<Contacts>('Contacts');
    TextEditingController nameController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: numberController,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Contacts contacts = Contacts(
                      name: nameController.text.toString(),
                      number: numberController.text.toString());
                  contactBox.add(contacts);
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }
}
