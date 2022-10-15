import 'package:foodapp/generated/assets.gen.dart';

import '../../../generated/locales.g.dart';
import '../../domain/entities/onboaring.entity.dart';

class DataSources {
  static List<OnboaringEntity> onboarings = [
    OnboaringEntity(
      svgPath: Assets.images.onboaring.feelingProud,
      title: LocaleKeys.Onboaring_Title_1,
      description: LocaleKeys.Onboaring_Description_1,
    ),
    OnboaringEntity(
      svgPath: Assets.images.onboaring.analytics,
      title: LocaleKeys.Onboaring_Title_2,
      description: LocaleKeys.Onboaring_Description_2,
    ),
    OnboaringEntity(
      svgPath: Assets.images.onboaring.search,
      title: LocaleKeys.Onboaring_Title_3,
      description: LocaleKeys.Onboaring_Description_3,
    ),
    OnboaringEntity(
      svgPath: Assets.images.onboaring.unlock,
      title: LocaleKeys.Onboaring_Title_4,
      description: LocaleKeys.Onboaring_Description_4,
    ),
  ];
}
