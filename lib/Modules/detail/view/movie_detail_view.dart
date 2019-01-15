import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_database/modules/detail/view_model/movie_detail_view_model.dart';

class MovieDetail extends StatefulWidget {
  final MovieDetailViewModel viewHandler;

  const MovieDetail({Key key, this.viewHandler}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MovieDetailState();
  }

}

class MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 300.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(widget.viewHandler.posterUrl,
                      fit: BoxFit.cover,
                    )),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(margin: EdgeInsets.only(top: 5.0)),
                Text(widget.viewHandler.title,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 1.0, right: 1.0),
                    ),
                    Text(
                      widget.viewHandler.voteAverage,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0,
                          right: 10.0),
                    ),
                    Text(
                      widget.viewHandler.releaseDate,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
                Container(margin: EdgeInsets.only(top: 8.0,
                    bottom: 8.0)),
                Text(widget.viewHandler.description, style: TextStyle(color: Colors.white),),
                Container(margin: EdgeInsets.only(top: 8.0,
                    bottom: 8.0)),
              ],
            ),
          ),
      ),
    );
  }
}