// Stateful ||  Stateless || Function returns widget

// class => more memory
// function => less memory

// Flutter => trees to build UI, Keys

import 'package:flutter/material.dart';
import 'package:notes_app_cli/notes_app_cli.dart';

class RecentNotesItem extends StatelessWidget {
  const RecentNotesItem(
      {required this.title, required this.description, super.key});

  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    print(NoteController().notes);
    return Container(
      width: 150,
      decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          if (description != null)
            Text(
              description!,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
        ],
      ),
    );
  }
}
