import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/features/dashboard/response_status.dart';
import 'package:marvel_app/utils/strings.dart';
import '../response_status.dart';
import '../comic_list/comic_list.dart';
import 'cubit/comic_cubit.dart';
import 'cubit/comic_list_state.dart';

class ComicListScreen extends StatelessWidget {
  ComicListScreen({Key? key}) : super(key: key);

  ComicCubit cubit = Modular.get<ComicCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: cubit..getComicList(),
        child: const ComicListWidget());
  }
}

class ComicListWidget extends StatelessWidget {
  const ComicListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComicCubit, ComicListState>(builder: (context, state) {
      state = ReadContext(context).read<ComicCubit>().state;
      switch (state.comicListStatus) {
        case ResponseStatus.initial:
          {
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
            return const Center(child: Text(StringResource.error_occured));
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
