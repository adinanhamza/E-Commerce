import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  
                    Row(
                      children: [
                          Container(child: Center(child: Icon(Icons.notifications_none, color: Colors.black)),
                       decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(15),),  height:50,width: 50, ),
                          SizedBox(width: 15,),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'your location',
                              style: TextStyle(color: Colors.black45),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Canannore,Kerala',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_down_sharp),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 30,),
                    ClipRect(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
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
