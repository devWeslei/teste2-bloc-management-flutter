import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo Bloc'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
          bloc: BlocProvider.of<HomeBloc>(context),
          builder: (context, state) {

            if (state is HomeStateLoaded)
              return ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.list[index]),
                  );
                },
              );


            if (state is HomeErrorState) {
              return Center(
                child: Text(state.message),
              );
            }

            if (state is HomeStateEmptyList) {
              return const Center(
                child: Text('Não há dados disponíveis.'),
              );
            }

            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}