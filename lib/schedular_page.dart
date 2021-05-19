import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SchedulePage extends StatelessWidget {
  final Color c = const Color.fromARGB(1000, 75, 151, 184);
  Widget buildMain(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      color: c,
      child: ListView(
        // shrinkWrap: true,
        children: [
          Column(
            children: [
              Center(
                child: Text(
                  'MRT',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Image.asset('Assets_3.png',
                  alignment: Alignment.centerRight, height: 200, width: width),
            ],
          ),
          Container(
              // margin: EdgeInsets.only(top: 190),
              height: 700,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(60)),
              child: Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    buildLocations(),
                    buildTitle(),
                    buildSchedule(context,
                        from: '10:00', to: '10:30', mon: '5.0'),
                    bottomDivider(),
                    buildSchedule(context,
                        from: '11:05', to: '11:45', mon: '5.0'),
                    bottomDivider(),
                    buildSchedule(context,
                        from: '11:25', to: '12:30', mon: '3.0'),
                    bottomDivider()
                  ],
                ),
              )),
          // buildLocations()
        ],
      ),
    );
  }

  Container buildSchedule(BuildContext context,
      {String contexxt, from, String to, String mon}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildTimetext(from: from, to: to),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  SizedBox(width: 15),
                  buildInfo(title: 'Lorem MRT Station'),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '\$' + mon,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () => {Navigator.pushNamed(context, '/third')},
                child: Container(
                  decoration: BoxDecoration(
                      color: c, borderRadius: BorderRadius.circular(10)),
                  width: 70,
                  height: 25,
                  child: Center(
                    child: Text(
                      'Select',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container buildTitle() {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 10),
      child: Text(
        'Choose Schedule',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }

  Container bottomDivider() {
    return Container(
      height: 3,
      width: 400,
      color: Colors.grey,
      margin: EdgeInsets.only(top: 20, bottom: 20),
    );
  }

  Column buildInfo({String title}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Row buildTimetext({String from, String to}) {
    return Row(
      children: [
        Icon(Icons.timer),
        SizedBox(width: 15),
        buildfirsttime(from),
        Icon(
          Icons.trending_neutral_outlined,
          color: Colors.grey,
        ),
        buildfirsttime(to),
      ],
    );
  }

  Text buildfirsttime(String text) {
    return Text(text,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ));
  }

  Container buildLocations() {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 40),
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                blurRadius: 10,
                color: Color(0x33000000),
                offset: Offset(0, 2),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // SizedBox(
            //   width: 15,
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.location_on,
                    size: 35,
                  ),
                  onPressed: () => SystemChrome.setEnabledSystemUIOverlays([]),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 3,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10,
                ),
                IconButton(
                  icon: Icon(
                    Icons.location_on,
                    size: 35,
                    color: c,
                  ),
                  onPressed: () => SystemChrome.setEnabledSystemUIOverlays([]),
                ),
              ],
            ),
            // SizedBox(
            //   width: 35,
            // ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildPlaces(title: 'From', place: 'Lorem MRT Station'),
                Container(
                  // margin: EdgeInsets.all(10),
                  height: 3,
                  width: 150,
                  color: Colors.grey,
                ),
                buildPlaces(title: 'To', place: 'Lorem MRT Station'),
              ],
            )
          ],
        ));
  }

  Container buildPlaces({String title, String place}) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
          Text(place,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildMain(context),
    );
  }
}
