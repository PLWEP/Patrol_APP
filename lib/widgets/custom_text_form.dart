import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String? title;
  final TextEditingController controller;

  const CustomTextForm({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "",
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Silahkan isi pertanyaan",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  16,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
