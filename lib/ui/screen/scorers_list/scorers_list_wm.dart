import 'package:flutter/cupertino.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';
import 'package:provider/provider.dart';

import 'package:mwwm_many/domain/scorer.dart';
import 'package:mwwm_many/interactor/scorers_interactor.dart';

class ScorersListWidgetModel extends WidgetModel {
  final ScorersInteractor _scorersInteractor;

  late final scorers;

  ScorersListWidgetModel(
    WidgetModelDependencies baseDependencies,
    this._scorersInteractor,
  ) : super(baseDependencies) {
    scorers = _scorersInteractor.getScorers();
  }

  @override
  void onLoad() {
    super.onLoad();
  }

  void increaseScorer(int position) {
    _scorersInteractor.increaseScorer(position);
  }

  Future<void> addScorer() async {
    _scorersInteractor.addScorer();
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
