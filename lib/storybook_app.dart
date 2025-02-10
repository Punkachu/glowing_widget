import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'glowing_widget.dart';


class StoryBookApp extends StatelessWidget {
  StoryBookApp({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Storybook(
      initialStory: "Glowing Button",
      stories: <Story>[
        glowing_button,
      ],
    );
  }

  Story glowing_button = Story(
      name: "Glowing Button",
      description: 'Login Page',
      builder: (BuildContext context) {
        return Scaffold(
          body: SizedBox(
            width: context.knobs
                .sliderInt(
                label: "width", initial: 2000, min: 200, max: 4000)
                .toDouble(),
            height: context.knobs
                .sliderInt(
                label: "height", initial: 2000, min: 200, max: 4000)
                .toDouble(),
            child: Center(
              child: DropShadow(
                child: ,
              ),
            ),
          ),
        );
      });
}




