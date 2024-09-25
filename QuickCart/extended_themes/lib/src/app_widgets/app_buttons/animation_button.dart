part of 'app_buttons.dart';

enum AnimationState { none, loading, done }

class AnimationButton extends StatefulWidget {
  final String textDone;
  final String textLoading;
  final String textButton;
  final bool loading;
  final double? ratioWidthButton;
  final double? ratioWidthLoading;
  final double? ratioWidthDone;
  final VoidCallback? onPressed;
  final VoidCallback? onDone;
  final Duration? duration;

  const AnimationButton(
      {super.key,
        required this.textDone,
        required this.textLoading,
        required this.textButton,
        required this.loading,
        this.onDone,
        this.onPressed,
        this.ratioWidthButton = 0.9,
        this.ratioWidthLoading = 0.75,
        this.ratioWidthDone = 0.6,
        this.duration = const Duration(milliseconds: 400)});

  @override
  State<AnimationButton> createState() => _AnimationButtonState();
}

class _AnimationButtonState extends State<AnimationButton> {
  AnimationState _lastAnimationState = AnimationState.none;

  AnimationState _getAnimationState() {
    if (widget.loading) {
      _lastAnimationState = AnimationState.loading;
      return AnimationState.loading;
    }
    if (!widget.loading && _lastAnimationState == AnimationState.loading) {
      _lastAnimationState = AnimationState.done;
      return AnimationState.done;
    }
    if (!widget.loading && _lastAnimationState == AnimationState.done) {
      _lastAnimationState = AnimationState.none;
      return AnimationState.none;
    }
    return AnimationState.none;
  }

  double _getSizeByAnimationState(AnimationState animationState, double size) {
    if (animationState == AnimationState.none) {
      return size * widget.ratioWidthButton!;
    }
    if (animationState == AnimationState.loading) {
      return size * widget.ratioWidthLoading!;
    }
    if (animationState == AnimationState.done) {
      return size * widget.ratioWidthDone!;
    }
    return size;
  }

  @override
  Widget build(BuildContext context) {
    AnimationState animationState = _getAnimationState();
    final size = MediaQuery.of(context).size;
    return AnimatedContainer(
      width: _getSizeByAnimationState(animationState, size.width),
      duration: widget.duration!,
      curve: Curves.easeInOut,
      child: Builder(builder: (context) {
        if (animationState == AnimationState.none) {
          return AppButton.max(
              title: widget.textButton,
              onPressed: () {
                widget.onPressed?.call();
              });
        }
        if (animationState == AnimationState.loading) {
          return AnimationLoadingButton(textLoading: widget.textLoading);
        }
        if (animationState == AnimationState.done) {
          Future.delayed(const Duration(milliseconds: 4000), () {
            animationState = AnimationState.none;
            widget.onDone?.call();
            if (!mounted) return;
            setState(() {});
          });
          return AnimationDoneButton(textDone: widget.textDone);
        }
        return const SizedBox.shrink();
      }),
    );
  }
}

class AnimationDoneButton extends StatelessWidget {
  final String textDone;

  const AnimationDoneButton({Key? key, required this.textDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: EdgeInsets.symmetric(horizontal: AppGapSize.regular.size),
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: ThemeColors.gradientButtonColor,
            borderRadius: BorderRadius.circular(16)),
        child: ElevatedButton(
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.done, color: Colors.white),
              SizedBox(width: AppGapSize.small.size),
              Expanded(
                child: AppText.bodyLarge(
                  text: textDone,
                  color: Colors.white,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimationLoadingButton extends StatelessWidget {
  final String textLoading;

  const AnimationLoadingButton({Key? key, required this.textLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: EdgeInsets.symmetric(horizontal: AppGapSize.regular.size),
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: ThemeColors.gradientButtonColor,
            borderRadius: BorderRadius.circular(16)),
        child: ElevatedButton(
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppLoading(isLoading: true, color: Colors.white, size: 24),
              SizedBox(width: AppGapSize.small.size),
              Expanded(
                child: AppText.bodyLarge(
                  text: textLoading,
                  color: Colors.white,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}