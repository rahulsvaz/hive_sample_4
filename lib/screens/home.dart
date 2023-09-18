import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_sample_4/models/contact_model.dart';
import 'package:hive_sample_4/screens/add_contacts.dart';
import 'package:hive_sample_4/screens/edit_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Box contactBox = Hive.box<Contacts>('Contacts');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder(
            valueListenable: contactBox.listenable(),
            builder: (context, Box box, widget) {
              if (box.isEmpty) {
                return const Center(
                  child: Text('NO TODO FOUND'),
                );
              } else {
                return ListView.builder(
                    itemCount: contactBox.length,
                    itemBuilder: (context, index) {
                      Contacts contact = box.getAt(index);
                      return ListTile(
                        leading: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditScreen(name: contact.name, number: contact.number)));
                            },
                            icon: Icon(Icons.edit)),
                        trailing: IconButton(
                            onPressed: () {
                              box.deleteAt(index);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Contact deleted Successfully')));
                            },
                            icon: const Icon(Icons.delete)),
                        title: Text(contact.name.toString()),
                        subtitle: Text(contact.number.toString()),
                      );
                    });
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const AddTodo())),
      ),
    );
  }
}
