part of 'profile_mobile_view.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AppSizeScale(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: AppPadding.medium(
          child: ListView(
            padding: const EdgeInsets.all(0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              const ProfileUserInformationWidget(),
              RoleWrapper(userView: const ProfileVoucherWidget()),
              RoleWrapper(userView:  const FavoriteList()),
              //RoleWrapper(userView:  HistoryList()),
            ],
          ),
        ),
      ),
    );
  }
}
