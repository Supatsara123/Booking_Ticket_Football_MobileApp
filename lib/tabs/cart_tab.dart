import 'package:flutter/material.dart';
import '../constants.dart';

class CartTab extends StatelessWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),

          // appbar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //CART
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "CART",
                    style: Constants.boldHeading,
                  ),

                  SizedBox(width: 10),

                  Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                ],
              ),

              // amount
              Container(
                width: 35.0,
                height: 35.0,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center,
                child: Text(
                  "1",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 40),


          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),

            padding: EdgeInsets.all(8),
            width: 550,
            height: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Row(
                    children: <Widget>[

                      Container(
                        height: 90,
                        width: 70,
                        child: Image.asset("assets/images/pic1.jpg"),
                      ),

                      SizedBox(width: 10),

                      Column(
                        children: <Widget>[

                          // title name
                          Text(
                                "THE MATCH BANGKOK CENTURY CUP 2022",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 10),

                          // total+amount
                          Row(
                            children: <Widget>[

                              Text(
                                "25,000 thb",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 150),
                              Text(
                                "x 1",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                            ],
                          ),

                        ],
                      ),


                  ],
                ),
              ],
            ),
          ),



        ],
      ),
    );
  }
}

