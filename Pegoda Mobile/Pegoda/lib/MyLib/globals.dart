library Pegoda.globals;
import 'dart:io';

import 'package:pegoda/MyLib/class/pet.dart';

bool isAvatarChecked = false;
File avatarFile = File('');
bool isPetAvatarChecked = false;
File petAvatarFile = File('');
List<Pet> petList = [
  Pet(PetID: "Pet1", PetName: "Con gà", PetType: "Chó pug", PetGender: true, PetStatus: "Mập", PetImage: "https://i.pinimg.com/originals/23/59/7e/23597eae81350a4705644c58bdad7f6b.jpg"),
  Pet(PetID: "Pet2", PetName: "Con vịt", PetType: "Mèo", PetGender: false, PetStatus: "Mập", PetImage: "https://i.pinimg.com/564x/7b/a1/b6/7ba1b6556719b4b358e3b86e6c24b30f.jpg"),
];