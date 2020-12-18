import 'package:flutter/material.dart';
import 'day1_customGridview/day1.dart';
import 'day2_movieApp/day2.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Container day(String title, Widget ling) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.only(left: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: () => {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ling;
          }))
        },
        title: Text(
          title,
          style: TextStyle(
              color: Colors.white70, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          Icons.play_arrow,
          size: 40,
          color: Colors.white70,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black87,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   // title: Center(
        //   //   child: Text(
        //   //     'Home',
        //   //     style: TextStyle(color: Colors.white, fontSize: 25),
        //   //   ),
        //   // ),
        // ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 70, bottom: 20),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('lib/images/projectbg.jpg'),
                          fit: BoxFit.cover)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.black87.withOpacity(0.8),
                            Colors.black87.withOpacity(0.2)
                          ]),
                    ),
                    child: Center(
                      child: Text(
                        'Project 365',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                day('Day 1 - Custom Grid View', Day1()),
                day('Day 2 - Movie App', Day2()),
                day('Day 3 - StaggedView', Day1()),
                day('Day 4 - StaggedView', Day1()),
                day('Day 5 - StaggedView', Day1()),
                day('Day 6 - StaggedView', Day1()),
                day('Day 7 - StaggedView', Day1()),
                day('Day 8 - StaggedView', Day1()),
                day('Day 9 - StaggedView', Day1()),
                day('Day 10 - StaggedView', Day1()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
