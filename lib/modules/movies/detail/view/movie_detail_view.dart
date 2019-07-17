import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_database/modules/movies/detail/view_model/movie_detail_view_model.dart';

class MovieDetail extends StatelessWidget {
  final MovieDetailViewModel viewHandler;

  const MovieDetail({Key key, this.viewHandler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              expandedHeight: 250.0,
              floating: false,
              pinned: true,
              backgroundColor: Theme.of(context).primaryColor,
              flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                viewHandler.posterUrl,
                fit: BoxFit.cover,
              ))),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(margin: EdgeInsets.only(top: 5.0)),
                      Text(
                        viewHandler.title,
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        key: Key('movie_detail_item_title'),
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
                            viewHandler.voteAverage,
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10.0, right: 10.0),
                          ),
                          Text(
                            viewHandler.releaseDate,
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ],
                      ),
                      Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                      Text(
                        viewHandler.description,
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
