import 'package:flutter/material.dart';
import 'package:flutter_quotes/ui/styleguide/theme_text.dart';
import 'package:flutter_screenutil/screenutil.dart';


class QuoteWidget extends StatelessWidget {
  final Color backgroundColor;
  final String quote, author;

  const QuoteWidget({
    Key key,
    @required this.backgroundColor,
    @required this.quote,
    @required this.author,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Container(
      width: ScreenUtil.screenWidthDp,
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(16),
        vertical: ScreenUtil().setHeight(48),
      ),
      color: backgroundColor,
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/quote_icon.png',
            color: Colors.white.withOpacity(0.4),
            height: ScreenUtil().setHeight(100),
            width: ScreenUtil().setWidth(100),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              quote,
              style: ThemeText.headline,
            ),
          ),
          Expanded(
                      child: Center(
              child: Text(
                author,
                style: ThemeText.subhead,
              ),
            ),
          )
        ],
      ),
    );
  }
}
