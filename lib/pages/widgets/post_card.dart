import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rede_social_livre/models/user.dart';
import 'package:rede_social_livre/providers/user_provider.dart';
import 'package:rede_social_livre/resources/firestore_methods.dart';
import 'package:rede_social_livre/screens/comments_screen.dart';
import 'package:rede_social_livre/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/post.dart';
import 'like_animation.dart';

class PostCard extends StatefulWidget {
  final Post snap;

 PostCard({Key? key, required this.snap}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLikeAnimating = false;
  bool isLoading = true;
  int commentLength = 0;

  @override
  void initState() {
    super.initState();
    getComments();
  }

  getComments() async {
    setState(() {
      isLoading = true;
    });
   //QuerySnapshot snap = this.snap;
    commentLength = 8;//snap.docs.length;

    setState(() {});
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
  //  final User user = Provider.of<UserProvider>(context).getUser;
    List a = [
      {"title": 'Android', "date": '10/01/2019'},
      {"title": 'Flutter', "date": '10/01/2019'},
      {"title": 'Java', "date": '30/10/2019'},
    ];
    return Container(
      color: mobileBackgroundColor,
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        children: [
          // Header Section


          Container(
            padding: EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16,
            ).copyWith(right: 0),
            child: Row(

              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(widget.snap.getProfImage(),),//widget.snap['profImage']),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rodrigo Vieira",//"""${widget.snap['username']}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                           // fontSize: 20,
                            color: Theme.of(context).primaryColor
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => Dialog(
                              backgroundColor: mobileBackgroundColor,
                              child: ListView(
                                padding: EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shrinkWrap: true,
                                children: [
                                  'Delete',
                                ]
                                    .map((e) => InkWell(
                                          onTap: () async {
                                            await FirestoreMethods().deletePost(
                                                '1');//widget.snap['postId']);
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 16,
                                            ),
                                            child: Text(e),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ));
                  },
                  icon: Icon(
                    Icons.more_vert,
                    color: Theme.of(context).accentColor
                  ),
                ),
              ],
            ),
          ),
          // Image Section

          GestureDetector(
            onDoubleTap: () async {
              await FirestoreMethods().likeImage(
                '1',//widget.snap['postId'],
                '1',//user.uid,
               a,//widget.snap['likes'],
              );
              setState(() {
                isLikeAnimating = true;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(

                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  child: Image.network(
                    widget.snap.getPostUrl(),
                    fit: BoxFit.cover,
                  ),
                ),
                AnimatedOpacity(
                  duration: Duration(
                    milliseconds: 200,
                  ),
                  opacity: isLikeAnimating ? 1 : 0,
                  child: LikeAnimation(
                    child: Icon(
                      Icons.thumb_up,
                      color: Colors.white,
                      size: 120,
                    ),
                    isAnimating: isLikeAnimating,
                    duration: Duration(
                      milliseconds: 400,
                    ),
                    onEnd: () {
                      setState(() {
                        isLikeAnimating = false;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          //Like Comment Section
          Row(

            children: [
              //Like Widget

              LikeAnimation(
                isAnimating: true,//widget.snap['likes'].contains(user.uid),
                smallLike: false,
                child: IconButton(
                    onPressed: () async {
                      await FirestoreMethods().likeImage(
                        '2',//widget.snap['postId'],
                        '2',//user.uid,
                        a,//widget.snap['likes'],
                      );
                    },
                    icon: true//widget.snap['likes'].contains(user.uid)
                        ? Icon(
                            Icons.favorite,
                            color: Theme.of(context).primaryColor,

                          )
                        : Icon(
                            Icons.thumb_up_alt_outlined,
                            color: Colors.white,
                          )),
              ),

              // Comment Section
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CommentsScreen(
                        snap: null,//widget.snap,
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.offline_bolt,
                  color: Theme.of(context).accentColor,
                ),
              ),
              // Share Widget

              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                  color: Theme.of(context).accentColor,
                ),
              ),

              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.bookmark_border,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Description & Number of comments

          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',//'''${widget.snap['likes'].length} likes',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: 'Texto',//'''${widget.snap['username']}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'Texzto',//'  ${widget.snap['description']}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CommentsScreen(
                          snap: null,//widget.snap,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 6,
                    ),
                    child: Text(
                      'Ver todos ${commentLength} comentario',
                      style: TextStyle(
                        fontSize: 16,
                        color: secondaryColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 6,
                  ),
                  child: Text(
                    DateFormat.yMMMd().format(
                      DateTime(2022),//widget.snap['datePublished'].toDate(),
                    ),
                    style: TextStyle(
                      fontSize: 13,
                      color: secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Divider(color: Colors.grey, height: 1,)
        ],
      ),
    );
  }
}
