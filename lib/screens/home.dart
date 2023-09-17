import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_sample_4/models/contact_model.dart';
import 'package:hive_sample_4/screens/add_contacts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Box contactBox = Hive.box<Contacts>('Contacts');
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(),
    floatingActionButton: FloatingActionButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTodo())),),
    );
  }
}