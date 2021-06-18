import 'dart:io';
import 'package:check_flutter/date_selector.dart';
import 'package:check_flutter/modules/components/form_validator.dart';
import 'package:check_flutter/modules/customer_services/services/organizations/organization_api.dart';
import 'package:check_flutter/modules/customer_services/services/organizations/organization_upload.dart';
import 'package:check_flutter/modules/customer_services/services/organizations/submit_org_logo.dart';
import 'package:check_flutter/modules/field_controller.dart';
import 'package:check_flutter/modules/picking_images.dart';
import 'package:check_flutter/modules/progress_hud_loading_handler.dart';
import 'package:check_flutter/modules/user_handler.dart';
import 'package:check_flutter/show_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:check_flutter/my_app.dart';
import 'package:provider/provider.dart';
import 'package:check_flutter/themes.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'modules/customer_services/accounts/signin/log_in.dart';
import 'modules/customer_services/accounts/signup/sign_up.dart';
import 'modules/user_model.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Directory documentsDirectory= await getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path); 
  Hive.registerAdapter(UserSignUpModelAdapter());
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CustomTheme>(create: (BuildContext context)=>CustomTheme()),
      ChangeNotifierProvider<SelectDate>(create: (BuildContext context)=>SelectDate()),
      ChangeNotifierProvider<FieldController>(create: (BuildContext context)=>FieldController()),
      ChangeNotifierProvider<UserHandler>(create: (BuildContext context)=>UserHandler()),
      ChangeNotifierProvider<ProgressHudHandler>(create: (BuildContext context)=>ProgressHudHandler()),
      ChangeNotifierProvider<SignInUser>(create: (BuildContext context)=>SignInUser()),
      ChangeNotifierProvider<TimePicker>(create: (BuildContext context)=>TimePicker()),
      ChangeNotifierProvider<OrganizationUpload>(create: (BuildContext context)=>OrganizationUpload()),
      ChangeNotifierProvider<PickingImages>(create: (BuildContext context)=>PickingImages()),
      ChangeNotifierProvider<OrganizationApi>(create: (BuildContext context)=>OrganizationApi()),
      ChangeNotifierProvider<SubmittOrganizationLogo>(create: (BuildContext context)=>SubmittOrganizationLogo()),
      ChangeNotifierProvider<SingUpUser>(create: (BuildContext context)=>SingUpUser()),
      ChangeNotifierProvider<Validator>(create: (BuildContext context)=>Validator()),
    ],
      child: MyApp(),
  ),
  );

}




