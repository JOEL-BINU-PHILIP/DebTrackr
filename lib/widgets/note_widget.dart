import 'package:flutter/material.dart';
import 'package:debtrackr/DataModel/note_model.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  const NoteWidget(
      {super.key,
      required this.note,
      required this.onLongPress,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                Align(alignment: Alignment.center,child: Text(note.title , style: const TextStyle( fontSize: 18 , fontWeight: FontWeight.w600 ),),),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Align(alignment: Alignment.center,child: Text(note.title , style: const TextStyle( fontSize: 18 , fontWeight: FontWeight.bold ),),),              
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Text(
                  note.description,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
