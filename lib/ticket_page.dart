import 'package:flutter/material.dart';

class TicketPage extends StatelessWidget {
  Color c = const Color.fromARGB(1000, 75, 151, 184);
  Widget buildMain(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                  'Ticket',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 170),
                height: 600,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60)),
                child: Container(
                  margin: EdgeInsets.only(top: 160, left: 30, right: 30),
                  child: ListView(
                    children: [
                      Text(
                        'Payment',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Enter Amount',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(left: 15),
                              width: width,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(15)),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('\$ 5.0',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          buildLastrows(
                              col: c, ptype: 'Credit Card', balance: '84'),
                          bottomDivider(),
                          buildLastrows(
                              col: Colors.grey[400],
                              ptype: 'E-wallet',
                              balance: '18'),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            height: 60,
                            width: width * .8,
                            decoration: BoxDecoration(
                                color: c,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Text('Buy Ticket',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold))),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              buildInfoDetails()
            ],
          ),
          // buildLocations()
        ],
      ),
    );
  }

  Row buildLastrows({Color col, String ptype, String balance}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
              color: col, borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Text(
              ptype,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Text(
          'Balance: \$' + balance,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Positioned buildInfoDetails() {
    return Positioned(
      child: Container(
          margin: EdgeInsets.only(left: 30, right: 30, top: 10),
          height: 300,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10, color: Color(0x33000000), spreadRadius: 1)
              ]),
          child: Column(
            children: [
              buildLocations(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: 100,
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildTime(),
                          buildCommonLabel(
                              icon: Icons.location_on_outlined,
                              text: 'Lorem MRT Station'),
                          buildCommonLabel(
                              icon: Icons.monetization_on_outlined,
                              text: '\$ 5')
                        ],
                      )),
                  Container(
                      height: 100, width: 100, child: Image.asset('qr.png'))
                ],
              )
            ],
          )),
    );
  }

  Row buildTime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildCommonLabel(icon: Icons.timer, text: '10:00'),
        buildCommonLabel(icon: Icons.bus_alert, text: '10:30'),
      ],
    );
  }

  Container buildCommonLabel({IconData icon, String text}) {
    return Container(
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 15),
          Text(text),
          SizedBox(width: 15),
        ],
      ),
    );
  }

  Container buildLocations() {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 0),
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // SizedBox(
            //   width: 15,
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  size: 35,
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
                Icon(
                  Icons.location_on,
                  size: 35,
                  color: c,
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
                  fontWeight: FontWeight.normal,
                  color: Colors.grey)),
          SizedBox(
            height: 10,
          ),
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
