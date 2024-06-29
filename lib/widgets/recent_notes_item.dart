// Stateful ||  Stateless || Function returns widget

// class => more memory
// function => less memory

// Flutter => trees to build UI, Keys

import 'package:flutter/material.dart';
import 'package:notes_app_cli/notes_app_cli.dart';

class RecentNotesItem extends StatelessWidget {
  const RecentNotesItem({super.key});

  @override
  Widget build(BuildContext context) {
  print(NoteController().notes);
    return Container(
      width: 150,
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Daily Supplements',
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          Text(
            'Whey protein',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          Text(
            'Daily Supplements From the gym of Mumbai, But for only Golds gym',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
