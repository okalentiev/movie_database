import 'package:flutter/material.dart';
import 'package:movie_database/modules/movies/list/view_model/impl/movie_list_view_model_impl.dart';
import 'package:movie_database/modules/movies/list/view_model/movie_list_item_view_model.dart';
import 'package:movie_database/modules/movies/list/view_model/movie_list_view_model.dart';

import 'movie_list_item_view.dart';

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
  final ScrollController _scrollController = new ScrollController();

  MovieListState(this._viewHandler);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _viewHandler.viewLoaded();
    _viewHandler.pushWidget.listen((widget) {
      _pushWidget(widget);
    });
  }

  @override
  void dispose() {
    _viewHandler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 26.0),
          key: Key('list_title'),
        ),
        centerTitle: false,
      ),
      body: StreamBuilder(
        stream: _viewHandler.movieList,
        builder: (context, AsyncSnapshot<List<MovieListItemViewModel>> snapshot) {
          if (snapshot.hasData) {
            return MovieListWidget(
              scrollController: _scrollController,
              viewHandler: _viewHandler,
              snapshot: snapshot,
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent * 0.8) {
      _viewHandler.reachingBottom();
    }
  }

  _pushWidget(Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({
    Key key,
    @required ScrollController scrollController,
    @required MovieListViewModel viewHandler,
    this.snapshot,
  })  : _scrollController = scrollController,
        _viewHandler = viewHandler,
        super(key: key);

  final ScrollController _scrollController;
  final MovieListViewModel _viewHandler;
  final AsyncSnapshot<List<MovieListItemViewModel>> snapshot;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => GridView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          itemCount: snapshot.data.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
              childAspectRatio: 2 / 3),
          itemBuilder: (BuildContext context, int index) => GridTile(
                child: InkResponse(
                  enableFeedback: true,
                  child: MovieListCellTile(
                    snapshot.data[index],
                    context: context,
                    key: Key('movie_cell_list_tile' + index.toString()),
                  ),
                  onTap: () => _viewHandler.cellSelected(index),
                ),
              )),
    );
  }
}
