import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trypro/core/cubit/login_cubit.dart';
import 'package:trypro/core/cubit/add_new_cubit.dart';
import 'package:trypro/features/home/application/form_cubit.dart';
import 'package:trypro/features/home/home.dart';
import 'core/cubit/bloc_observer.dart';
import 'core/network/local/cache_helper.dart';
import 'features/admin/CurvedBar_admin.dart';
import 'core/cubit/layout_cubit.dart';
import 'features/parent/CurvedNavigationBar.dart';
import 'features/teatcher/CurvedBar_teacher.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await CacheHelper.init();
  await Firebase.initializeApp();
  Widget startWidget=HomePage();
  String kind=CacheHelper.getData(key: 'kind')??'';
  if(kind=='admin')
  {
    startWidget=NavigationBarAdmin();
  }
  else if(kind=='Parent')
  {
    startWidget=const navigationbar();
  }
  else if(kind=='Teacher')
  {
    startWidget=const navigationbarteacher();
  }
  runApp(MyApp(startWidget));
}

class MyApp extends StatelessWidget {
  Widget START;

  MyApp(this.START);

  @override
  Widget build(BuildContext context,) {
    return MultiBlocProvider(
       providers: [
         BlocProvider(create: (context)=>AddNewCubit()),
         BlocProvider(create: (context)=>FormCubit()..getAllForm(context)),
         BlocProvider(create: (context)=>LoginCubit()),
         BlocProvider(create: (context)=>LayoutCubit()..getAllStudentParent()..GitUserData(coll:'${CacheHelper.getData(key: 'kind')}')),
       ],
      child: MaterialApp(
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: START,
      ),
    );
  }
}
// NetworkImage("https://cdn-icons-png.flaticon.com/128/2995/2995462.png",)
// NetworkImage("https://cdn-icons-png.flaticon.com/128/3153/3153044.png",)