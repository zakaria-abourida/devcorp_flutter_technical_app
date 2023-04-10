import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;

  const AppBarWidget({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {


    return
       PreferredSize(
          preferredSize: const  Size.fromHeight(70.0), // here the desired height
        child:
         AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25.0),
          )),
         
          centerTitle: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              title??'',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp,
                  fontFamily: 'Lexend'),
            ),
            centerTitle: false,
            background: Container(
                // width: 428.w,
                decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(25.0)),
              gradient: LinearGradient(
                  begin: Alignment(1, 1.5),
                  end: Alignment(-0.94597145915031433, -0.8),
                  colors: [
                    Color.fromRGBO(88, 185, 255, 1),
                    Color.fromRGBO(151, 72, 150, 1)
                  ]),
            )),
          ),
        ),
      );
   }
}
