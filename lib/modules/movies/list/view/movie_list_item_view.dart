import 'package:flutter/material.dart';
import 'package:movie_database/modules/movies/list/view_model/movie_list_item_view_model.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieListCellTile extends StatelessWidget {
  final MovieListItemViewModel viewModel;

  const MovieListCellTile(
    this.viewModel, {
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return viewModel.imagePath != null
        ? FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: viewModel.imagePath,
            fit: BoxFit.cover,
            fadeInDuration: Duration(milliseconds: 200))
        : Container(
            color: Theme.of(context).primaryColor,
            alignment: Alignment.center,
            child: Text(
              viewModel.titleText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.wavy,
                  decorationColor: Colors.red),
            ),
          );
  }
}
