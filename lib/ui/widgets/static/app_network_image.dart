import 'package:flutter/widgets.dart';
import 'package:tomisha_work_test/utils/ext.dart';
import 'package:tomisha_work_test/utils/ui_util.dart';

class AppNetworkImage extends StatelessWidget {
  final String url;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final double? borderRadius;
  final BoxBorder? border;
  final Widget? errorWidget;

  const AppNetworkImage({
    super.key,
    required this.url,
    this.fit,
    this.width,
    this.height,
    this.borderRadius,
    this.border,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return border != null
        ? Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
              border: border,
              image: DecorationImage(
                image: NetworkImage(url),
                fit: fit ?? BoxFit.cover,
              ),
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(borderRadius ?? 0),
            child: Image.network(
              url.fullUrl,
              width: width,
              height: height,
              fit: fit ?? BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  errorWidget ?? UiUtil.errorImage(),
            ),
          );
  }
}
