import 'package:mwwm_many/domain/scorer.dart';

/// Интерактор взаимодействия со скорерами
class ScorersInteractor {
  final _scorers = <Scorer>[];

  /// Получить список скореров
  Iterable<Scorer> getScorers() {
    return _scorers;
  }

  /// добавить скорер
  void addScorer() {
    _scorers.add(Scorer(score: 0));
  }

  /// Получить значение определённого скорера
  int getScorerValue(int position) {
    return _scorers[position].score;
  }

  /// Увеличить значение определенного скорера
  void increaseScorer(int position) {
    _scorers[position].score++;
  }
}
