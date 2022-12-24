import 'package:bizlers/constant/lists.dart';
import 'package:bizlers/constant/string.dart';
import 'package:bizlers/provider/profile_provider.dart';
import 'package:bizlers/screens/fuelselection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ModelSelection extends StatefulWidget {
  const ModelSelection({Key? key, required this.model}) : super(key: key);
  final String model;

  @override
  State<ModelSelection> createState() => _ModelSelectionState();
}

class _ModelSelectionState extends State<ModelSelection> {
  void getApiData() async {
    Future<List> list;
    final provider = Provider.of<ApiProvider>(context);
    list = provider.hondaVehicles(widget.model.toLowerCase());
    Lists.modelData = await list;
    if (Lists.modelData.isEmpty) {
      Fluttertoast.showToast(msg: "empty info");
    }
  }

  @override
  Widget build(BuildContext context) {
    getApiData();
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.wheelerType),
        ),
        body: ListView.builder(
            itemCount: Lists.modelData.length,
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
                          Lists.modelData[index],
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Strings.selectionModel = Lists.modelData[index];
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        const FuelSelection()));
                          },
                          child: const Icon(Icons.arrow_forward_ios)),
                    ],
                  ),
                ),
              );
            }));
  }
}
