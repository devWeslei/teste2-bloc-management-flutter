import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(HomeLoadingState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    var state;
    switch (event.runtimeType) {
      case HomeFetchList:
        state = await _fetchList();
        break;
      case HomeFetchListWithError:
        state = await _fetchListWithError();
        break;
      case HomeFetchListWithEmptyList:
        state = await _fetchListWithEmptyList();
        break;
    }
    yield state;
  }

  Future<HomeState> _fetchList() async {
    var list = await Future.delayed(
      Duration(
        seconds: 3,
      ),
          () => <String>[
        'Item 1',
        'Item 12',
        'Item 13',
        'Item 14',
        'Item 15',
        'Item 16',
        'Item 17',
        'Item 18',
        'Item 19',
        'Item 110',
        'Item 111',
        'Item 112',
        'Item 113',
        'Item 114',
        'Item 115',
        'Item 116',
        'Item 117',
      ],
    );
    return HomeStateLoaded(list: list);
  }

  Future<HomeState> _fetchListWithEmptyList() async {
    return await Future.delayed(
        const Duration(
          seconds: 3,
        ),
            () => HomeStateEmptyList());
  }

  Future<HomeState> _fetchListWithError() async {
    return await Future.delayed(
        Duration(
          seconds: 3,
        ),
            () => HomeErrorState(message: 'Não foi possível carregar os dados.'));
  }
}