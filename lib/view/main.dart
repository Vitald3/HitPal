import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../controller/navigation.dart';

class MainView extends StatelessWidget {
  const MainView({super.key, this.index});

  final int? index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
        init: NavigationController(),
        builder: (controller) => Obx(() => buildNavigator(controller))
    );
  }

  buildNavigator(NavigationController controller) {
    int act = controller.activeTab.value;

    if (!controller.reset.value && index != null) {
      act = index!;
      WidgetsBinding.instance.addPostFrameCallback((_) => controller.resetV());
    }

    return PopScope(
        canPop: false,
        onPopInvoked: (val) async {
          return;
        },
        child: Navigator(
          key: controller.navigatorKeys[act],
          onGenerateRoute: (RouteSettings settings) {
            return CupertinoPageRoute(builder: (_) => controller.widgetOptions.elementAt(act));
          },
        )
    );
  }
}