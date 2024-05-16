import 'package:flutter/material.dart';
import 'package:flutter_application_1/modals/catalog.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({super.key, required this.catalog});
  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.red800.bold.xl4.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                        shape:
                            MaterialStateProperty.all(const StadiumBorder())),
                    child: "Add to Cart".text.color(Colors.white).make())
                .wh(130, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(context.theme.colorScheme.secondary)
                          .bold
                          .make(),
                      catalog.desc.text.xl
                          .color(context.theme.colorScheme.secondary)
                          .textStyle(context.captionStyle)
                          .make(),
                      20.heightBox,
                      "Labore aute cupidatat excepteur anim magna. Sit ipsum dolor ea minim enim do Lorem sint labore minim dolore. Tempor duis elit duis velit deserunt consequat nulla aliqua voluptate mollit laborum quis do. Minim velit culpa nulla sit nostrud."
                          .text
                          .center
                          .color(context.theme.colorScheme.secondary)
                          .textStyle(context.captionStyle)
                          .make()
                          .p16()
                    ],
                  ).py64(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
