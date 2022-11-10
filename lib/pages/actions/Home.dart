import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rede_social_livre/pages/util/story_circles.dart';
import '../forgot_password_page.dart';
import '../forgot_password_verification_page.dart';
import '../login_page.dart';
import '../registration_page.dart';
import '../widgets/post_card.dart';
import 'storypage.dart';
import 'package:rede_social_livre/models/post.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double  _drawerIconSize = 24;
  double _drawerFontSize = 17;

  List<String> items = [ '',
    'https://i.ibb.co/GfmxFcR/Whats-App-Image-2022-11-04-at-16-22-43.jpg',
    'https://i.ibb.co/TYzYgQW/Whats-App-Image-2022-11-04-at-16-23-07.jpg',
    'https://i.ibb.co/1JjM5Nb/Whats-App-Image-2022-11-04-at-16-23-21.jpg',
  'https://i.ibb.co/BjTQdzh/a.jpg',
  'https://i.ibb.co/bR8nFD8/image-processing20200201-29235-rw345q.jpg',
  'https://i.ibb.co/wKmKGjf/images.jpg'];

  List<Post> Posts_items = [Post(
    username: 'Username',
    uid: 'uid',
    postUrl: 'https://upload.wikimedia.org/wikipedia/commons/7/74/Posts_on_the_saltmarsh%2C_Warton_Sands_-_geograph.org.uk_-_1658558.jpg',
    description: 'description',
    postId: 'postId',
    datePublished: DateTime.now(),
    likes: [
      {"title": 'Android', "date": '10/01/2019'},
      {"title": 'Flutter', "date": '10/01/2019'},
      {"title": 'Java', "date": '30/10/2019'},
    ],
    profImage: 'https://img.cancaonova.com/cnimages/canais/uploads/sites/6/2020/11/formacao_como-posso-me-tornar-uma-pessoa-plena.jpg',
  ), Post(
    username: 'Username',
    uid: 'uid',
    postUrl: 'https://kinsta.com/wp-content/uploads/2020/08/tiger-jpg.jpg',
    description: 'description',
    postId: 'postId',
    datePublished: DateTime.now(),
    likes: [
      {"title": 'Android', "date": '10/01/2019'},
      {"title": 'Flutter', "date": '10/01/2019'},
      {"title": 'Java', "date": '30/10/2019'},
    ],
    profImage: 'https://img.cancaonova.com/cnimages/canais/uploads/sites/6/2020/11/formacao_como-posso-me-tornar-uma-pessoa-plena.jpg',
  )];



  void _openStory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StoryPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

     MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Shadownban", style: TextStyle(color: Theme.of(context).accentColor)),// fontWeight: FontWeight.bold)),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {
              // do something
            },
          ),
          IconButton(
            icon: Icon(
              Icons.add_circle_outline_rounded,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        flexibleSpace:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.white, Colors.white,]
              )
          ),
        ),

      ),
      drawer: Drawer(
        child: Container(
          decoration:BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [
                    HexColor("#e8e8e"),//Theme.of(context).primaryColor.withOpacity(0.2),
                    HexColor("#e8e8e"),//Theme.of(context).accentColor.withOpacity(0.5),
                  ]
              )
          ) ,
          child: ListView(
            children: [
              /* DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [ Theme.of(context).primaryColor,Theme.of(context).accentColor,],
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text("Rede Social Livre",
                    style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),*/
              ListTile(
                leading: Icon(Icons.home, size: _drawerIconSize, color: Colors.orange,),
                title: Text('Inicio', style: TextStyle(fontSize: 17, color: Colors.orange),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle_outlined,size: _drawerIconSize,color: Theme.of(context).accentColor,),
                title: Text('Perfil', style: TextStyle(fontSize: _drawerFontSize, color: Theme.of(context).accentColor),),

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);
                },
              ),
              //Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.search, size: _drawerIconSize,color: Theme.of(context).accentColor),
                title: Text('Buscar',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()),);
                },
              ),
              //Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.bar_chart, size: _drawerIconSize,color: Theme.of(context).accentColor,),
                title: Text('Estatisticas',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
                onTap: () {
                  Navigator.push( context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()),);
                },
              ),
              //Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.file_open_outlined, size: _drawerIconSize,color: Theme.of(context).accentColor,),
                title: Text('Arquivos',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
                onTap: () {
                  Navigator.push( context, MaterialPageRoute(builder: (context) => ForgotPasswordVerificationPage()), );
                },
              ),
              //Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.shopping_cart, size: _drawerIconSize,color: Theme.of(context).accentColor,),
                title: Text('Loja',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
              //Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.edit_road_outlined, size: _drawerIconSize,color: Theme.of(context).accentColor,),
                title: Text('Ajustes',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
              //Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.logout_rounded, size: _drawerIconSize,color: Theme.of(context).accentColor,),
                title: Text('Sair',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: Posts_items.length+1,
        itemBuilder: (context, index) {
          if (index == 0)
            return _horizontalListView();
          else
            return PostCard(
                snap: Posts_items[index-1]);

        },
      ),
    );

  }

  Widget _horizontalListView() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: items.length,
        scrollDirection: Axis.horizontal,

        itemBuilder: (context, index) {
          return StoryCircle(
              function: _openStory,
              list: items[index]
          );
        },
      ),
    );
  }
}