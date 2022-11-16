import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthomescreen/cubit/cubit.dart';
import 'package:smarthomescreen/cubit/states.dart';
import 'package:smarthomescreen/modules/card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SmartUiCubit(),
      child: BlocConsumer<SmartUiCubit, SmartUiStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Image(
                        image: AssetImage("images/menu.png"),
                        height: 40,
                        width: 40,
                      ),
                      Icon(
                        Icons.person,
                        size: 40,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Welcome to your Home",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(color: Colors.grey[500]),
                        fontSize: 13),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "kabatcha".toUpperCase(),
                    style: GoogleFonts.lato(
                        textStyle:
                            TextStyle(color: Colors.grey[550], fontSize: 35),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Divider(
                    color: Colors.grey[500],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Smart Devices",
                    style: GoogleFonts.lato(
                        textStyle:
                            TextStyle(color: Colors.grey[550], fontSize: 20),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1 / 1.2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 4),
                      itemBuilder: (context, index) => CardSmartHome(
                        index: index,
                      ),
                      itemCount: SmartUiCubit.get(context).mySmartDevice.length,
                    ),
                  )
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
