import 'package:flutter/material.dart';
import 'package:flutterearthquakes/features/earthquakes/presentation/views/details_page.dart';

import '../../../../resources/dateformater.dart';
import '../../../../resources/viewBuilder/sizing_information.dart';
import '../../../../resources/viewBuilder/textStyles.dart';
import '../../data/models/earthquake.dart';
import '../providers/earthquake_provider.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {Key? key,
      required this.provider,
      required this.sizingInformation,
      required this.sismo})
      : super(key: key);

  final Earthquake sismo;
  final SizingInformation sizingInformation;
  final EarthquakeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(sismo: sismo)));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Container(
            width: sizingInformation.screenSize.width * 0.9,
            height: sizingInformation.screenSize.height * 0.1,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  sizingInformation.screenSize.height * 0.01,
                ),
                boxShadow: [
                  BoxShadow(color: Colors.grey[300]!, offset: Offset(0.0, 3.0))
                ]),
            child: Row(
              children: [
                SizedBox(
                  width: sizingInformation.screenSize.width * 0.7,
                  height: sizingInformation.screenSize.height * 0.08,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: sizingInformation.screenSize.width * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          dateFormat(sismo.fecha),
                          style: dateStyle,
                        ),
                        FittedBox(
                          fit: BoxFit.fill,
                          child: Text(
                            sismo.refGeografica,
                            style: titleStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: sizingInformation.screenSize.width * 0.2,
                  height: sizingInformation.screenSize.height * 0.08,
                  child: Center(
                    child: Text(
                      sismo.magnitud,
                      style: magnitudeStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
