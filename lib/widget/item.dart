import 'dart:ui';

class Item {
  List<String> imgPath;
  String title;
  String showdate;
  String kickoff;
  String location;
  String datesell;
  String status;
  List<String> zone;

  Item(this.imgPath,
      this.title,
      this.showdate,
      this.kickoff,
      this.location,
      this.datesell,
      this.status,
      this.zone,
      );
}

List<Item> getItemList() {
  return <Item>[
    Item(
      [
        'assets/images/pic1.jpg',
        'assets/images/plan1.jpg'
      ],
      'THE MATCH BANGKOK CENTURY CUP 2022',
      '12 July 2022',
      '08.00 PM',
      'Rajamangala Stadium,Bangkok,Thailand',
      'Saturday 2 April 2022 08:00 AM',
      'on sale now',
      [
      'Platinum',
      'Gold',
      'Silver',
      'CAT1',
      'CAT2',
      'CAT3',
      'CAT4',
      'CAT5',
      ]
    ),

    Item(
      [
        'assets/images/pic2.jpg',
        'assets/images/plan2.jpg'
      ],
      'ASIAN QUALIFIERS ROAD TO RUSSIA THAILAND vs.AUSTRALIA',
      'Tuesday 15 November 2016',
      '07.00 PM',
      'Rajamangala Stadium,Huamark',
      'Saturday 22 October 2016, 10:00 AM',
      'on sale now',
      [
        'W1',
        'W2',
        'W3',
        'E1',
        'E2',
        'E3',
        'S',
        'N',
      ]
    ),

    Item(
      [
        'assets/images/pic3.jpg',
        'assets/images/plan3.jpg'
      ],
      'ASIAN QUALIFIERS ROAD TO RUSSIA (Japan)',
      'Tuesday 28 March 2017',
      '07.00 PM',
      'Saitama Stadium',
      'Saturday 24 December 2016, 10:00 AM',
      'on sale now',
        [
          'W1',
          'W2',
          'W3',
          'E1',
          'E2',
          'E3',
          'S',
          'N',
        ]
    ),

    Item(
      [
        'assets/images/pic4.jpg',
        'assets/images/plan4.jpg'
      ],
      'ASIAN QUALIFIERS ROAD TO RUSSIA (Thailand vs Iraq)',
      'Thursday 31 August 2017',
      '07.00 PM',
      'Rajamangala Stadium,Huamark',
      'Tuesday 8 August 2017, 10:00 AM',
      'on sale now',
        [
          'W1',
          'W2',
          'W3',
          'E1',
          'E2',
          'E3',
          'S',
          'N',
        ]
    ),

    Item(
      [
        'assets/images/pic5.jpg',
        'assets/images/plan5.jpg'
      ],
      'International Friendly Match',
      'Saturday 2 June 2018',
      '06.30 PM',
      'Rajamangala Stadium,Huamark',
      'Monday 7 May 2018, 10:00 AM',
      'on sale now',
        [
          'W1',
          'W2',
          'W3',
          'E1',
          'E2',
          'E3',
          'S',
          'N',
        ]
    ),

    Item(
      [
        'assets/images/pic6.jpg',
        'assets/images/plan6.jpg'
      ],
      'The Singha Chelsea FC Celebration Match',
      '30 May 2015',
      '08.00 PM',
      'Rajamangala Stadium,Bangkok,Thailand',
      '8 May 2015 10:00 AM',
      'sold out',
        [
          'VIP',
          'W1',
          'W2',
          'W3',
          'E1',
          'E2',
          'E3',
          'S',
        ]
    ),
  ];
}