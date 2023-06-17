import 'package:flutter/material.dart';
import '../constants.dart';
import '../widget/item.dart';

class BookEvent extends StatefulWidget {

  final Item item;

  BookEvent({required this.item});

  @override
  _BookEventState createState() => _BookEventState();
}

class _BookEventState extends State<BookEvent> {

  int activeSize = 0;
  int _currentImage = 0;

  List<Widget> buildPageIndicator(){
    List<Widget> list = [];
    for (var i = 0; i < widget.item.imgPath.length; i++) {
      list.add(buildIndicator(i == _currentImage));
    }
    return list;
  }

  Widget buildIndicator(bool isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey[400],
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF345487),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),

                      // image
                      Expanded(
                        child: Container(
                          child: PageView(
                            physics: BouncingScrollPhysics(),
                            onPageChanged: (int page) {
                              setState(() {
                                _currentImage = page;
                              });
                            },
                            children: widget.item.imgPath.map((path) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 10,),
                                child: Image.asset(
                                  path,
                                  fit: BoxFit.scaleDown,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),

                      // slide image
                      widget.item.imgPath.length > 1
                          ? Container(
                        margin: EdgeInsets.symmetric(vertical: 16),
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: buildPageIndicator(),
                        ),
                      )
                          : Container(),

                      // title
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                            widget.item.title,
                            style: Constants.regularHeading
                        ),
                      ),

                      SizedBox(height: 20),

                      // Show Date
                      Row(
                        children: [
                          const SizedBox(width: 16,),
                          const Icon(
                            Icons.date_range,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 8,),
                          Text(
                            widget.item.showdate,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 8,),

                      // Kick off
                      Row(
                        children: [
                          const SizedBox(width: 16,),
                          const Icon(
                            Icons.access_time,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 8,),
                          Text(
                            widget.item.kickoff,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 8,),

                      // location
                      Row(
                        children: [
                          const SizedBox(width: 16,),
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 8,),
                          Text(
                            widget.item.location,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 8,),

                      // Date sale
                      Row(
                        children: [
                          const SizedBox(width: 16,),
                          const Icon(
                            Icons.local_movies,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 8,),
                          Text(
                            "Public Sale :  " + widget.item.datesell,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 13,),

                      // ticket status
                      Row(
                        children: [
                          SizedBox(width: 18,),
                          Container(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  widget.item.status,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                    ],
                  ),
                ),
              ),


              // slide Tab > Select Ticket
              Container(
                height: 50,
                width: 180,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.white,
                                constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.5 ),
                                builder: (_){
                                  return Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            // Select Zone
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Select Zone',
                                                    style: Constants.boldHeading2
                                                ),
                                                SizedBox(width: 10),
                                                Text.rich(
                                                    TextSpan(
                                                        children: [
                                                          TextSpan(text: r">>",
                                                            style: TextStyle(
                                                              color: Color(0xFFB6B0FF),
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ],
                                                    ),
                                                ),
                                              ],
                                            ),

                                            SizedBox(height: 15),

                                            // Button Zone
                                            SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Row(
                                                  children: List.generate(8, (index){
                                                    return GestureDetector(
                                                      onTap: (){
                                                        setState(() {
                                                          activeSize = index;

                                                        });
                                                      },
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(right: 15,bottom: 5,left: 5,top: 5),
                                                        child: Container(
                                                          width: 100,
                                                          height: 40,
                                                          decoration: BoxDecoration(
                                                              color: activeSize == index ? Color(0xFF345487) : Color(0xFFB6B0FF),
                                                              borderRadius: BorderRadius.circular(10),
                                                              boxShadow: [BoxShadow(
                                                                  spreadRadius: 0.5,
                                                                  blurRadius: 1,
                                                                  color: Colors.black.withOpacity(0.1)
                                                              )]
                                                          ),
                                                          child: Center(
                                                            child: Text(widget.item.zone[index],style: TextStyle(
                                                                fontSize: 16,
                                                                color: activeSize == index ? Color(0xFFB6B0FF): Color(0xFF345487),
                                                            ),),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                ),
                                              ),

                                            SizedBox(height: 40,),

                                            // How many tickets?
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Icon(Icons.confirmation_num, color: Colors.black, size: 36),
                                                SizedBox(width: 10),
                                                Text.rich(
                                                    TextSpan(
                                                        children: [
                                                          TextSpan(text: 'How many tickets? ',
                                                              style: Constants.boldHeading2
                                                          ),
                                                        ]
                                                    )
                                                )
                                              ],
                                            ),

                                            SizedBox(height: 15,),

                                            // total ticket
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[

                                                Container(
                                                    child: Row(
                                                      children: <Widget>[

                                                        // icon delect (-)
                                                        Container(
                                                            width: 48,
                                                            height: 48,
                                                            decoration: BoxDecoration(
                                                              color: Colors.grey[200],
                                                              borderRadius: BorderRadius.only(
                                                                topLeft: Radius.circular(15),
                                                                bottomLeft: Radius.circular(15),
                                                              ),
                                                            ),
                                                            child: Icon( Icons.remove,
                                                              color: Colors.black,
                                                            )
                                                        ),

                                                        // amount ticket
                                                        Container(
                                                          color: Colors.grey[200],
                                                          width: 48,
                                                          height: 48,
                                                          child: Center(
                                                            child: Text(
                                                              "1",
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        // icon add (+)
                                                        Container(
                                                            width: 48,
                                                            height: 48,
                                                            decoration: BoxDecoration(
                                                              color: Colors.grey[200],
                                                              borderRadius: BorderRadius.only(
                                                                topRight: Radius.circular(15),
                                                                bottomRight: Radius.circular(15),
                                                              ),
                                                            ),
                                                            child: Icon(Icons.add,
                                                              color: Colors.black,
                                                            )
                                                        ),

                                                      ],
                                                    ),
                                                ),

                                                // total
                                                Text(
                                                  r" 25,000 THB",
                                                  style: TextStyle(
                                                    fontSize: 28,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                )

                                              ],
                                            ),

                                            SizedBox(height: 30.0,),

                                            // Button 'Add to cart'
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[

                                                // icon fav
                                                Container(
                                                    height: 72,
                                                    width: 72,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(20),
                                                      ),
                                                      border: Border.all(
                                                        color: Color(0xFF345487),
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child: Icon(
                                                      Icons.favorite,
                                                      color: Color(0xFF345487),
                                                      size: 36,
                                                    ),
                                                ),

                                                // button 'Add to cart'
                                                Container(
                                                    height: 72,
                                                    width: 240,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF345487),
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(20),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                          "Add to cart",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 20,
                                                          )
                                                      ),
                                                    ),
                                                  ),

                                              ],
                                            ),


                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                },
                            );
                          },

                          // Button 'SELECT TICKET'
                          child: BottomAppBar(
                            child: Text(
                              " SELECT TICKET ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            color: Colors.orange,
                          ),
                        ),
                        SizedBox(height: 20),
                    ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}