import 'package:bizlers/constant/lists.dart';
import 'package:bizlers/constant/string.dart';
import 'package:bizlers/provider/profile_provider.dart';
import 'package:bizlers/screens/modelselection_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MakeSelection extends StatefulWidget {
  const MakeSelection({Key? key}) : super(key: key);

  @override
  State<MakeSelection> createState() => _MakeSelectionState();
}

class _MakeSelectionState extends State<MakeSelection> {
  void getApiData() async {
    Future<List> list;
    final provider = Provider.of<ApiProvider>(context);
    if (Strings.wheelerType == wheeler[0]) {
      list = provider.makes2wVehicles();
    } else {
      list = provider.makes4wVehicles();
    }

    Lists.makeData = await list;
  }

  @override
  Widget build(BuildContext context) {
    getApiData();
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.wheelerType),
        ),
        body: ListView.builder(
            itemCount: Lists.makeData.length,
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
                          Lists.makeData[index],
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Strings.selectionMake = Lists.makeData[index];
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => ModelSelection(
                                          model: Lists.makeData[index],
                                        )));
                          },
                          child: const Icon(Icons.arrow_forward_ios)),
                    ],
                  ),
                ),
              );
            }));
  }
}
