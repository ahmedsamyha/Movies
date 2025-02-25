import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/colors.dart';

class ShowButtomSheet extends StatefulWidget {
  ShowButtomSheet({super.key, required this.selectedPhoto});
  final int? selectedPhoto;

  @override
  State<ShowButtomSheet> createState() => _ShowButtomSheetState();
}

class _ShowButtomSheetState extends State<ShowButtomSheet> {
  int? selectedPhoto;

  @override
  void initState() {
    super.initState();
    selectedPhoto = widget.selectedPhoto;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: AppColors.grayBackground,
      ),
      height: MediaQuery.of(context).size.height * .48,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 6,
          mainAxisSpacing: 4,
        ),
        itemCount: 9,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context, index);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: selectedPhoto == index
                    ? AppColors.Primary50Color
                    : AppColors.darkBackground,
                border: Border.all(color: AppColors.kPrimaryColor),
              ),
              child: Image.asset('assets/images/avatar${index + 1}.png'),
            ),
          );
        },
      ),
    );
  }
}

