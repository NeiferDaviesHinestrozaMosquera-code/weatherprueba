import 'package:flutter/material.dart';


class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key, required this.child,
  });

final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(0), 
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(
                  top: -150,
                  right: -250,
                  child: Container(
                    width: 400,
                    height: 400,
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(400)
                    ),
                  )),
              Positioned(
                  top: 100,
                  right: -300,
                  child: Container(
                    width: 400,
                    height: 400,
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(400)
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
