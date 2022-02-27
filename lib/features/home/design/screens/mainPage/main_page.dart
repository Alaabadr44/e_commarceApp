import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/icons.dart';
import '../../../../../utils/text_style.dart';
import '../../../domain/repositories/home_repo.dart';
import '../../manger/home_page_view_model.dart';
import '../../manger/model/category_model.dart';
import '../../widgets/widgets.dart';
import '../../widgets/widgets_items.dart';
import '../categoryResult/category_result_screen.dart';
import '../productScreen/product_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomePageViewM>(
        init: HomePageViewM(Get.find<HomeRepo>()),
        // initState: (_) {},
        builder: (controller) {
          return controller.screenBody[controller.bottomNavIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<HomePageViewM>(
        init: HomePageViewM(Get.find<HomeRepo>()),
        // initState: (_) {},
        builder: (controller) {
          return BottomNavigationBar(
            mouseCursor: MouseCursor.defer,
            selectedFontSize: 14.sp,
            showSelectedLabels: false,
            backgroundColor: Colors.white,
            showUnselectedLabels: false,
            currentIndex: controller.bottomNavIndex,
            onTap: controller.changeBottomNavIndex,
            items: const [
              BottomNavigationBarItem(
                icon: BottomVavBarIcon(iconPath: exploreIcon),
                label: "explore",
                activeIcon: BottomNavBarWord(word: "Explore"),
              ),
              BottomNavigationBarItem(
                icon: BottomVavBarIcon(iconPath: cartIcon),
                label: "Cart",
                activeIcon: BottomNavBarWord(word: "Cart"),
              ),
              BottomNavigationBarItem(
                icon: BottomVavBarIcon(iconPath: userIcon),
                label: "Account",
                activeIcon: BottomNavBarWord(word: "Account"),
              ),
            ],
          );
        },
      ),
    );
  }
}

//
class HomePageExploreBody extends StatelessWidget {
  const HomePageExploreBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 75.h),
            const SearchField(),
            SizedBox(height: 44.h),
            const CategoriesBar(),
            SizedBox(height: 50.h),
            const HomePageBestSellingBar(),
          ],
        ),
      ),
    );
  }
}

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextBold18(
          "Categories",
          // style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(height: 19.h),
        SizedBox(
          height: 89.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: categories.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 19.w);
            },
            itemBuilder: (BuildContext context, int index) {
              return CategoryCardItem(
                categoryName: categories[index].categoryName,
                iconPath: categories[index].icon,
                onTab: ()=>Get.to(()=> const CategoryResultScreen()),
              
              );
            },
          ),
        ),
      ],
    );
  }
}

class HomePageBestSellingBar extends StatelessWidget {
  const HomePageBestSellingBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            TextBold18(
              "Best Selling",
              // style: Theme.of(context).textTheme.headline2,
            ),
            TextNormal16(
              "See all",
              // style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        SizedBox(height: 31.h),
        SizedBox(
          height: 319.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 15.w);
            },
            itemBuilder: (BuildContext context, int index) {
              return HomePageBestSellingItem(
                isApiDate: false,
                onTap: () {
                  Get.to(() => const ProductScreen());
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
