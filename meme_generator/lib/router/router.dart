import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meme_generator/data/database.dart';
import 'package:meme_generator/screen/editor/edit_cubit.dart';
import 'package:meme_generator/screen/home/home_cubit.dart';
import 'package:meme_generator/screen/home/home_screen.dart';
import 'package:meme_generator/screen/editor/meme_generator_screen.dart';
import 'package:meme_generator/screen/pick_file/pick_file.dart';
import 'package:provider/provider.dart';

part 'router.g.dart';

final _database = MemeDatabase();

@TypedGoRoute<HomeRoute>(path: '/', routes: [
  TypedGoRoute<EditorRoute>(
    path: 'edit/:id',
  ),
  TypedGoRoute<PickFileRoute>(
    path: 'pickFile',
  )
])
@immutable
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Provider(
      create: (context) => HomeCubit(_database),
      child: const HomeScreen(),
    );
  }
}

class PickFileRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PickFileScreen();
  }
}

@immutable
class EditorRoute extends GoRouteData {
  final int id;

  const EditorRoute({required this.id});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Provider(
      create: (context) => EditBloc(_database, id),
      child: const EditorScreen(),
    );
  }
}
