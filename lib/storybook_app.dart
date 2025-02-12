import 'package:flutter/material.dart';
import 'package:glowing_widget/widgets/shape_widgets.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'glowing_widget.dart';


class StoryBookApp extends StatelessWidget {
  StoryBookApp({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Storybook(
      initialStory: "Glowing Triangle Button",
      stories: <Story>[
        glowing_button,
      ],
    );
  }

  Story glowing_button = Story(
      name: "Glowing Triangle Button",
      description: '',
      builder: (BuildContext context) {
        // Using sliders to define RGB values for two gradient colors
        final alpha1 = context.knobs.slider(label: "Color Alpha", initial: 255, min: 0, max: 255);
        final red1 = context.knobs.slider(label: "Color Red", initial: 0, min: 0, max: 255);
        final green1 = context.knobs.slider(label: "Color Green", initial: 0, min: 0, max: 255);
        final blue1 = context.knobs.slider(label: "Color Blue", initial: 255, min: 0, max: 255);

        final shadow_color = Color.fromARGB(alpha1.toInt(), red1.toInt(), green1.toInt(), blue1.toInt());

        final size_w = context.knobs
            .sliderInt(
            label: "width", initial: 100, min: 10, max: 400)
            .toDouble();

        final size_h = context.knobs
            .sliderInt(
            label: "height", initial: 100, min: 10, max: 400)
            .toDouble();

        List<Widget> shapes = [
          GlowingWidget(
              shadowColor: shadow_color,
              size: Offset(size_w, size_h),
              child: WeirdShapeWidget(
                color: Colors.black87,
                size: Size(size_w, size_h),
              )
          ),
          GlowingWidget(
              shadowColor: shadow_color,
              size: Offset(size_w, size_h),
              child: RoundWidget(
                color: Colors.black87,
                size: Size(size_w, size_h),
              )
          ),
          GlowingWidget(
              shadowColor: shadow_color,
              size: Offset(size_w, size_h),
              child: TriangleWidget(
                color: Colors.black87,
                size: Size(size_w, size_h),
              )
          )
        ];

        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // columns nb
                crossAxisSpacing: 10, // rows
                mainAxisSpacing: 10,
              ),
              padding: EdgeInsets.all(10),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    // color: Colors.green,
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: shapes.elementAt(index)
                );
              },
            ),
          ),
        );
      });
}




