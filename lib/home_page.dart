import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
          TopRow(),
          buildSubtitle(),
          BuildSearchbox(),
          Stack(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 60),
                  height: 550,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60)),
                  child: Container(
                    margin: EdgeInsets.only(top: 60, left: 25, right: 25),
                    child: ListView(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      children: [
                        buildTitleForCard(),
                        buildTransportCard(
                            context, 'Bus', 'Assets_1.png', Colors.lightBlue),
                        buildTransportCard(context, 'MRT', 'Assets_2.png', c),
                        buildTransportCard(context, 'MRT', 'Assets_2.png', c),
                        buildTransportCard(context, 'MRT', 'Assets_2.png', c),
                      ],
                    ),
                  )),
              Positioned(
                child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    height: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: Color(0x33000000),
                              spreadRadius: 1)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        buildInfo(title: 'Balance', value: '\$ 18'),
                        buildInfo(title: 'Rewards', value: '\$ 10'),
                        buildInfo(title: 'Total Trips', value: ' 189'),
                      ],
                    )),
              )
            ],
          )
        ],
      ),
    );
  }

  Column buildInfo({String title, String value}) {
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
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Container buildTransportCard(
      BuildContext context, String title, String image, Color color) {
    return Container(
        height: 200,
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(30)),
        child: Row(
          //mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/second');
                    },
                    child: Container(
                      width: 70,
                      height: 25,
                      child: Center(
                          child: Text(
                        'select',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                image,
              ),
            )
          ],
        ));
  }

  Text buildTitleForCard() {
    return Text(
      'Choose your Transport',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget buildSubtitle() {
    return Container(
        margin: EdgeInsets.only(top: 20, left: 30),
        child: Text(
          'Where you will go',
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildMain(context),
      bottomNavigationBar: SizedBox(
        height: 85,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: c,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 40,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 40), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.alarm, size: 40), label: '')
          ],
        ),
      ),
    );
  }
}

class BuildSearchbox extends StatelessWidget {
  const BuildSearchbox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10, left: 30, right: 30),
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(Icons.search, size: 50, color: Colors.grey),
            Text(
              'Search',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            )
          ],
        ));
  }
}

class TopRow extends StatelessWidget {
  const TopRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 30),
          child: Text(
            'Hello,\nOscar',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Container(
            height: 50,
            width: 50,
            margin: EdgeInsets.only(right: 30),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(Icons.person))
      ],
    );
  }
}
