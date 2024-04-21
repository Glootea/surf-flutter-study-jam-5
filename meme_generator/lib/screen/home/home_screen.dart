import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_generator/main.dart';
import 'package:meme_generator/screen/home/home_cubit.dart';
import 'package:meme_generator/entity/meme_struct.dart';
import 'package:meme_generator/router/router.dart';
import 'package:meme_generator/screen/home/src/preview_picture.dart';

part 'src/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeCubit>();
    final width = MediaQuery.of(context).size.width;
    final horizontalItemCount = width ~/ 200;
    imageCache.clear();
    bloc.getMemes();
    return Scaffold(
      appBar: _HomeScreenAppBar(),
      body: SafeArea(
        child: GestureDetector(
          onTap: bloc.deselectAll,
          child: BlocSelector<HomeCubit, HomeScreenState, List<MemeStruct>>(
              selector: (state) => state.memes,
              builder: (context, memes) {
                return memes.isEmpty
                    ? const Center(child: Text("Здесь будут ваши шаблоны мемов"))
                    : GridView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: horizontalItemCount,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                        ),
                        itemCount: memes.length,
                        itemBuilder: (context, count) => MemePreview(memes[count]));
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => PickFileRoute().push(context).then((value) => bloc.getMemes()),
          child: const Icon(Icons.add)),
    );
  }
}
