import 'package:flutter/material.dart';
import 'package:initial/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:initial/models/catalog.dart';

class HomePageDetail extends StatelessWidget {
  const HomePageDetail({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl2.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    MyTheme.darkBluishColor,
                  ),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(),
                  )),
              child: "Add To Cart".text.make(),
            ).wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(
                  catalog.image,
                )).h32(context),
            Expanded(
              child: VxArc(
                  height: 30,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 32, horizontal: 0),
                    color: Colors.white,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl4.bold
                            .color(MyTheme.darkBluishColor)
                            .make(),
                        Text(
                          catalog.desc,
                          style: Theme.of(context).textTheme.caption,
                        ).text.xl.make(),
                        Text(
                          "Clita ipsum gubergren accusam erat consetetur ipsum aliquyam sadipscing. Labore diam dolor diam tempor, sed diam et et no dolor ipsum sed, est et voluptua accusam at labore, invidunt ea stet accusam ipsum lorem accusam sed sit sed. Amet sed gubergren sadipscing sea ipsum invidunt et voluptua sadipscing. Lorem diam.",
                          style: Theme.of(context).textTheme.caption,
                        ).text.make().p16()
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
