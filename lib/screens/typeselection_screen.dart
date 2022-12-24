import 'package:bizlers/constant/string.dart';
import 'package:bizlers/screens/makeselection_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TypeSelection extends StatelessWidget {
  const TypeSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Select Wheelers"),
        ),
        body: ListView.builder(
            itemCount: wheeler.length,
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
                        wheeler[index],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Strings.wheelerType = wheeler[index];
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const MakeSelection()));
                      },
                      child: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              );
            }));
  }
}
