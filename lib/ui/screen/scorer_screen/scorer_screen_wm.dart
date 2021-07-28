import 'package:flutter/cupertino.dart';
import 'package:mwwm/mwwm.dart';
import 'package:provider/provider.dart';
import 'package:mwwm_many/interactor/scorers_interactor.dart';

/// Класс-состояние для страницы с вёрсткой одного счетчика
class ScorerScreenWidgetModel extends WidgetModel {
  /// Инициализация Interactor
  final ScorersInteractor _scorersInteractor;

  /// поздняя инициализация - мы получим это в конструкторе и зафиксируем как final
  late final scorers;

  ScorerScreenWidgetModel(
    WidgetModelDependencies baseDependencies,
    this._scorersInteractor,
  ) : super(baseDependencies) {
    /// проксирование стрима из интерактора
    scorers = _scorersInteractor.getScorers();
  }

  /// функция - инкремент счетчика. Обращается к интерактору.
  void increaseScorer(int position) {
    _scorersInteractor.increaseScorer(position);
  }

  /// Текущий счетчик в работе
  //TODO узнать как правильно
  int getCurrent() {
    return _scorersInteractor.getCurrent;
  }
}

/// функция - создание WidgetModel. Используется в CounterScreen
ScorerScreenWidgetModel createScorerScreenWidgetModel(
  BuildContext context,
) {
  return ScorerScreenWidgetModel(
    const WidgetModelDependencies(),

    /// запрос интерактора из провайдера
    context.read<ScorersInteractor>(),
  );
}
