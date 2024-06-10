import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'level_provider.g.dart';

@Riverpod(keepAlive: true)
class CounterNotifier extends _$CounterNotifier {
  final ManageValue _manage = const ManageValue();
  StreamSubscription<int>? _tickerSubscription;

  @override
  Stream<Counter> build()  {

    ref.onDispose(() {
      print('[onDispost]');
       _tickerSubscription?.cancel();
     });

    return Stream.value(Initial());
  }

  void increaseValue({required int value}) {
    final currentLevel = state.value?.level ?? 0;
    final targetValue = currentLevel + value;
    state = AsyncData(Increase(value: currentLevel));
    _tickerSubscription?.cancel();
    _tickerSubscription = _manage.incrementValue(currentLevel: currentLevel, targetValue: targetValue).listen((event) {
      state = AsyncData(Increase(value: event));
    });
  }

  void decreaseValue({required int value}) {
    final currentLevel = state.value?.level ?? 0;
    final targetValue = currentLevel - value;
    state = AsyncData(Decrease(value: currentLevel));
    _tickerSubscription?.cancel();
    _tickerSubscription = _manage.decrementValue(currentLevel: currentLevel, targetValue: targetValue).listen((event) {
      state = AsyncData(Decrease(value: event));
    });
  }

   void resetValue() {
    _tickerSubscription?.cancel();
    state = AsyncData(Initial());
  }


}
class ManageValue {
  const ManageValue();

  Stream<int> incrementValue({required int currentLevel, required int targetValue}) {
    return Stream.periodic(const Duration(milliseconds: 50), (x) {
      if(targetValue >= 100){
        return 100;
      }else{
        return currentLevel + x + 1;
      }
      
    })
        .take(targetValue - currentLevel);
  }

  Stream<int> decrementValue({required int currentLevel, required int targetValue}) {

    return Stream.periodic(const Duration(milliseconds: 50), (x) {
      if(targetValue > 0){
        return currentLevel - x - 1;
      }else{
        return 0 ;
      }
    })
        .take(currentLevel - targetValue);
  }
}


sealed class Counter {
  final int level;
  const Counter(this.level);
}

class Initial extends Counter {
  Initial() : super(0);
}

class Increase extends Counter {
  final int value;
  Increase({required this.value}) : super(value);
}

class Decrease extends Counter {
  final int value;
  Decrease({required this.value}) : super(value);
}
