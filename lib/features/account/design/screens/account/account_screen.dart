import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/text_style.dart';
import '../../manger/manger/account_view_model.dart';

class HomePageAccountBody extends StatelessWidget {
  const HomePageAccountBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 14.h),
          // photo and name and email
          const AccountScreenUserImgNameEmail(),
          SizedBox(height: 70.h),
          GetBuilder<AccountViewModel>(
            init: AccountViewModel(),
            builder: (controller) {
              return ListView.separated(
                shrinkWrap: true,
                itemCount:controller. accountOptions.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 20.h);
                },
                itemBuilder: (BuildContext context, int index) {
                  return AccountScreenOptionItem(
                    optionWord:controller. accountOptions[index].optionWord,
                    imgPath:controller. accountOptions[index].iconPath,
                    optionPress:controller. accountOptions[index].optionPress,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class AccountScreenUserImgNameEmail extends StatelessWidget {
  const AccountScreenUserImgNameEmail({
    Key? key,
    this.isApi = false,
    this.imgUrl,
    this.accountName,
    this.accountEmail,
  }) : super(key: key);

  final bool isApi;
  final String? imgUrl;
  final String? accountName;
  final String? accountEmail;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(60.r),
          child: SizedBox(
            height: 120.h,
            width: 120.w,
            child: !isApi
                ? Image.asset(
                    faceImg,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    imgUrl!,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        SizedBox(width: 30.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextNormal26(
              !isApi ? "David Spade" : accountName!,
              // style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 6.h),
            TextNormal14(
              !isApi ? "iamdavid@gmail.com" : accountEmail!,
              // style: Theme.of(context).textTheme.bodyText1,
            )
          ],
        )
      ],
    );
  }
}

class AccountScreenOptionItem extends StatelessWidget {
  const AccountScreenOptionItem({
    Key? key,
    required this.imgPath,
    required this.optionWord,
    required this.optionPress,
  }) : super(key: key);

  final String imgPath;
  final String optionWord;
  final VoidCallback optionPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
      leading: Container(
        height: 40.h,
        width: 40.w,
        color: accIconColor,
        child: Center(
          child: SvgPicture.asset(imgPath),
        ),
      ),
      title: TextNormal18(
        optionWord,
      ),
      trailing: IconButton(
        onPressed: optionPress,
        icon: const Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.black,
          size: 20,
        ),
      ),
    );
  }
}
