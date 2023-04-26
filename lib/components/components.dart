import 'package:flutter/material.dart';

void navigator({required BuildContext context, required Widget widget}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigatorAndPushReplacement(
    {required BuildContext context, required Widget widget}) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}

Widget material(
    {required String text,
    required double font,
    required Color color,
    required Function() function}) {
  return MaterialButton(
    onPressed: function,
    child: Text(
      text,
      style: TextStyle(fontSize: font, color: color),
    ),
  );
}

Widget card({
  required String image,
  required Function() function,
  required String name,
  BuildContext? context,
  bool check = false,
  bool con = false,
}) {
  return InkWell(
    onTap: function,
    child: Container(
      height: con ? MediaQuery.of(context!).size.width / 1.5 : null,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: check ? Border.all(color: Colors.white) : null),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: [
            Image.asset(
              image,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.55),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
