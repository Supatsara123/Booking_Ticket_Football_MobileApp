import 'package:flutter/material.dart';
import '../constants.dart';
import '../widget/bookevent.dart';
import '../widget/event_widget.dart';
import '../widget/item.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF345487),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                "Events (" + getItemList().length.toString() + ")",
                  style: Constants.boldHeading
                ),

              SizedBox(
                height: 16,
              ),

              Expanded(
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  childAspectRatio: 1 / 1.55,
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 10,
                  children: getItemList().map((item) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookEvent(item: item)),
                          );
                        },
                        child: buildEvent(item,1)
                    );
                  }).toList(),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}