import 'package:debtrackr/DataModel/note_model.dart';
import 'package:debtrackr/services/database_helper.dart';
import 'package:flutter/material.dart';

class DueNoteScreen extends StatefulWidget {
  final Note? note;
  const DueNoteScreen({super.key, this.note});

  @override
  State<DueNoteScreen> createState() => _DueNoteScreenState();
}

class _DueNoteScreenState extends State<DueNoteScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final amountController = TextEditingController();
  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int? numberValue;
    if (widget.note != null) {
      titleController.text = widget.note!.title;
      descriptionController.text = widget.note!.description;
      amountController.text = widget.note!.amount.toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'Add a Due' : 'Edit note'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 33.9),
              child: Center(
                child: Text(
                  'What are your Dues?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    titleController.text = value;
                  });
                },
                controller: titleController,
                maxLines: 1,
                decoration: const InputDecoration(
                    hintText: 'Title',
                    labelText: 'Dues title',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0.75,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ))),
              ),
            ),
            Padding(padding: const EdgeInsets.only(bottom: 20), child: TextField(
              controller: amountController,
              decoration: const InputDecoration(
                  hintText: 'Type the note amount',
                  labelText: 'Amount',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0.75,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ))),
              keyboardType: TextInputType.number,
              onChanged: (str) {
                setState(() {
                  print(str);
                  amountController.text = str;
                });
              },
            ),),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                  hintText: 'Type here the note',
                  labelText: 'Due description',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0.75,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ))),
              keyboardType: TextInputType.multiline,
              onChanged: (str) {
                setState(() {
                  descriptionController.text = str;
                });
              },
              maxLines: 5,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () async {
                      String title = titleController.value.text;
                      String description = descriptionController.value.text;
                      String? numberText = amountController.text;
                      if (numberText.isNotEmpty) {
                        // Use int.parse() to convert the text to a double value
                        numberValue = int.tryParse(numberText);
                        print(numberValue);
                      }

                      if (title.isEmpty ||
                          description.isEmpty ||
                          numberValue == null) {
                        return;
                      }

                      final Note model = Note(
                          title: title,
                          description: description,
                          id: widget.note?.id,
                          amount: numberValue!.toInt());
                      if (widget.note == null) {
                        await DatabaseHelper.addDEbt(model);
                      } else {
                        await DatabaseHelper.updateDues(model);
                      }

                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Color(0xFF1B1A55)),
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Color(0xFF6940FF),
                                  width: 0.75,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                )))),
                    child: Text(
                      widget.note == null ? 'Save' : 'Edit',
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