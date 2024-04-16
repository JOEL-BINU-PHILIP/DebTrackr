import 'package:debtrackr/widgets/DashboardCashWidget.dart';
import 'package:debtrackr/widgets/RoundActionButton.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            side: const BorderSide(width: 2 , color: Colors.white),
                            borderRadius: BorderRadius.circular(
                                15.0), // Adjust border radius as needed
                          ),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings_outlined,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SizedBox(child: Image.asset("assets/Logo.png", height:60,),),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: DashboardCashWidget(
                    buttonColor: Color.fromARGB(255, 0, 203, 7),
                    buttonBorderColor: Color.fromRGBO(102, 187, 106, 1),
                    buttonText: "Credits",
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 17, bottom: 10),
                  child: DashboardCashWidget(
                    buttonColor: Color.fromARGB(232, 251, 1, 1),
                    buttonBorderColor: Colors.redAccent,
                    buttonText: "Dues",
                  ),
                ),
                const SizedBox(height: 30,),
                RoundActionButton(symbolicon: Icons.add, assignment: (){})
              ],
            ),
          ),
          ]
        ),
      ),
    );
  }
}
