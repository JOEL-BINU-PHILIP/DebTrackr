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
          color: const Color.fromARGB(255, 180, 191, 255),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                Align(alignment: Alignment.center,child: Text(note.title , style: const TextStyle( color: Colors.black,fontSize: 18 , fontWeight: FontWeight.w600 ),),),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: Divider(
                    color: Color(0xFF1B1A55),
                    thickness: 1,
                  ),
                ),
                Text("₹ ${note.amount} ", style: const TextStyle(color: Color(0xFF1D7822) , fontWeight: FontWeight.bold , fontSize: 22),),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: Divider(
                    color: Color(0xFF1B1A55),
                    thickness: 1,
                  ),
                ),
                Text(
                  note.description,
                  style: const TextStyle(
                    color: Colors.black,
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
