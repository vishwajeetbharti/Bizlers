import 'package:bizlers/constant/string.dart';
import 'package:bizlers/provider/screen_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Selection extends StatefulWidget {
  const Selection({Key? key, required this.tittle, required this.show})
      : super(key: key);
  final String tittle;
  final List show;
  @override
  State<Selection> createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScreenManager>(context);

    // getApiData();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.tittle),
        ),
        body: ListView.builder(
            itemCount: widget.show.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.075,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Strings.selection = widget.show[index];

                          if (widget.tittle == "Select Wheeler") {
                            provider.manager("Select Make", context);
                          } else if (widget.tittle == "Select Make") {
                            provider.manager("Select Model", context);
                          } else if (widget.tittle == "Select Model") {
                            provider.manager("Select FuelType", context);
                          } else if (widget.tittle == "Select FuelType") {
                            provider.manager("Select Transmission", context);
                          } else {
                            provider.manager("showProfile", context);
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: Text(
                            widget.show[index],
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              );
            }));
  }
}
