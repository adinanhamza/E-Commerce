import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   leading: Icon(Icons.notifications_none,color: Colors.black54,),
      //   title: Column(
      //     children: [
      //       Text('your location',style: TextStyle(color: Colors.black45),),
      //       Text('Canannore,Kerala',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)
      //     ],
      //   ),
      //   actions: [
      //     ClipRect(
      //       child: Image.network('https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
      //     )
      //   ],

      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(

              padding: const EdgeInsets.all(8.0),
              child: Row(
            
                children: [
                  Icon(Icons.notifications_none,color: Colors.black,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('your location',style: TextStyle(color: Colors.black45),),
            Row(
              children: [
                Text('Canannore,Kerala',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                Icon(Icons.keyboard_arrow_down_sharp)
              ],
            )
          ],
        ),
        ClipRect(
            child: Container(decoration:BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              
            ),child:  Image.network('https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',fit: BoxFit.cover,width: 50,height: 50,),),
          )
      
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}