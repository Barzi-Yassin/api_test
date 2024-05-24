# api_test

An API integrated Flutter project.
<br>
<br>

## Concept

Showing products either from local or fetching from API.

### Credit
Fake API: 'https://dummyjson.com/products'
<br>
<br>

## lib folder-file-tree
<pre>
lib:
│   main.dart
│   
└───src
    │   app.dart
    │   
    └───features
        └───products
            ├───data
            │       product_pack_data.dart       
            │       product_pack_data_2.dart     
            │       
            ├───models
            │   │   product_secondary_models.dart
            │   │
            │   ├───product
            │   │   │   product_model.dart
            │   │   │
            │   │   └───secondary
            │   │           dimensions_model.dart
            │   │           meta_model.dart
            │   │           review_model.dart
            │   │
            │   └───product_pack
            │           product_pack_model.dart
            │
            ├───presentation
            │   ├───screens
            │   │       detail_screen.dart
            │   │       products_screen.dart
            │   │
            │   └───widgets
            │           catched_net_img_widget.dart
            │
            └───services
                ├───local
                │       product_service_local.dart
                │
                └───remote
                        product_service_remote.dart
</pre>

<br>

## GIF 

![api_test](https://github.com/Barzi-Yassin/api_test/assets/87943836/b006a562-ebff-4a45-8156-7b64a413337a)


<br>
<br>

# Developer
 
Linkedin [Barzi](https://www.linkedin.com/in/barzi-yassin-karim/),
Email  <a href="mailto:barziyassin@gmail.com" style="text-decoration: none;">``barziyassin@gmail.com``</a>

<br>

## Getting Started

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
