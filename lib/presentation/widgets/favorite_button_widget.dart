import 'package:flutter/material.dart';
import 'package:shop_app_ui/data/utils/styles/color_scheme.dart';
import 'package:shop_app_ui/data/utils/styles/text_style.dart';

class FavoriteButtonWidget extends StatefulWidget {
  const FavoriteButtonWidget({Key? key}) : super(key: key);

  @override
  State<FavoriteButtonWidget> createState() {
    return _FavoriteButtonWidgetState();
  }
}

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {
  final String _favoriteAdded = 'Liked';
  final String _favoriteRemoved = 'Unliked';

  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() => _isFavorite = !_isFavorite);

        SnackBar snackBar = SnackBar(
          content: Text(
            _isFavorite ? _favoriteAdded : _favoriteRemoved,
            style: snackBarTitle,
          ),
          duration: const Duration(seconds: 3),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      },
      icon: Icon(
        _isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
      ),
      color: _isFavorite ? tertiaryColor : Colors.white,
      tooltip: 'Favorite',
    );
  }
}
