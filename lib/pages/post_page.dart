import 'dart:core';
import 'package:flutter/material.dart';
import 'package:untitled11/model/post_model.dart';
import '../model/model.dart';

class FeedPage extends StatefulWidget {

  static final String id = 'post_page';
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  final List<Story> _stories = [
    Story("assets/images/f11.jpg", "Sara"),
    Story("assets/images/f12.jpeg", "Nora"),
    Story("assets/images/f13.jpg", "Salah"),
    Story("assets/images/f24.jpg", "Petr"),
    Story("assets/images/f15.jpg", "Saymen"),
    Story("assets/images/f16.jpg", "Jek"),
    Story("assets/images/f17.jpg", "Diyana"),
    Story("assets/images/f18.jpg", "Tem"),
    Story("assets/images/f19.jpg", "Jorj"),

  ];

  List<Post> _post = [

    Post(
      username: "Sara",
      userImage: "assets/images/f19.jpg",
      postImage: "assets/images/f29.jpg",
      caption: "hello my name is Sara",
    ),
    Post(
      username: "Nora",
      userImage: "assets/images/f22.jpg",
      postImage: "assets/images/f15.jpg",
      caption: "hello my name is Sara",
    ),
    Post(
      username: "Petr",
      userImage: "assets/images/f14.jpg",
      postImage: "assets/images/f22.jpg",
      caption: "hello my name is Sara",
    ),
    Post(
      username: "Symen",
      userImage: "assets/images/f15.jpg",
      postImage: "assets/images/f27.jpg",
      caption: "hello my name is Sara",
    ),
    Post(
      username: "Jek",
      userImage: "assets/images/f18.jpg",
      postImage: "assets/images/f27.jpg",
      caption: "hello my name is Sara",
    ),
    Post(
      username: "Tem",
      userImage: "assets/images/f15.jpg",
      postImage: "assets/images/f22.jpg",
      caption: "hello my name is Sara",
    ),
    Post(
      username: "Jorj",
      userImage: "assets/images/f21.jpg",
      postImage: "assets/images/f24.jpg",
      caption: "hello my name is Sara",
    ),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(),
              // # Stories and Watch All
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Stories",style: TextStyle(color: Colors.black45, fontSize: 14)),
                    Text("Watch All",style: TextStyle(color: Colors.black45,fontSize: 14))
                  ],
                ),
              ),
              // #StoryList
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: _stories.map((story) {
                    return _itemOfStory(story);
                  }).toList(),
                ),
              ),
              // #post
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _post.length,
                  itemBuilder:  (ctx, i) {
                    return _itemOfPost(_post[i]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

 Widget _itemOfStory(Story story) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70),
          border: Border.all(
            width: 3,
            color: Color(0xFF8e44ad),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(70),
            child: Image(
              image: AssetImage(story.image),
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      SizedBox(height: 10),
      Text(story.name,style: TextStyle(color:Colors.black45),),
    ],
  );
}

Widget _itemOfPost(Post post) {

  BuildContext context;
  return Container(
    //color: Colors.blue,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image(
                      image: AssetImage(post.userImage),
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(post.username),
                ],
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: (){},
              ),
            ],
          ),
        ),
        FadeInImage(
          //width: MediaQuery.of(context).size.width,
          image: AssetImage(post.postImage),
          placeholder: AssetImage("assets/images/ff1.jpg"),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border),
                ),
                IconButton(
                  icon: Icon(Icons.mode_comment_outlined),
                  onPressed: (){},
                ),
                IconButton(
                  icon: Icon(Icons.send_outlined),
                  onPressed: () {},
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.bookmark_outline_outlined),
              onPressed: () {},
            ),
          ],
        ),

       // #tags
       Container(
         //width: MediaQuery.of(context).size.width,
         margin: EdgeInsets.symmetric(horizontal: 14),
         child: RichText(
           softWrap: true,
           overflow: TextOverflow.visible,
           text: const TextSpan(
             children: [
               TextSpan(
                 text: "Liked By ",
                 style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
               ),
               TextSpan(
                 text: "Yasina, ",
                 style: TextStyle(color: Colors.black)
               ),
               TextSpan(
                 text: "Dina, ",
                 style: TextStyle(color: Colors.black26,),
               ),
               TextSpan(
                 text: "Jorj, ",
                 style: TextStyle(color: Colors.black54,),
               ),
               TextSpan(
                 text: "Marc, ",
                 style: TextStyle(color: Colors.black,),
               ),
               TextSpan(
                 text: "Nora ",
                 style: TextStyle(color: Colors.black26,),
               ),
               TextSpan(
                 text: "and ",
                 style: TextStyle(color: Colors.black26,),
               ),
               TextSpan(
                 text: "2846 others",
                 style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
               ),
               
             ],
           ),
         ),
       ),
      ],
    ),
  );
}







