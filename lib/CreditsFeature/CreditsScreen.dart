import 'package:debtrackr/Models/note_model.dart';
import 'package:debtrackr/CreditsFeature/creditsAddScreen.dart';
import 'package:flutter/material.dart';
import '../../services/database_helper.dart';
import '../../widgets/note_widget.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
void handleClick(String value) {
  switch (value) {
    case 'Delete All Credits':
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Are you sure you want to delete all credit logs?'),
            actions: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: () async {
                  await DatabaseHelper.deleteAllCredits();
                  Navigator.pop(context);
                  setState(() {});
                },
                child: const Text('Yes'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('No'),
              ),
            ],
          );
        },
      );
      break;
    case 'Settings':
      // Handle Settings option
      break;
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'Delete All Credits'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
          backgroundColor: const Color(0xFF535C91),
          title: const Text('Credits'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF1B1A55),
          onPressed: () async {
            await Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NoteScreen()));
            setState(() {});
          },
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder<List<Note>?>(
          future: DatabaseHelper.getAllCredits(),
          builder: (context, AsyncSnapshot<List<Note>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.hasData) {
              if (snapshot.data != null) {
                return ListView.builder(
                  itemBuilder: (context, index) => NoteWidget(
                    note: snapshot.data![index],
                    onTap: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NoteScreen(
                                    note: snapshot.data![index],
                                  )));
                      setState(() {});
                    },
                    onLongPress: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                  'Are you sure you want to delete this credit Log?'),
                              actions: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red)),
                                  onPressed: () async {
                                    await DatabaseHelper.deleteCredit(
                                        snapshot.data![index]);
                                    Navigator.pop(context);
                                    setState(() {});
                                  },
                                  child: const Text('Yes'),
                                ),
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('No'),
                                ),
                              ],
                            );
                          });
                    },
                  ),
                  itemCount: snapshot.data!.length,
                );
              }
              return const Center(
                child: Text('No notes yet'),
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}
