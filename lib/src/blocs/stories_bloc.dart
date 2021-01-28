import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import '../resources/repository.dart';

class StoriesBloc {
  final _repository = Repository();
  final _topIds = PublishSubject<List<int>>();
  final _itemsOutput = BehaviorSubject<Map<int,Future<ItemModel>>>();
  final _itemsFetcher = PublishSubject<int>();

  //to sink getters
  Stream<List<int>> get topIds => _topIds.stream;
  Stream<Map<int,Future<ItemModel>>> get items => _itemsOutput.stream;

  //getters to sinks
  Function(int) get fetchItem => _itemsFetcher.sink.add;

  StoriesBloc() {
    print('at cons');

    _itemsFetcher.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
  }

  fetchTopIds() async {
    print('at fetch top ids');
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
    print('ides $ids');
  }

  _itemsTransformer() {
    print('at transformer');
    return ScanStreamTransformer(
      (Map<int, Future<ItemModel>> cache, int id, index) {
        print('call $index');
        cache[id] = _repository.fetchItem(id);
        return cache;
      },
      <int, Future<ItemModel>>{},
    );
  }

  dispose() {
    _topIds.close();
    _itemsFetcher.close();
    _itemsOutput.close();
  }
}
