import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app_admin_panel/Services/utils.dart';
import 'package:grocery_app_admin_panel/controller/menu_contoller.dart';
import 'package:grocery_app_admin_panel/responsive.dart';
import 'package:grocery_app_admin_panel/widgets/button.dart';
import 'package:grocery_app_admin_panel/widgets/header.dart';
import 'package:grocery_app_admin_panel/widgets/side_menu.dart';
import 'package:grocery_app_admin_panel/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class UploadProductForm extends StatefulWidget {
  static const routeName = '/UploadProductForm';
  const UploadProductForm({super.key});

  @override
  State<UploadProductForm> createState() => _UploadProductFormState();
}

class _UploadProductFormState extends State<UploadProductForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController titleController, priceController;

  @override
  void initState() {
    priceController = TextEditingController();
    titleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    priceController.dispose();
    titleController.dispose();
    super.dispose();
  }

  void uploadForm() async {
    final isValid = _formKey.currentState!.validate();
  }

  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final color = Utils(context).color;
    final _scaffoldColor = Theme.of(context).scaffoldBackgroundColor;
    Size size = Utils(context).screenSize;

    var inputDecoration = InputDecoration(
      filled: true,
      fillColor: _scaffoldColor,
      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 1.0),
      ),
    );
    return Scaffold(
      key: context.read<MenuContoller>().getAddProductScaffoldKey,
      drawer: SideMenu(),
      body: Row(
        children: [
          if (Responsive.isDesktop(context)) Expanded(child: SideMenu()),
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Header(
                    fct: () {
                      context.read<MenuContoller>().controlAddProductMenu();
                    },
                  ),
                  Container(
                    width: size.width > 650 ? 450 : size.width,
                    color: Theme.of(context).cardColor,
                    // color: Colors.yellow,
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextWidget(
                            title: 'Product title',
                            color: color,
                            textSize: 18,
                            isTitle: true,
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: titleController,
                            key: ValueKey('Title'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a product title';
                              }
                              return null;
                            },
                            decoration: inputDecoration,
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: FittedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        title: 'Price in \$',
                                        color: color,
                                        textSize: 16,
                                        isTitle: true,
                                      ),
                                      SizedBox(height: 10),
                                      SizedBox(
                                        width: 100,
                                        child: TextFormField(
                                          controller: priceController,
                                          key: ValueKey('Price \&'),
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'price is missed';
                                            }
                                            return null;
                                          },
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.allow(
                                              RegExp(
                                                r'^[0-9]+(\.[0-9]{0,2})?$',
                                              ),
                                            ),
                                          ],
                                          decoration: inputDecoration,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      TextWidget(
                                        title: 'Product Category',
                                        color: color,
                                        textSize: 16,
                                        isTitle: true,
                                      ),
                                      SizedBox(height: 10),
                                      //Drop down menu
                                      SizedBox(height: 20),
                                      TextWidget(
                                        title: 'Measure Unit',
                                        color: color,
                                        textSize: 16,
                                        isTitle: true,
                                      ),
                                      SizedBox(height: 10),
                                      //Radio button
                                    ],
                                  ),
                                ),
                              ),
                              //Image to be picked
                              Expanded(
                                flex: 1,
                                child: Container(color: Colors.red),
                              ),
                              Expanded(
                                flex: 1,
                                child: FittedBox(
                                  child: Column(
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        child: TextWidget(
                                          title: 'Clear',
                                          color: Colors.red,
                                          textSize: 14,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: TextWidget(
                                          title: 'Update Image',
                                          color: Colors.blue,
                                          textSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ButtonWidget(
                                  onPressed: () {},
                                  text: 'Clear Form',
                                  icon: IconlyBold.danger,
                                  backgroundColor: Colors.red.shade300,
                                ),
                                ButtonWidget(
                                  onPressed: () {},
                                  text: 'Update Product',
                                  icon: IconlyBold.upload,
                                  backgroundColor: Colors.blue,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
