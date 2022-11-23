import '../../../generated/assets.gen.dart';
import '../../../generated/locales.g.dart';
import '../../domain/entities/onboaring.entity.dart';
import 'package:get/get.dart';
class DataSources {
  static List<OnboaringEntity> onboarings = [
    OnboaringEntity(
      svgPath: Assets.images.onboaring.cake,
      title: LocaleKeys.Onboaring_Title_1.tr,
      description: LocaleKeys.Onboaring_Description_1.tr,
    ),
    OnboaringEntity(
      svgPath: Assets.images.onboaring.food,
      title: LocaleKeys.Onboaring_Title_2.tr,
      description: LocaleKeys.Onboaring_Description_2.tr,
    ),
  ];
}
