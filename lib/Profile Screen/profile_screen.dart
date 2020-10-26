
import 'package:flutter/material.dart';
import 'package:orax/Models/profile.dart';
import 'package:orax/services/http_service.dart';
import 'package:orax/widgets/custom_appbar.dart';

class ProfileScreen extends StatelessWidget {
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

  String name, imageurl;
  HttpService httpService = HttpService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
            title: Text(
              "Profile",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              IconButton(
                  // disabledColor: Colors.black54,
                  color: Colors.black87,
                  icon: Icon(Icons.more_horiz),
                  onPressed: null)
            ],
            leading: IconButton(
                color: Colors.black87,
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context)
                ),
            centerTitle: true),
        
        body: FutureBuilder(
          future: httpService.getProfile(),
          builder: (context, snapshot){
            Profile profile = snapshot.data;
            if(snapshot.connectionState.index == 1){
              return Center(child: CircularProgressIndicator());
            }
            if(snapshot.hasError){
              return Center(child: Text("Error Fetching Profile"));
            }
            return ListView(
          children: <Widget>[
            SizedBox(height: 20,),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(image: NetworkImage(profile.avatar),
                        fit: BoxFit.cover,
                        )
                      ),
                  ),

                  SizedBox(height: 20,),                  
                  Text(profile.first_name +' '+ profile.last_name , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.only(right:50.0,left: 50.0),
                      child: Text('This screen has dynamic profile image and name with non dynamic descrition', 
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey)),
                    )
                    ),

                  SizedBox(height: 20,),
                  Divider(height: 30,color: Colors.grey.shade300,),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text('438', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                            SizedBox(height: 10),
                            Text('Posts', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text('298', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                            SizedBox(height: 10),
                            Text('Following', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text('321K', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                            SizedBox(height: 10),
                            Text('Followers', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      
                      ],
                    ),
                  )
                ],
              ),
            ),
            
            Divider(height: 30,color: Colors.grey.shade300,),
            SizedBox(height: 10,),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      new SizedBox(
                        width: 170,
                        height: 55,
                        child: new RaisedButton(
                          child: Text("Follow"),
                          textColor: Colors.white,
                          color: Color(0xff6979F8),
                          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                          onPressed: (){}
                          ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      new SizedBox(
                        width: 170,
                        height: 55,
                        child: new RaisedButton(
                          child: Text("Message"),
                          color: Colors.white,
                          // disabledColor: Colors.white,
                          textColor: Colors.black87,
                          shape: new RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blue, width: 1),
                            borderRadius: new BorderRadius.circular(5.0)),
                          onPressed: () {}
                          ),
                      )
                    ],
                  )
                ],
              ),
            ),

            SizedBox(height: 20,),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text("Photos", 
                  style: TextStyle(
                    color: Colors.black, 
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                    ),
                    ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.format_list_bulleted), 
                        onPressed: null
                      ),
                      Container(
                        height: 19,
                        child: Image.asset("assets/icons/squares.png"))
                    ],
                  )
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Wrap(
                  alignment: WrapAlignment .center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    for(int i = 0 ; i < images.length ; i++)
                      Container(
                        margin: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.width/4,
                        width:  MediaQuery.of(context).size.width/4,
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(15.0),
                          image: DecorationImage(image: AssetImage(images[i]),
                          fit: BoxFit.cover,
                          )
                        ),
                      )
                    
                  ],
                )
              ),
            )
          ]
        );
          }
        ) 
      );
  }
}
