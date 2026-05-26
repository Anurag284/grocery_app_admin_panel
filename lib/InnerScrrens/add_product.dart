import 'dart:io';
import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_dotted_border/flutter_dotted_border.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app_admin_panel/Services/utils.dart';
import 'package:grocery_app_admin_panel/controller/menu_contoller.dart';
import 'package:grocery_app_admin_panel/responsive.dart';
import 'package:grocery_app_admin_panel/widgets/button.dart';
import 'package:grocery_app_admin_panel/widgets/header.dart';
import 'package:grocery_app_admin_panel/widgets/side_menu.dart';
import 'package:grocery_app_admin_panel/widgets/text_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UploadProductForm extends StatefulWidget {
  static const routeName = '/UploadProductForm';
  const UploadProductForm({super.key});

  @override
  State<UploadProductForm> createState() => _UploadProductFormState();
}

class _UploadProductFormState extends State<UploadProductForm> {
  final _formKey = GlobalKey<FormState>();
  String catValue = 'Vegetables';
  late final TextEditingController titleController, priceController;
  int groupValue = 1;
  bool isPiece = false;
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);
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
                    title: "Add Product",
                    fct: () {
                      context.read<MenuContoller>().controlAddProductMenu();
                    },
                    showTextField: true,
                  ),
                  Container(
                    width: size.width > 850 ? 400 : size.width,
                    // color: Theme.of(context).cardColor,
                    color: Colors.yellow,
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          TextWidget(
                            title: 'Product title',
                            color: color,
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
                                        textSize: 12,
                                        isTitle: true,
                                      ),
                                      SizedBox(height: 10),
                                      SizedBox(
                                        // height: 30,
                                        width: 100,
                                        child: TextFormField(
                                          controller: priceController,
                                          key: ValueKey('Price in \$*'),
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'price is missed';
                                            }
                                            return null;
                                          },
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.allow(
                                              RegExp(r'[0-9.]'),
                                            ),
                                          ],
                                          decoration: inputDecoration,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      TextWidget(
                                        title: 'Product Category',
                                        color: color,

                                        isTitle: true,
                                      ),
                                      SizedBox(height: 10),
                                      dropDownCategory(),
                                      SizedBox(height: 20),
                                      TextWidget(
                                        title: 'Measure Unit',
                                        color: color,
                                        isTitle: true,
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          TextWidget(title: 'KG', color: color),
                                          Radio(
                                            value: 1,
                                            groupValue: groupValue,
                                            onChanged: (value) {
                                              setState(() {
                                                groupValue = 1;
                                                isPiece = false;
                                              });
                                            },
                                            activeColor: Colors.green,
                                          ),
                                          TextWidget(
                                            title: 'Piece',
                                            color: color,
                                          ),
                                          Radio(
                                            value: 2,
                                            groupValue: groupValue,
                                            onChanged: (value) {
                                              setState(() {
                                                groupValue = 2;
                                                isPiece = true;
                                              });
                                            },
                                            activeColor: Colors.green,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              //Image to be picked
                              Expanded(
                                flex: 4,
                                child: Container(
                                  height:
                                      size.width > 850
                                          ? 350
                                          : size.width * 0.45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color:
                                        Theme.of(
                                          context,
                                        ).scaffoldBackgroundColor,
                                  ),
                                  child:
                                      _pickedImage == null
                                          ? dottedBorder(color: color)
                                          : kIsWeb
                                          ? Image.memory(
                                            webImage,
                                            fit: BoxFit.fill,
                                          )
                                          : Image.file(
                                            _pickedImage!,
                                            fit: BoxFit.fill,
                                          ),
                                ),
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
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: TextWidget(
                                          title: 'Update Image',
                                          color: Colors.blue,
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

  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        print('No image has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a');
        });
      } else {
        print('No image has been picked');
      }
    } else {
      print('Something went wrong');
    }
  }

  Widget dottedBorder({required Color color}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          dashPattern: [6, 7],
          color: color,
          radius: Radius.circular(12),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.image_outlined, color: color, size: 50),
              TextButton(
                onPressed: () {
                  _pickImage();
                },
                child: TextWidget(title: 'Choose an image', color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dropDownCategory() {
    final color = Utils(context).color;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 12,
              color: color,
            ),
            // menuWidth: 100,
            value: catValue,
            onChanged: (value) {
              setState(() {
                catValue = value!;
              });
              print(value);
            },
            items: [
              DropdownMenuItem(value: 'Vegetables', child: Text('Vegetables')),
              DropdownMenuItem(value: 'Fruits', child: Text('Fruits')),
              DropdownMenuItem(value: 'Grains', child: Text('Grains')),
              DropdownMenuItem(value: 'Nuts', child: Text('Nuts')),
              DropdownMenuItem(value: 'Herbs', child: Text('Herbs')),
              DropdownMenuItem(value: 'Spices', child: Text('Spices')),
            ],
            hint: Text('Select Category'),
          ),
        ),
      ),
    );
  }
}
