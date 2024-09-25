part of app_widget;

class AppNetworkImage extends StatelessWidget {
  final String url;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final double borderRadius;
  final bool enableDarkMode;

  const AppNetworkImage(
      {Key? key,
        required this.url,
        this.fit,
        this.width,
        this.enableDarkMode = false,
        this.height,
        this.borderRadius = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          imageUrl: url,
          imageBuilder: (context, imageProvider) => DecoratedBox(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: fit ?? BoxFit.cover,
                    colorFilter: enableDarkMode
                        ? ColorFilter.mode(
                      Colors.black.withOpacity(0.6),
                      BlendMode.darken,
                    )
                        : null,
                  ))),
          placeholder: (context, url) => const AppLoading(isLoading: true),
          errorWidget: (context, url, error) =>
              Icon(Icons.error, color: Theme.of(context).colorScheme.onError),
        ),
      ),
    );
  }
}