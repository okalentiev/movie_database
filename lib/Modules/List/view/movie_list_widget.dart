import 'package:flutter/material.dart';
import 'package:movie_database/modules/list/model/movie.dart';
import 'package:movie_database/modules/list/view_model/impl/movie_list_view_model_impl.dart';
import 'package:movie_database/modules/list/view_model/movie_list_view_model.dart';

class MovieList extends StatefulWidget {
  final String title;

  MovieList({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MovieListState(MovieListViewModelImpl());
  }
}

class MovieListState extends State<MovieList> {
  final MovieListViewModel _viewHandler;

  MovieListState(this._viewHandler);

  @override
  void initState() {
    super.initState();
    _viewHandler.viewLoaded();
  }

  @override
  void dispose() {
    _viewHandler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: false,
      ),
      body: StreamBuilder(
        stream: _viewHandler.movieList,
        builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<List<Movie>> snapshot) => OrientationBuilder(
      builder: (context, orientation) => GridView.builder(
          itemCount: snapshot.data.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
              childAspectRatio: 2/3),
          itemBuilder: (BuildContext context, int index) => GridTile(
              child: InkResponse(
                enableFeedback: true,
                child: Image.network('https://image.tmdb.org/t/p/w342${snapshot.data[index].posterPath}',
                  fit: BoxFit.cover,),
              ),
            )),
    );
}
