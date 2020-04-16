import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class CardTadabir extends StatelessWidget {
  List<Color> colors = [];
  List<double> stops = [];
  String textCardTadabir = "";
  String pageLink = "";
  String pageRoute = "";

  CardTadabir(this.colors, this.stops, this.textCardTadabir, this.pageLink,
      this.pageRoute);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 11.0, left: 11.0),
      child: Container(
         decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: colors,
                  //     //  stops: stops,
                )),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              if (pageLink != null) {
                launch(pageLink);
              }
              if (pageRoute != null) {
                Navigator.pushNamed(context, pageRoute);
              }
            },
            child: Container(
          //    margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.only(right: 15),
             
              height: 111,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Flexible(
                    flex: 6,
                    child: Text(
                      textCardTadabir,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    flex: 1,
                    child: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 29,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
