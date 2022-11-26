import 'package:flutter/material.dart';
import 'package:untitled11/pages/post_page.dart';
class HomePage extends StatefulWidget {

  static final String id = 'instagram_ui';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  int correntPage = 0;
  var _pages = [
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var Feather;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Instagram",style: TextStyle(fontSize: 20,color: Colors.black),),
        leading: IconButton(
          icon: Icon(Icons.camera),
          color: Colors.black54,
          onPressed: (){},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.live_tv,size: 30,),
            color: Colors.black54,
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.send,size: 25,),
            color: Colors.black54,
            onPressed: (){},
          ),
        ],
      ),
      body: _pages[correntPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: correntPage,
        onTap: (i){
          correntPage = i;
        },
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
            label: '',

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: ' ',
          ),
      ],
      ),
    );
  }
}
