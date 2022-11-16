import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarthomescreen/cubit/cubit.dart';
import 'package:smarthomescreen/cubit/states.dart';

class CardSmartHome extends StatelessWidget {
  int index;
  CardSmartHome({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: Card(
        color: SmartUiCubit.get(context).mySmartDevice[index][2]
            ? Colors.black
            : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image(
                image: AssetImage(
                    SmartUiCubit.get(context).mySmartDevice[index][1]),
                color: SmartUiCubit.get(context).mySmartDevice[index][2]
                    ? Colors.white
                    : Colors.black,
                height: 85,
                width: 85,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  bottom: 12.0, start: 20, end: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      SmartUiCubit.get(context).mySmartDevice[index][0],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: SmartUiCubit.get(context).mySmartDevice[index][2]
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                  Transform.rotate(
                      angle: pi,
                      child: CupertinoSwitch(
                          value: SmartUiCubit.get(context).mySmartDevice[index]
                              [2],
                          onChanged: (v) {
                            SmartUiCubit.get(context).changeButtonm(index);
                          }))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
