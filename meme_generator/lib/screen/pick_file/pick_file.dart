import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_generator/screen/pick_file/pick_file_cubit.dart';

class PickFileScreen extends StatefulWidget {
  const PickFileScreen({super.key});

  @override
  State<PickFileScreen> createState() => _PickFileScreenState();
}

class _PickFileScreenState extends State<PickFileScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PickFileCubit, bool>(builder: (context, processing) {
      final bloc = context.read<PickFileCubit>();
      return PopScope(
          canPop: !processing,
          child: Scaffold(
            appBar: AppBar(title: const Text('Выберите изображение')),
            body: processing
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        TextButton(
                          onPressed: () => bloc.pickFileFromLink(context, controller.text),
                          child: const Text('Ссылка', textAlign: TextAlign.left),
                        ),
                        Expanded(
                          child: TextField(
                            onTapOutside: (event) => FocusScope.of(context).unfocus(),
                            controller: controller,
                            decoration: const InputDecoration(labelText: 'Ссылка на изображение'),
                          ),
                        ),
                      ]),
                      const SizedBox(height: 16),
                      const Divider(),
                      TextButton(
                        onPressed: () async => bloc.pickFileFromGallery(context),
                        child: const Text('Выбрать из галереи', textAlign: TextAlign.left),
                      )
                    ],
                  ),
          ));
    });
  }
}
