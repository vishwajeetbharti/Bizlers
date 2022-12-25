import 'package:bizlers/constant/lists.dart';
import 'package:bizlers/constant/string.dart';
import 'package:bizlers/provider/profile_provider.dart';
import 'package:bizlers/provider/sqlitedb.dart';
import 'package:bizlers/screens/profile_screen.dart';
import 'package:bizlers/screens/selections.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ScreenManager extends ChangeNotifier {
  void manager(String tittleText, BuildContext context) async {
    if (tittleText == "Select Wheeler") {
      Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) =>
                  Selection(tittle: tittleText, show: wheeler)));
    } else if (tittleText == "Select Make") {
      Strings.wheelerType = Strings.selection;

      Future<List> list;
      final provider = Provider.of<ApiProvider>(context, listen: false);
      if (Strings.wheelerType == wheeler[0]) {
        list = provider.makes2wVehicles();
      } else {
        list = provider.makes4wVehicles();
      }

      Lists.makeData = await list;
      Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) =>
                  Selection(tittle: tittleText, show: Lists.makeData)));
    } else if (tittleText == "Select Model") {
      Strings.selectionMake = Strings.selection;

      Future<List> list;
      final provider = Provider.of<ApiProvider>(context, listen: false);
      list = provider.hondaVehicles(Strings.selection.toLowerCase());
      Lists.modelData = await list;
      if (Lists.modelData.isEmpty) {
        Fluttertoast.showToast(msg: "empty info");
      } else {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) =>
                    Selection(tittle: tittleText, show: Lists.modelData)));
      }
    } else if (tittleText == "Select FuelType") {
      Strings.selectionModel = Strings.selection;

      Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) =>
                  Selection(tittle: tittleText, show: fuelType)));
    } else if (tittleText == "Select Transmission") {
      Strings.fuelType = Strings.selection;

      Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) =>
                  Selection(tittle: tittleText, show: transmissionType)));
    } else {
      Strings.transmissionType = Strings.selection;

      await DatabaseHelper.instance.insertRecord({
        DatabaseHelper.columnNumber: Strings.number,
        DatabaseHelper.columnName: Strings.selectionModel,
        DatabaseHelper.columnModel: Strings.selectionModel,
        DatabaseHelper.columnMake: Strings.selectionMake,
        DatabaseHelper.columnFuelType: Strings.fuelType,
        DatabaseHelper.columnTransmission: Strings.transmissionType,
      });
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(
              builder: (context) => ProfileScreen(
                    index: 0,
                    check: true,
                  )),
          (route) => false);
    }
  }
}
