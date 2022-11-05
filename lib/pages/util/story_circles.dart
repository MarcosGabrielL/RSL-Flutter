import 'package:flutter/material.dart';

class StoryCircle extends StatelessWidget {
  final function;

  StoryCircle({this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).accentColor,]
              )

          ),
            child: Center(
              child: ClipOval(
                  child:Image.asset(
                      'graphics/ki.png',
                      width: 80,
                      height: 80,
                      fit:BoxFit.fill

                  ) //ImageIcon(AssetImage('graphics/ki.png'), size: 128, color: Theme.of(context).primaryColor,), //put your logo here
              ),
            )
        ),
      ),
    );
  }
}
