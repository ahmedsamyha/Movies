import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';

class ScrollHorizent extends StatefulWidget {
   ScrollHorizent({required this.list,super.key});
List <String>list;

  @override
  State<ScrollHorizent> createState() => _ScrollHorizentState();
}

class _ScrollHorizentState extends State<ScrollHorizent> {
int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.separated(

      separatorBuilder: (context,index){
        return SizedBox(width: 16,);
      },
      scrollDirection: Axis.horizontal,
        itemCount: widget.list.length,
        itemBuilder: (context, index) {

        return InkWell(
          onTap: (){
            selectedIndex=index;
            setState(() {

            });
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 16),

            decoration:selectedIndex==index? BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.kPrimaryColor,
            ):BoxDecoration(
              border: Border.all(
                color: AppColors.kPrimaryColor,
                    width: 2,
              ),
              borderRadius: BorderRadius.circular(16),
              color: AppColors.darkBackground,
            ),
            child: Text(widget.list[index],
                style: selectedIndex==index?KStyles.roboto20w700Black:KStyles.roboto20w700Primary,),
          ),
        );}));
  }
}
