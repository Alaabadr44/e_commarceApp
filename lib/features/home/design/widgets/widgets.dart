import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49.h,
      width: 352.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(45),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(10),
            fillColor: const Color(0xff000000).withOpacity(0.03),
            filled: true,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
