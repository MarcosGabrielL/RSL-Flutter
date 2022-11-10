import 'package:flutter/material.dart';

class StoryCircle extends StatelessWidget {
  final function;

  StoryCircle({this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).accentColor,]
              )

          ),
            child: Center(

                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Theme.of(context).accentColor),
                      borderRadius: BorderRadius.circular(30), //<-- SEE HERE

                    ),
                      child: ClipOval(
                    child: Image.asset( 'graphics/ki.png',
                      width: 30,
                      height: 30,
                      fit:BoxFit.fill
                  ),

                  ) //ImageIcon(AssetImage('graphics/ki.png'), size: 128, color: Theme.of(context).primaryColor,), //put your logo here
              ),
            )
        ),
      ),
    );
  }
}
