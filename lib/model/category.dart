import 'package:news_app/utils/assets_manager.dart';

class Category {
  String id;
  String title;
  String image;

  Category({
    required this.id,
    required this.title,
    required this.image,
  });

  static List<Category> getCategorisList(bool isDark) {
    return [
      Category(
        id: 'general',
        title: 'General',
        image: isDark
            ? AssetsManager.generalLightImage
            : AssetsManager.generalDarkImage,
      ),
      Category(
        id: 'business',
        title: 'Business',
        image: isDark
            ? AssetsManager.businessLightImage
            : AssetsManager.businessDarkImage,
      ),
      Category(
        id: 'sports',
        title: 'Sports',
        image: isDark
            ? AssetsManager.sportsLightImage
            : AssetsManager.sportsDarkImage,
      ),
      Category(
        id: 'technology',
        title: 'Technology',
        image: isDark
            ? AssetsManager.technologyLightImage
            : AssetsManager.technologyDarkImage,
      ),
      Category(
        id: 'health',
        title: 'Health',
        image: isDark
            ? AssetsManager.healthLightImage
            : AssetsManager.healthDarkImage,
      ),
      Category(
        id: 'entertainment',
        title: 'Entertainment',
        image: isDark
            ? AssetsManager.entertainmentLightImage
            : AssetsManager.entertainmentDarkImage,
      ),
      Category(
        id: 'science',
        title: 'Science',
        image: isDark
            ? AssetsManager.scienceLightImage
            : AssetsManager.scienceDarkImage,
      ),
    ];
  }
}