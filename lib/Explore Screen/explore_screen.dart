import 'dart:math';

import 'package:flutter/material.dart';
import 'package:orax/Models/posts.dart';
import 'package:orax/Profile%20Screen/profile_screen.dart';
import 'package:orax/global/global_variables.dart';
import 'package:orax/services/http_service.dart';
import 'package:orax/styles/styles.dart';
import 'package:orax/widgets/custom_appbar.dart';


class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final HttpService httpService = HttpService();
  bool loading = true;
  final List images = [
    "assets/images/image1.jpg",
    "assets/images/image2.jpg",
    "assets/images/image3.jpg",
    "assets/images/image4.jpg",
    "assets/images/image5.jpg",
    "assets/images/image6.jpg",
    "assets/images/image7.jpg",
    "assets/images/image8.jpg",
    "assets/images/image9.jpg",
  ];
  Random random = new Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          title: Text(explore_screen_title,
            style: ktitleStyle,
          ),
          actions: <Widget>[
            IconButton(
                // disabledColor: Colors.black54,
                color: Colors.black87,
                icon: Icon(Icons.search),
                onPressed: null)
          ],
          leading: IconButton(
              color: Colors.black87,
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context)),
          centerTitle: true),
      body: FutureBuilder(
          future: httpService.getPosts(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData) {
              List<Post> posts = snapshot.data;
              return ListView(
                // shrinkWrap: true,
                children: posts
                    .map((Post post) => GestureDetector(
                      onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen())),
                                          child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Expanded(
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "assets/images/image8.jpg"),
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                SizedBox(width: 15),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      explore_post_title, 
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold),
                                                        ),
                                                    Text(
                                                      explore_post_time,
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            Icons.more_horiz,
                                            color: Colors.grey,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  height: 24,
                                                  child: Image.asset('assets/icons/chat.png')),
                                                SizedBox(height: 7,),
                                                Text(
                                                  "40",
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
                                                  height: 24,
                                                  child: Image.asset('assets/icons/heart.png', color: Colors.pink,)),
                                                SizedBox(height: 7,),
                                                Text(
                                                  "40",
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )
                                              ],
                                            ),
                                            SizedBox(width: 40),
                                            Expanded(
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Flexible(
                                                          child: Text(post.body,textAlign: TextAlign.start, 
                                                          style: TextStyle(fontSize: 17),)),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20,),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Container(
                                                        // margin: EdgeInsets.all(10),
                                                        height: 200,
                                                        width:  MediaQuery.of(context).size.width/1.5,
                                                        decoration: BoxDecoration(
                                                          borderRadius: new BorderRadius.circular(10.0),
                                                          image: DecorationImage(image: AssetImage(images[random.nextInt(images.length)]),
                                                          fit: BoxFit.cover,
                                                          )
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                    )
                        // ListTile(
                        //   title: Text(post.title),
                        //   subtitle: Image.network("https://upload.wikimedia.org/wikipedia/commons/1/12/K2_2006b.jpg"),
                        //   onTap: () => Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => ProfileScreen()
                        //     )
                        //     ),
                        // )
                        )
                    .toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
