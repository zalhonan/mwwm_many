import 'package:flutter/cupertino.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';
import 'package:provider/provider.dart';

import 'package:mwwm_many/domain/scorer.dart';
import 'package:mwwm_many/interactor/scorers_interactor.dart';

class ScorersListWidgetModel extends WidgetModel {
  final ScorersInteractor _scorersInteractor;

  var scorers = StreamedState<Iterable<Scorer>>([]);

  ScorersListWidgetModel(
    WidgetModelDependencies baseDependencies,
    this._scorersInteractor,
  ) : super(baseDependencies) {
    /// под вопросом - как увязать проброс состояния из interactor?
    scorers = StreamedState<Iterable<Scorer>>(_scorersInteractor.getScorers());
  }

  @override
  void onLoad() {
    super.onLoad();
    getScorers();
  }

  void increaseScorer(int position) {
    _scorersInteractor.increaseScorer(position);
  }

  void addScorer() {
    _scorersInteractor.addScorer();
    scorers.accept(_scorersInteractor.getScorers());
  }

  void getScorers() {
    scorers.accept(_scorersInteractor.getScorers());
  }
}

ScorersListWidgetModel createScorersListWidgetModel(
  BuildContext context,
) {
  return ScorersListWidgetModel(
    const WidgetModelDependencies(),
    context.read<ScorersInteractor>(),
  );
}
