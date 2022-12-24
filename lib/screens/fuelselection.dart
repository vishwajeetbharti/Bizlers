import 'package:bizlers/constant/string.dart';
import 'package:bizlers/screens/transmissionselection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FuelSelection extends StatelessWidget {
  const FuelSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Select Wheelers"),
        ),
        body: ListView.builder(
            itemCount: fuelType.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
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
                        fuelType[index],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Strings.fuelType = fuelType[index];
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    const TransmissionSelection()));
                      },
                      child: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              );
            }));
  }
}
