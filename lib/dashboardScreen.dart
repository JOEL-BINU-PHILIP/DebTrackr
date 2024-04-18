import 'package:debtrackr/services/database_helper.dart';
import 'package:debtrackr/widgets/DashboardCashWidget.dart';
import 'package:debtrackr/widgets/RoundActionButton.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});
  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int? creditMoney;
  int? debtMoney;
  void getSum() async {
    int creditSum = await DatabaseHelper.sumColumn('amount', 'Note');
    int debtSum = await DatabaseHelper.sumColumn('amount', 'Dues');
    setState(() {
      creditMoney = creditSum;
      debtMoney = debtSum;
    });
  }

  @override
  void initState() {
    getSum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Color(0xFF1B1A55)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15.0), // Adjust border radius as needed
                          ),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings_outlined,
                        size: 32,
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
                  child: SizedBox(
                    child: Image.asset(
                      "assets/Logo.png",
                      height: 60,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DashboardCashWidget(
                    moneyamount: creditMoney.toString(),
                    moneyTextColor: const Color(0xFF00FF0D),
                    buttonColor: const Color(0xFF1B1A55),
                    buttonBorderColor: const Color(0xFF00FF0D),
                    buttonText: "Credits",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 17, bottom: 10),
                  child: DashboardCashWidget(
                    moneyamount: debtMoney == null ? "0" : debtMoney.toString(),
                    buttonColor: const Color(0xFF1B1A55),
                    buttonBorderColor: Colors.redAccent,
                    buttonText: "Dues",
                    moneyTextColor: Colors.redAccent,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                RoundActionButton(
                    symbolicon: Icons.add,
                    assignment: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Alert"),
                            content: const Text("This is an alert dialog."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    })
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
