import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_grid_views/widgets/icon_button_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AdvancedGridViewScreen extends StatelessWidget {
  const AdvancedGridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Advanced Grid View')),
      body: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          children: List.generate(30, (final index) {
            return FutureBuilder(
              future: _getImageSize(
                index.isEven
                    ? 'https://picsum.photos/id/$index/200/300'
                    : 'https://picsum.photos/id/$index/200/400',
              ),
              builder: (final context, final snapshot) {
                if (snapshot.hasData) {
                  final widgetSize = snapshot.data as Size;
                  return FadeInDown(
                    child: SizedBox(
                      width: widgetSize.width,
                      height: widgetSize.height,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                index.isEven
                                    ? 'https://picsum.photos/id/$index/200/300'
                                    : 'https://picsum.photos/id/$index/200/400',
                                fit: BoxFit.cover,
                                width: widgetSize.width,
                                height: widgetSize.height,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  FilledButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          WidgetStateProperty.all<Color>(
                                            Colors.deepOrange,
                                          ),
                                    ),
                                    child: Text('SAVE'),
                                  ),
                                  Row(
                                    spacing: 8,
                                    children: [
                                      IconButtonWidget(
                                        icon: CupertinoIcons.heart,
                                        onPressed: () {},
                                      ),
                                      IconButtonWidget(
                                        icon: CupertinoIcons.arrow_down_to_line,
                                        onPressed: () {},
                                      ),
                                      IconButtonWidget(
                                        icon: CupertinoIcons.share,
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            );
          }),
        ),
      ),
    );
  }
}

Future<Size> _getImageSize(final String imageUrl) async {
  final completer = Completer<Size>();
  final image = NetworkImage(imageUrl);
  final stream = image.resolve(ImageConfiguration.empty);

  stream.addListener(
    ImageStreamListener(
      (final ImageInfo info, final bool _) {
        completer.complete(
          Size(info.image.width.toDouble(), info.image.height.toDouble()),
        );
      },
      onError: (final e, final stack) {
        completer.complete(const Size(1, 1));
      },
    ),
  );

  return completer.future;
}
