import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/components/components.dart';
import 'package:gym_app/cubit/cubit.dart';
import 'package:gym_app/cubit/states.dart';
import 'package:url_launcher/url_launcher.dart';

class Youtube extends StatelessWidget {
  const Youtube({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GymCubit, GymStates>(
      builder: (context, state) {
        var cubit = GymCubit.get(context);
        return Scaffold(
          body: SafeArea(
              child: cubit.result.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 9 / 9.55,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) => card(
                            check: true,
                            image: "assets/splash.jpg",
                            function: () {
                              _launchUrl(Uri.parse(
                                  cubit.result[index]["Youtube link"]));
                            },
                            name:
                                "${cubit.result[index]["Name"]}:${cubit.result[index]["Force"]}"),
                        itemCount: cubit.result.length,
                      ),
                    )
                  : Container()),
        );
      },
      listener: (context, state) {},
    );
  }
}

Future<void> _launchUrl(Uri uri) async {
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}
