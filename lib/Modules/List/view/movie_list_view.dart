import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:movie_database/modules/list/view_model/impl/movie_list_view_model_impl.dart';
import 'package:movie_database/modules/list/view_model/movie_list_item_view_model.dart';
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
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: false,
      ),
      body: StreamBuilder(
        stream: _viewHandler.movieList,
        builder: (context, AsyncSnapshot<List<MovieListItemViewModel>> snapshot) {
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

  Widget buildList(AsyncSnapshot<List<MovieListItemViewModel>> snapshot) => OrientationBuilder(
      builder: (context, orientation) => GridView.builder(
          controller: _scrollController,
          itemCount: snapshot.data.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
              childAspectRatio: 2/3),
          itemBuilder: (BuildContext context, int index) => GridTile(
              child: InkResponse(
                enableFeedback: true,
                child: _cellTile(snapshot.data[index]),
                onTap: () => _viewHandler.cellSelected(index),
              ),
            )),
    );

  _scrollListener() {
      if (_scrollController.offset >= _scrollController.position.maxScrollExtent * 0.8) {
        _viewHandler.reachingBottom();
      }
  }

  _pushWidget(StatefulWidget widget) {
    Navigator.push( context, MaterialPageRoute(builder: (context) => widget),);
  }

  Widget _cellTile(MovieListItemViewModel viewModel) {
    return viewModel.imagePath != null ?
    FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: viewModel.imagePath, fit: BoxFit.cover, fadeInDuration: Duration(milliseconds: 200)) :
    Container(color: Theme.of(context).primaryColor,
      alignment: Alignment.center,
      child: Text(viewModel.titleText, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, decoration: 
      TextDecoration.underline, decorationStyle: TextDecorationStyle.wavy, decorationColor: Colors.red),),);
  }
}
