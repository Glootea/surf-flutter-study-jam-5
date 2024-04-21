part of '../home_screen.dart';

class _HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeScreenState, bool>(
        selector: (state) => state.isSelectingMode,
        builder: (context, selected) {
          return selected ? _SelectedHomeScreenAppBar() : _DefaultHomeScreenAppBar();
        });
  }
}

class _DefaultHomeScreenAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: Icon(themeProvider.useDarkTheme ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
        onPressed: () async => await themeProvider.toggleTheme(),
      ),
      title: Text(
        "Ваши шаблоны мемов",
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}

class _SelectedHomeScreenAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(onPressed: context.read<HomeCubit>().selectAll, icon: const Icon(Icons.select_all_outlined)),
        IconButton(onPressed: () => context.read<HomeCubit>().deleteSelectedItems(), icon: const Icon(Icons.delete)),
      ],
    );
  }
}
