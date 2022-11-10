import 'package:flutter/material.dart';

class StoryCircle extends StatelessWidget {
  final function;
  final list;
  StoryCircle({Key? key, this.function, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          height: 150,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(list),
                fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.colorBurn),

             ),

              borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).accentColor,]
              ),

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
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(list==null || list==''? 'https://i.ibb.co/SQRS7HL/291106760-202702388746554-8938705030507097569-n.jpg' : list),//widget.snap['profImage']),
                    ),

                  ) //ImageIcon(AssetImage('graphics/ki.png'), size: 128, color: Theme.of(context).primaryColor,), //put your logo here
              ),
            )
        ),
      ),

    );
  }
}
