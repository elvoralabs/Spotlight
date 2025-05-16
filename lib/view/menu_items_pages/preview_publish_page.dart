import 'package:flutter/material.dart';

class PreviewPublishPage extends StatelessWidget {
  const PreviewPublishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'Preview & Publish',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5F5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'Event Management',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/girlroll.png'),
                    fit: BoxFit.cover,
                    alignment: Alignment(0, -0.47),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mazi Got Talent Show',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Inter',
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        '10 Million Naira Cash Prize',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Event Title: ',
                      style: TextStyle(
                          color: Colors.grey.shade600, fontSize: 13.0),
                    ),
                    Text(
                      'Mazi Got Talent',
                      style: TextStyle(fontSize: 13.0),
                    )
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 0.2,
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Prize: ',
                      style: TextStyle(
                          color: Colors.grey.shade600, fontSize: 13.0),
                    ),
                    Text(
                      '\$10 000',
                      style: TextStyle(fontSize: 13.0),
                    )
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 0.2,
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description ',
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 13),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Where words fail | Music speaks | Music Lover I Create Music that Loves the world and into and high level of spirituality and possibilities.',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 0.2,
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Date & Time: ',
                      style: TextStyle(
                          color: Colors.grey.shade600, fontSize: 13.0),
                    ),
                    Text(
                      '11th - 27th June 2025',
                      style: TextStyle(fontSize: 13.0),
                    )
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 0.2,
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Amount: ',
                      style: TextStyle(
                          color: Colors.grey.shade600, fontSize: 13.0),
                    ),
                    Text(
                      '\$20',
                      style: TextStyle(fontSize: 13.0),
                    )
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 0.2,
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Location: ',
                      style: TextStyle(
                          color: Colors.grey.shade600, fontSize: 13.0),
                    ),
                    Text(
                      'Lagos',
                      style: TextStyle(fontSize: 13.0),
                    )
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 0.2,
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Vote Type: ',
                      style: TextStyle(
                          color: Colors.grey.shade600, fontSize: 13.0),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(18.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Paid Votes',
                          style: TextStyle(fontSize: 13.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 0.2,
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Rules',
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13.0),
                      ),
                    ),
                    Text(
                      '• Participant must be 18 years above',
                      style: TextStyle(fontSize: 13.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        '• Participant must know all music part and note to qualify for each cartigories',
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ),
                    Text(
                      '• You should be able to score song quickly anf fase etc',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ],
                )
              ],
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.2,
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                        color: Colors.black,
                        width: 0.2,
                      )),
                ),
                child: Text('Back'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                child: Text('Publish Event'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
