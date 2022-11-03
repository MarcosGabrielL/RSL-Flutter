
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rede_social_livre/common/theme_helper.dart';

import '../forgot_password_page.dart';
import '../widgets/header_widget.dart';

class Home extends StatefulWidget{
  const Home({Key? key}): super(key:key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  double _headerHeight = 150;
  Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Inicio",
          style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        flexibleSpace:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[HexColor("#ffffff"), HexColor("#ffffff"),]
              )
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only( top: 16, right: 16,),
            child: Stack(
              children: <Widget>[
                Icon(Icons.notifications, color: Theme.of(context).primaryColor,),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration( color: Colors.red, borderRadius: BorderRadius.circular(6),),
                    constraints: BoxConstraints( minWidth: 12, minHeight: 12, ),
                    child: Text( '5', style: TextStyle(color: Colors.white, fontSize: 8,), textAlign: TextAlign.center,),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(

        child: Column(
          children: [
            Container(
             // height: _headerHeight,
              //child: HeaderWidget(_headerHeight, true, Icons.login_rounded),
             // child: HeaderWidget(_headerHeight, true, Icons.login_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(0, 80, 0, 40),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                  child: Column(
                    children: [
                    /*  Text(
                        'Inicio',
                        style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                      ),*/
                   /*   Text(
                        'Pagina Inicial',
                        style: TextStyle(color: Colors.grey),
                      ),*/
                      SizedBox(height: 30.0),
                   /*   Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                                    ),
                                    border: OutlineInputBorder(),
                                    hintText: 'Digite Usuario ou Email',
                                    labelText:'Usuario',
                                    filled: true,
                                    fillColor: HexColor('#EEEEEE'),//Colors.grey, //eee
                                  ),
                                  style: new TextStyle(color: Colors.orange),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                //color: Colors.white10,
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                child: TextField(
                                  obscureText: true,

                                  decoration: InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                                    ),
                                    border: OutlineInputBorder(),
                                    hintText: 'Digite sua Senha',
                                    labelText:'Senha',
                                    filled: true,
                                    fillColor: HexColor('#EEEEEE'),//Colors.grey, //eee
                                  ),
                                  style: new TextStyle(color: Colors.orange),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                margin: EdgeInsets.fromLTRB(10,0,10,20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
                                  },
                                  child: Text( "Esqueceu a senha?", style: TextStyle( color: Colors.grey, ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text('Entrar'.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                  ),
                                  onPressed: (){
                                    //After successful login we will redirect to profile page. Let's create profile page now
                                  //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10,20,10,20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(
                                    TextSpan(
                                        children: [
                                          TextSpan(text: "Não tem uma conta? "),
                                          TextSpan(
                                            text: 'Criar',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = (){
                                            //    Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                              },
                                            style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                                          ),
                                        ]
                                    )
                                ),
                              ),
                            ],
                          )
                      ),*/
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );

  }
}