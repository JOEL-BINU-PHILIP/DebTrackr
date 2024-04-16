import 'package:debtrackr/DataModel/note_model.dart';
import 'package:debtrackr/services/database_helper.dart';
import 'package:flutter/material.dart';

class NoteScreen extends StatelessWidget {
  final Note? note;
  const NoteScreen({super.key, this.note});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();
    final descriptionController = TextEditingController();

    if (note != null) {
      titleController.text = note!.title;
      descriptionController.text = note!.description;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(note == null ? 'Add a note' : 'Edit Note'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Center(
                child: Text(
                  ' What are you thinking about?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: TextFormField(
                controller: titleController,
                maxLines: 1,
                decoration: const InputDecoration(
                    hintText: 'Title',
                    labelText: 'Note Title',
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 0.75),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              ),
            ),
            TextFormField(
              controller: amountController,
              decoration: const InputDecoration(
                  hintText: 'Type the amount',
                  labelText: ' Amount to be credited',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0.75,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              keyboardType: TextInputType.number,
              onChanged: (int) {},
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                  hintText: 'Type The Note',
                  labelText: ' Credit Description',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0.75,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              keyboardType: TextInputType.multiline,
              onChanged: (str) {},
              maxLines: 5,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () async {
                      final title = titleController.text;
                      final description = descriptionController.text;
                      final amount = amountController.text;
                      if (title.isEmpty || description.isEmpty || amount.isEmpty) {
                        return;
                      }
                      final Note model = Note(amount: amount, description: description, id: note!.id, title: title);
                      if(note == null){
                        await DatabaseHelper.addNote(model);
                      }
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                                color: Colors.white, width: 0.75)))),
                    child: Text( note == null ? 
                      'Save' : 'Edit',
                      style: const TextStyle(fontSize: 20),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
