
import 'package:health360/utils/providers/main_provider.dart';

class UIProvider extends MainProvider {
  bool skeleton = true;
  void changeToUI(bool newState){
    skeleton = newState;
    notifyListeners();
  }
}
