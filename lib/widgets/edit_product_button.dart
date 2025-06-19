import 'package:ecommerce_app/pages/edit_product_page.dart';
import 'package:flutter/material.dart';

class EditProductButton extends StatelessWidget {
  const EditProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.03,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return EditProductPage();
              },
            ),
          );
        },
        child: Text('Edit Product'),
      ),
    );
  }
}
