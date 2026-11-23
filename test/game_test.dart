import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kum_saati/oyun_kum_saati.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kumSaatiConfig.title.length, 33);
    expect(kumSaatiConfig.tagline.length, 33);
    for (final s in kumSaatiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kumSaatiConfig.gameId, kumSaatiId);
    expect(kumSaatiRules.gameId, kumSaatiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kumSaatiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kumSaatiId, optionalMechanics: kumSaatiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(kumSaatiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
