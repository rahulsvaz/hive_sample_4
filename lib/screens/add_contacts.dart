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
              keyboardType: TextInputType.phone,
              controller: numberController,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  if (numberController.text.isNotEmpty &&
                      nameController.text.isNotEmpty) {
                    Contacts contacts = Contacts(
                        name: nameController.text.toString(),
                        number: numberController.text.toString());

                    contactBox.add(contacts);
                    nameController.clear();
                    numberController.clear();
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Contact saved successfully')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Add Name and number')));
                  }
                },
                child: const Text('Save')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'))
          ],
        ),
      ),
    );
  }
}
