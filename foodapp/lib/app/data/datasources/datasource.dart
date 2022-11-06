import '../../../generated/assets.gen.dart';
import '../../../generated/locales.g.dart';
import '../../domain/entities/onboaring.entity.dart';

class DataSources {
  static List<OnboaringEntity> onboarings = [
    OnboaringEntity(
      svgPath: Assets.images.onboaring.cake,
      title: LocaleKeys.Onboaring_Title_1,
      description: LocaleKeys.Onboaring_Description_1,
    ),
    OnboaringEntity(
      svgPath: Assets.images.onboaring.food,
      title: LocaleKeys.Onboaring_Title_2,
      description: LocaleKeys.Onboaring_Description_2,
    ),
  ];
}
