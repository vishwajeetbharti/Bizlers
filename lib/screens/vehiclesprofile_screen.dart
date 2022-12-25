import 'package:bizlers/constant/string.dart';
import 'package:bizlers/provider/screen_manager.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class VehiclesProfile extends StatelessWidget {
  VehiclesProfile({Key? key}) : super(key: key);
  final TextEditingController controllernumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScreenManager>(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Create new vehicles profile"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.03,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    top: MediaQuery.of(context).size.height * 0.05),
                child: const Text(
                  "VEHICLES NUMBER",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.06,
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  controller: controllernumber,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    counterText: "",
                    hintText: "MH12AB1234",
                    hintStyle: TextStyle(fontSize: 15),
                  ),
                  maxLength: 10,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (controllernumber.text != "" &&
                controllernumber.text.length == 10) {
              Strings.number = controllernumber.text.toString();
              provider.manager("Select Wheeler", context);
            } else {
              Fluttertoast.showToast(msg: "Enter Vehicles number");
            }
          },
          child: const Icon(Icons.arrow_forward_ios)),
    );
  }
}
