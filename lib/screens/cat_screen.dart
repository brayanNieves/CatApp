import 'package:cat_app/bloc/cat_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatScreen extends StatefulWidget {
  const CatScreen({Key? key}) : super(key: key);

  @override
  State<CatScreen> createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CatBloc>().generateRandomCat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat App'),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
                onTap: () => context.read<CatBloc>().generateRandomCat(),
                child: context
                    .watch<CatBloc>()
                    .loading
                    ? const Center(child: CircularProgressIndicator())
                    : Image.network(context
                    .watch<CatBloc>()
                    .catModel!
                    .url)),
            TextButton(
                onPressed: () {
                  context.read<CatBloc>().loadingCat();
                  context.read<CatBloc>().generateRandomCat();
                },
                child: const Text('New Cat'))
          ],
        ),
      ),
    );
  }
}
