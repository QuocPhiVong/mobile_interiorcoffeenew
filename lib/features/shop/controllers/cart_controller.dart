import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interior_coffee/common/widgets/dialog/loading_dialog.dart';
import 'package:interior_coffee/data/response/products_response.dart';
import 'package:interior_coffee/features/authentication/controllers/auth_controller.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var itemList = <Map<String, dynamic>>[].obs;

  RxList<CartItem> products = RxList.empty();

  RxInt totalPrice = 0.obs;

  RxInt count = 0.obs;

  Future<void> getAllByEmail(String email, {bool isShowLoading = true}) async {
    try {
      if (isShowLoading) showLoading();
      final QuerySnapshot querySnapshot = await _firestore
          .collection('carts')
          .where('email', isEqualTo: email)
          .where('quantity', isGreaterThan: 0)
          .get();

      itemList.value = querySnapshot.docs.map((doc) => {'id': doc.id, ...doc.data() as Map<String, dynamic>}).toList();

      products.value = itemList.map((item) => CartItem.fromJson(item)).toList();

      count.value = products.length;
      totalPrice.value = products.fold(
          0, (previousValue, element) => previousValue + (element.quantity ?? 0) * element.object!.sellingPrice!);
    } catch (e) {
      print('Error fetching data: $e');
    }
    if (isShowLoading) hideLoading();
  }

  Future<void> insertData(Product object, int quantity, String email) async {
    try {
      final index = products.indexWhere((element) => element.object!.id == object.id);
      if (index != -1) {
        final docId = products[index].id;
        final newQuantity = (products[index].quantity ?? 0) + quantity;
        await updateData(docId!, newQuantity);
        return;
      } else {
        await _firestore.collection('carts').add({
          'object': object.toJson(),
          'quantity': quantity,
          'email': email,
          'timestamp': DateTime.now().millisecondsSinceEpoch,
        });
      }

      await getAllByEmail(email, isShowLoading: false);
      Get.snackbar('Success', 'Data inserted successfully');

      totalPrice.value = products.fold(
          0, (previousValue, element) => previousValue + (element.quantity ?? 0) * element.object!.sellingPrice!);
    } catch (e) {
      print('Error inserting data: $e');
      Get.snackbar('Error', 'Failed to insert data');
    }
  }

  Future<void> updateData(String docId, int quantity) async {
    try {
      if (quantity == 0) {
        await _firestore.collection('carts').doc(docId).delete();
      } else {
        await _firestore.collection('carts').doc(docId).update({
          'quantity': quantity,
          'timestamp': DateTime.now().millisecondsSinceEpoch,
        });
      }
      await getAllByEmail(AuthController.instance.userData.value.email ?? '', isShowLoading: false);
      Get.snackbar('Success', 'Data updated successfully');
    } catch (e) {
      print('Error updating data: $e');
      Get.snackbar('Error', 'Failed to update data');
    }
  }

  Future<void> clearCart(String email) async {
    try {
      final querySnapshot = await _firestore.collection('carts').where('email', isEqualTo: email).get();
      for (final doc in querySnapshot.docs) {
        await doc.reference.delete();
      }
      await getAllByEmail(email, isShowLoading: false);
      Get.snackbar('Success', 'Cart cleared successfully');
    } catch (e) {
      print('Error clearing cart: $e');
      Get.snackbar('Error', 'Failed to clear cart');
    }
  }
}
