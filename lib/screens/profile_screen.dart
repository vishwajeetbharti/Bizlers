import 'package:bizlers/constant/lists.dart';
import 'package:bizlers/constant/string.dart';
import 'package:bizlers/provider/sqlitedb.dart';
import 'package:bizlers/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.index, required this.check})
      : super(key: key);
  final int index;
  final bool check;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            color: const Color(0xFF7200FF),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const HomeScreen()),
                            (route) => false);
                      },
                      child: Container(
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.02,
                            top: MediaQuery.of(context).size.height * 0.05,
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await DatabaseHelper.instance.deleteRecord(
                            (widget.check == true)
                                ? Strings.number
                                : Lists.vehiclesDb[widget.index]
                                    ["vehiclesNumber"]);
                        Fluttertoast.showToast(msg: "Deleted");
                        Navigator.pop(context);
                      },
                      child: Container(
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.02,
                            top: MediaQuery.of(context).size.height * 0.05,
                          ),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.02,
                        top: MediaQuery.of(context).size.height * 0.34,
                      ),
                      child: Text(
                        (widget.check == true)
                            ? Strings.selectionModel
                            : Lists.vehiclesDb[widget.index]["vehiclesName"],
                        style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.02,
                        top: MediaQuery.of(context).size.height * 0.001,
                      ),
                      child: Text(
                        (widget.check == true)
                            ? Strings.number
                            : Lists.vehiclesDb[widget.index]["vehiclesNumber"],
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    top: MediaQuery.of(context).size.height * 0.05),
                child: const Text(
                  "Make",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.4,
                    top: MediaQuery.of(context).size.height * 0.05),
                child: const Text(
                  "Model",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    top: MediaQuery.of(context).size.height * 0.01),
                child: Center(
                  child: Text(
                    (widget.check == true)
                        ? Strings.selectionMake
                        : Lists.vehiclesDb[widget.index]["vehiclesMake"],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.3,
                    top: MediaQuery.of(context).size.height * 0.01),
                child: Center(
                  child: Text(
                    (widget.check == true)
                        ? Strings.selectionModel
                        : Lists.vehiclesDb[widget.index]["vehiclesModel"],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    top: MediaQuery.of(context).size.height * 0.05),
                child: const Text(
                  "Fuel Type",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.3,
                    top: MediaQuery.of(context).size.height * 0.05),
                child: const Text(
                  "Transmission",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    top: MediaQuery.of(context).size.height * 0.01),
                child: Center(
                  child: Text(
                    (widget.check == true)
                        ? Strings.fuelType
                        : Lists.vehiclesDb[widget.index]["vehiclesFuelType"],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.3,
                    top: MediaQuery.of(context).size.height * 0.01),
                child: Center(
                  child: Text(
                    (widget.check == true)
                        ? Strings.transmissionType
                        : Lists.vehiclesDb[widget.index]
                            ["vehiclesTransmission"],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
