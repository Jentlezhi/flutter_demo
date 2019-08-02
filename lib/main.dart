import 'package:flutter/material.dart';
import 'package:jentle_flutter/demo/basic_demo.dart';
import 'demo/dialog_demo.dart';
import 'demo/form_demo.dart';
import 'demo/grid_view_build.dart';
import 'demo/grid_view_demo.dart';
import 'demo/grid_view_extent.dart';
import 'demo/layout_demo.dart';
import 'demo/list_view_demo.dart';
import 'demo/navigator_demo.dart';
import 'demo/sliver_demo.dart';
import 'demo/view_demo.dart';

void main() => runApp(MyApp());
// void main(){
//   runApp(
//     App()
//   );
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: MaterialApp(
      /// 脚手架
          // home: NavigatorDemo(),
          initialRoute: '/',
          routes: {
            '/':(BuildContext context) => DialogDemo(),
            '/about':(BuildContext context) => Page(title: 'About',),
          },
      //  home: Scaffold(
      //    appBar: AppBar(
      //     //  leading: IconButton(
      //     //    icon: Icon(Icons.menu),
      //     //    onPressed: (){
      //     //      print('press');
      //     //    },
      //     //  ),
      //      actions: <Widget>[
      //        IconButton(
      //          icon: Icon(Icons.message),
      //          onPressed: (){
      //            print('message btn pressed');
      //          },
      //        ),
      //        IconButton(
      //          icon: Icon(Icons.music_note),
      //          onPressed: (){
      //            print('music_note btn pressed');
      //          },
      //        )
      //      ],
      //      title: Text('我是标题'),
      //      ///阴影大小：默认4
      //      elevation: 0.0,
      //      bottom: TabBar(
      //        unselectedLabelColor: Colors.black38,
      //        tabs: <Widget>[
      //          Tab(icon: Icon(Icons.search)),
      //          Tab(icon: Icon(Icons.face)),
      //          Tab(icon: Icon(Icons.favorite)),
      //          Tab(icon: Icon(Icons.view_quilt),),
      //          Tab(icon: Icon(Icons.view_week),),
      //          Tab(icon: Icon(Icons.voice_chat),),
      //          Tab(icon: Icon(Icons.school),),
      //        ],
      //      ),
      //    ),
      //    body: TabBarView(
      //      children: <Widget>[
      //        ListViewDemo(),
      //        BasicDemo(),
      //        LayoutDemo(),
      //        ViewDemo(),
      //        GridViewDemo(),
      //        GridViewExtentDemo(),
      //        GridViewBuildDemo(),
      //      ],
      //    ),
      //    drawer: Drawer(
      //      child: ListView(
      //        children: <Widget>[
      //          DrawerHeader(
      //            decoration: BoxDecoration(
      //              color: Colors.grey[100]
      //            ),
      //            child: Text('header'.toUpperCase()),
      //          ),
      //          ListTile(
      //            title: Text('Message',textAlign: TextAlign.right,),
      //            trailing: Icon(Icons.message,color: Colors.black12,size: 22.0,),
      //            onTap: () => Navigator.pop(context),
      //          ),
      //          ListTile(
      //            title: Text('Favorite' ,textAlign: TextAlign.right,),
      //            trailing: Icon(Icons.favorite,color: Colors.black12,size: 22.0,),
      //          ),
      //          ListTile(
      //            title: Text('Settings',textAlign: TextAlign.right,),
      //            trailing: Icon(Icons.settings,color: Colors.black12,size: 22.0,),
      //          ),
      //        ],
      //      ),
      //    ),
      //   //  bottomNavigationBar: BottomNavigationBar(
      //   //    items: [
      //   //      BottomNavigationBarItem(title: Text('A'), icon: Icon(Icons.add)),
      //   //      BottomNavigationBarItem(title: Text('A'), icon: Icon(Icons.add)),
      //   //    ],
      //   //  ),
      //  ),
       theme: ThemeData(
         primaryColor: Colors.red
       ),
    ),
    );
  }
}