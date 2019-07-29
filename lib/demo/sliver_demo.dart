import 'package:flutter/material.dart';
import 'package:jentle_flutter/model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // SliverPadding(
          //   padding: EdgeInsets.only(top: 40.0,left: 10,right: 10.0),
          //   sliver: SliverGridDemo(),
          // ),
          SliverAppBar(
              // title: Text('Jentle'),
              expandedHeight: 178.0,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Jentle flutter'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 15.0,
                      letterSpacing: 3.0,
                      fontWeight: FontWeight.w400),
                ),
                background: Image.network("https://resources.ninghao.net/images/overkill.png",fit: BoxFit.cover,),
              )),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.only(left: 10, right: 10.0, bottom: 10.0),
              sliver: SliverListDemo(),
            ),
          )
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 32.0),
          child: Material(
            borderRadius: BorderRadius.circular(90.0),
            elevation: 14.0,
            shadowColor: Colors.grey.withOpacity(0.5),
            child: Stack(
              children: <Widget>[
                Container(
                  child: Image.network(
                    posts[index].imageUrl,
                    // fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 10.0,
                  top: 10.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        posts[index].title,
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      Text(
                        posts[index].author,
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      childCount: posts.length,
    ));
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
              child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ));
        },
        childCount: posts.length,
      ),
    );
  }
}
