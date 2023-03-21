import 'init/init.dart';

void main() async {
  // WidgetsBinding widgetsBinding =  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = GlobalBlocObserver();
  runApp(Init());
}
