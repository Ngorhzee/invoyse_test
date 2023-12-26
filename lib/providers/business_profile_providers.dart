import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoyse_test/constants/asset.dart';
import 'package:invoyse_test/models/busines_model.dart';

class BusinessProfileProvider with ChangeNotifier {
  bool buttonEnabled = false;
  TextEditingController businessName = TextEditingController();
  TextEditingController businessaddress = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController businessLogo = TextEditingController();
  TextEditingController businessCategory = TextEditingController();
  TextEditingController businessValue = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  XFile? image;
  BusinessModel activeProfile = BusinessModel(
    businessName: "James & sons",
    businessAddress: "No. 2 Ikeja Street, off Allen Avenue....",
  );

  List<BusinessModel> businessProfileList = [
    BusinessModel(
      businessName: "James & sons",
      businessAddress: "No. 2 Ikeja Street, off Allen Avenue....",
    ),
    BusinessModel(
        businessName: "James & sons",
        businessAddress: "No. 7 Victoria island, off Ikoyi....",
        image: AppAssets.dp),
  ];

  setActiveProfile(BusinessModel businessProfile) {
    activeProfile = businessProfile;
    notifyListeners();
  }

  String getshortForm(String text) {
    List<String> textList = text.split(" ");
    if (textList.length > 1) {
      String firstLetter = textList[0].split("")[0];
      String secondLetter = textList.last.split("")[0];
      return firstLetter.toUpperCase() + secondLetter.toUpperCase();
    } else {
      return textList[0].substring(0, 2).toUpperCase();
    }
  }

  addBusinessProfile() {
    BusinessModel businessProfile = BusinessModel(
        businessName: businessName.text,
        businessAddress: businessaddress.text,
        image: image != null ? image!.path : null);
    if (businessProfileList.contains(businessProfile)) {
      activeProfile = businessProfile;
      notifyListeners();
      return;
    } else {
      businessProfileList.add(businessProfile);
      activeProfile = businessProfile;
      businessName.clear();
      businessaddress.clear();
      businessLogo.clear();
      businessCategory.clear();
      businessValue.clear();
      email.clear();
      phoneNumber.clear();
      image = null;
      notifyListeners();
    }
  }

  addBusinessLogo() async {
    image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    businessLogo.text = image!.name;
    notifyListeners();
  }

  checkFirstPage() {
    if (businessName.text.isNotEmpty && businessaddress.text.isNotEmpty) {
      buttonEnabled = true;
      notifyListeners();
    }
  }
}
