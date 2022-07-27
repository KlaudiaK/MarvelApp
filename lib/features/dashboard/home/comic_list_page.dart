import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/data/local/comic.dart';

import '../cubit/comic_cubit.dart';
import '../cubit/comic_list_state.dart';
import 'comic_list.dart';

class ComicListScreen extends StatelessWidget {
  ComicListScreen({Key? key, required this.widget}) : super(key: key);
  StatelessWidget widget;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => Modular.get<ComicCubit>(), child: widget);
  }
}

class ComicListWidget extends StatelessWidget {
  const ComicListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Modular.get<ComicCubit>().getComicList();
    return BlocBuilder<ComicCubit, ComicState>(builder: (context, state) {
      if (state is ComicListInitial) {
        log(state.toString());
        return Container();
        //return ComicList(comics: comics);
      } else if (state is ComicListLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is ComicListError) {
        return Center(child: Text(state.message));
      } else if (state is ComicListLoaded) {
        return ComicList(comics: state.comic);
      } else {
        return Container();
      }
    });
  }
}
