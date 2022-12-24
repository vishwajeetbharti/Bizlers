import 'package:bizlers/constant/lists.dart';
import 'package:bizlers/provider/sqlitedb.dart';
import 'package:bizlers/screens/profile_screen.dart';
import 'package:bizlers/screens/vehiclesprofile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loading = true;
  void getVehicleData() async {
    setState(() {
      loading = true;
    });
    Lists.vehiclesDb = await DatabaseHelper.instance.queryRecord();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => getVehicleData());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vehicles"),
      ),
      body: loading
          ? Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.white,
              size: 200,
            ))
          : Container(
              margin: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: Lists.vehiclesDb.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.2,
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height:
                                    MediaQuery.of(context).size.width * 0.05,
                                margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.01),
                                child: Text(
                                  Lists.vehiclesDb[index]["vehiclesName"],
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => ProfileScreen(
                                                index: index,
                                                check: false,
                                              )));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.4),
                                  child: const Icon(
                                      Icons.arrow_forward_ios_outlined),
                                ),
                              )
                            ]),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.01),
                              child: Text(
                                Lists.vehiclesDb[index]["vehiclesNumber"],
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => VehiclesProfile()));
        },
        child: const Text(
          "+",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
