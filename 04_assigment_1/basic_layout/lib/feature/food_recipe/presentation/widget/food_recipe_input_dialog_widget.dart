import 'package:basic_layout/feature/food_recipe/domain/recipe_entity.dart';
import 'package:flutter/material.dart';

Future<RecipeEntity?> showRecipeInputDialog(BuildContext context) async {
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();
  TextEditingController imgCtrl = TextEditingController();
  TextEditingController ingredientsCtrl = TextEditingController();

  return showDialog<RecipeEntity>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("새 레시피 추가"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleCtrl,
                decoration: const InputDecoration(labelText: "제목"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: descCtrl,
                decoration: const InputDecoration(labelText: "설명"),
              ),
              TextFormField(
                controller: imgCtrl,
                decoration: const InputDecoration(labelText: "이미지 URL (옵션)"),
              ),
              TextFormField(
                controller: ingredientsCtrl,
                decoration: const InputDecoration(
                  labelText: "재료 (쉼표로 구분)",
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("취소"),
          ),
          TextButton(
            onPressed: () {
              final ingredients = ingredientsCtrl.text
                  .split(',')
                  .map((e) => e.trim())
                  .toList();

              Navigator.pop(
                context,
                RecipeEntity(
                  title: titleCtrl.text,
                  description: descCtrl.text,
                  imageUrl:
                      'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZCUyMHJlc3RhdXJhbnR8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
                  ingredients: ingredients,
                ),
              );
            },
            child: const Text("추가"),
          ),
        ],
      );
    },
  );
}
