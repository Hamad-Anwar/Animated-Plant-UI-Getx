import 'package:get/get.dart';

class HomeState extends GetxController{
  RxInt temp=0.obs;
  RxInt temp1=0.obs;
  RxInt x=0.obs;
  RxInt y=0.obs;
  RxBool anim = false.obs;

  setTemp(int val){
    temp.value=val;
  }

  setTemp1(int val){
    temp1.value=val;
  }

  setX(int val){
    x.value=val;
  }
  setY(int val){
    y.value=val;
  }

  setAnim(bool val){
    anim.value=val;
  }



}