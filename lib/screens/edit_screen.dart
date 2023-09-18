import 'package:flutter/material.dart';


class EditScreen extends StatelessWidget {
  String name;
  String number;
   EditScreen({

    super.key, required this.name, required this.number
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
           
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('SAVE'))
          ],
        ),
      ),
    );
  }
}
