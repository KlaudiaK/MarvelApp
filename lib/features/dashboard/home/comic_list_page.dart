import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/features/dashboard/cubit/comic_list_state.dart';
import 'package:marvel_app/features/dashboard/cubit/response_status.dart';

import '../cubit/comic_cubit.dart';
import '../cubit/response_status.dart';
import 'comic_list.dart';

class ComicListScreen extends StatelessWidget {
  ComicListScreen({Key? key}) : super(key: key);

  ComicCubit cubit = Modular.get<ComicCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => cubit, child: const ComicListWidget());
  }
}

class ComicListWidget extends StatelessWidget {
  const ComicListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComicCubit, ComicListState>(builder: (context, state) {
      switch (state.comicListStatus) {
        case ResponseStatus.initial:
          {
            log(state.toString());
            return Container();
          }
        case (ResponseStatus.loading):
          {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        case (ResponseStatus.failure):
          {
            return Center(child: Text("Error"));
          }
        case (ResponseStatus.success):
          {
            return ComicList(comics: state.comicList);
          }
        default:
          {
            return Container();
          }
      }
    });
  }
}
