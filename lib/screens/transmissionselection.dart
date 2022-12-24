import 'package:bizlers/constant/string.dart';
import 'package:bizlers/provider/sqlitedb.dart';
import 'package:bizlers/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransmissionSelection extends StatelessWidget {
  const TransmissionSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseHelper>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Select Wheelers"),
        ),
        body: ListView.builder(
            itemCount: transmissionType.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.075,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05,
                        ),
                        child: Text(
                          transmissionType[index],
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          Strings.transmissionType = transmissionType[index];
                          await DatabaseHelper.instance.insertRecord({
                            DatabaseHelper.columnNumber: Strings.number,
                            DatabaseHelper.columnName: Strings.selectionModel,
                            DatabaseHelper.columnModel: Strings.selectionModel,
                            DatabaseHelper.columnMake: Strings.selectionMake,
                            DatabaseHelper.columnFuelType: Strings.fuelType,
                            DatabaseHelper.columnTransmission:
                                Strings.transmissionType,
                          });
                          Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => ProfileScreen(
                                        index: 0,
                                        check: true,
                                      )),
                              (route) => false);
                        },
                        child: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
