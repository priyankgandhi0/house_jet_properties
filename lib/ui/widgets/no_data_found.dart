import 'package:flutter/cupertino.dart';
import 'package:house_jet_properties/utils/extension.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: "No Data Found".appBlackText1B1B1B(fontWeight: FontWeight.w500),);
  }
}
