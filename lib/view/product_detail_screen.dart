import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_shop/bloc/product_detil/product_bloc.dart';
import 'package:royal_shop/bloc/product_detil/product_event.dart';
import 'package:royal_shop/bloc/product_detil/product_state.dart';
import 'package:royal_shop/data/model/product.dart';
import 'package:royal_shop/data/model/product_image.dart';
import 'package:royal_shop/data/model/product_variant.dart';
import 'package:royal_shop/data/model/variant.dart';
import 'package:royal_shop/data/model/variant_type.dart';
import 'package:royal_shop/data/repository/product_detail_repository.dart';
import 'package:royal_shop/di/di.dart';
import 'package:royal_shop/widgets/cashed_image.dart';

import '../constants/colors.dart';

class ProductDetailScreen extends StatefulWidget {
  Product product;
  ProductDetailScreen(this.product, {super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context)
        .add(ProductRequestData(widget.product.id, widget.product.categoryId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return SafeArea(
            child: CustomScrollView(
              slivers: [
                if (state is ProductDetailLoadingState) ...{
                  const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                },
                if (state is ProductDetailResponseState) ...{
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 44.0, left: 44.0, bottom: 32.0, top: 5.0),
                      child: Container(
                        height: 56.0,
                        decoration: BoxDecoration(
                          color: CustomColors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 16.0,
                            ),
                            Image.asset('assets/images/icon_apple_blue.png'),
                            const Spacer(),
                            state.productCategory.fold((l) {
                              return const Text(
                                'دسته بندی',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'sb',
                                    fontSize: 16,
                                    color: CustomColors.blue),
                              );
                            }, (productCategory) {
                              return Text(
                                productCategory.title!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: 'sb',
                                    fontSize: 16,
                                    color: CustomColors.blue),
                              );
                            }),
                            const Spacer(),
                            Image.asset('assets/images/icon_back.png'),
                            const SizedBox(
                              width: 16.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                },
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      widget.product.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'sb',
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                if (state is ProductDetailResponseState) ...{
                  state.productImages.fold((error) {
                    return SliverToBoxAdapter(
                      child: Text(error),
                    );
                  }, (productimages) {
                    return GalleryWidget(
                        widget.product.thumbnail, productimages);
                  }),
                },
                if (state is ProductDetailResponseState) ...{
                  state.productVariant.fold((error) {
                    return SliverToBoxAdapter(
                      child: Text(error),
                    );
                  }, (productVariantList) {
                    return VariantContainerGenerator(productVariantList);
                  })
                },
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 44.0, right: 44.0),
                    child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          width: 1,
                          color: CustomColors.gery,
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset('assets/images/icon_left_categroy.png'),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'مشاهده',
                            style: TextStyle(
                                fontFamily: 'sm',
                                fontSize: 12,
                                color: CustomColors.blue),
                          ),
                          const Spacer(),
                          const Text(
                            ': مشخصات فنی',
                            style: TextStyle(
                              fontFamily: 'sb',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 44.0, right: 44.0),
                    child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          width: 1,
                          color: CustomColors.gery,
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset('assets/images/icon_left_categroy.png'),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'مشاهده',
                            style: TextStyle(
                                fontFamily: 'sm',
                                fontSize: 12,
                                color: CustomColors.blue),
                          ),
                          const Spacer(),
                          const Text(
                            ': توضیحات محصول',
                            style: TextStyle(
                              fontFamily: 'sb',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 44.0, right: 44.0),
                    child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          width: 1,
                          color: CustomColors.gery,
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset('assets/images/icon_left_categroy.png'),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'مشاهده',
                            style: TextStyle(
                                fontFamily: 'sm',
                                fontSize: 12,
                                color: CustomColors.blue),
                          ),
                          const Spacer(),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10.0),
                                width: 26.0,
                                height: 26.0,
                                decoration: BoxDecoration(
                                  color: CustomColors.red,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              Positioned(
                                right: 15.0,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10.0),
                                  width: 26.0,
                                  height: 26.0,
                                  decoration: BoxDecoration(
                                    color: CustomColors.green,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 30.0,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10.0),
                                  width: 26.0,
                                  height: 26.0,
                                  decoration: BoxDecoration(
                                    color: CustomColors.blue,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 45.0,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10.0),
                                  width: 26.0,
                                  height: 26.0,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 60.0,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10.0),
                                  width: 26.0,
                                  height: 26.0,
                                  decoration: BoxDecoration(
                                    color: CustomColors.gery,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '+10',
                                      style: TextStyle(
                                        color: CustomColors.white,
                                        fontFamily: 'sb',
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            ': نظرات کاربران',
                            style: TextStyle(
                              fontFamily: 'sb',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AddToBasketButton(),
                        SizedBox(
                          width: 5.0,
                        ),
                        PriceTagButton(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class VariantContainerGenerator extends StatelessWidget {
  List<ProductVariant> productVariantList;
  VariantContainerGenerator(
    this.productVariantList, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (var productVariant in productVariantList) ...{
            if (productVariant.variantList.isNotEmpty) ...{
              VariantGeneratorChild(productVariant)
            }
          },
        ],
      ),
    );
  }
}

class GalleryWidget extends StatefulWidget {
  int selectedItem = 0;
  String? defultProductThumbnail;
  List<ProductImage> productImageList;
  GalleryWidget(
    this.defultProductThumbnail,
    this.productImageList, {
    super.key,
  });

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44.0),
        child: Container(
          height: 284,
          decoration: BoxDecoration(
            color: CustomColors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 14.0, right: 14.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/icon_star.png'),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 2.0, left: 3.0),
                            child: Text(
                              '4.8',
                              style: TextStyle(
                                fontFamily: 'sb',
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 200.0,
                        width: 200.0,
                        child: CashedImage(
                          imageUrl: (widget.productImageList.isEmpty)
                              ? widget.defultProductThumbnail
                              : widget.productImageList[widget.selectedItem]
                                  .imageUrl,
                        ),
                      ),
                      const Spacer(),
                      Image.asset('assets/images/icon_favorite_deactive.png'),
                    ],
                  ),
                ),
              ),
              if (widget.productImageList.isNotEmpty) ...{
                SizedBox(
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 44.0, right: 44.0, top: 4.0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.productImageList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.selectedItem = index;
                            });
                          },
                          child: Container(
                            width: 70.0,
                            height: 70.0,
                            margin: const EdgeInsets.only(left: 20.0),
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  width: 1, color: CustomColors.gery),
                            ),
                            child: CashedImage(
                              imageUrl: widget.productImageList[index].imageUrl,
                              radius: 10,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              }
            ],
          ),
        ),
      ),
    );
  }
}

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 140,
          height: 60,
          decoration: BoxDecoration(
            color: CustomColors.green,
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              width: 160,
              height: 53,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    const Text(
                      'تومان',
                      style: TextStyle(
                        color: CustomColors.white,
                        fontFamily: 'sm',
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '49،000،000',
                          style: TextStyle(
                            color: CustomColors.white,
                            fontFamily: 'sm',
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        Text(
                          '48،888،888',
                          style: TextStyle(
                            color: CustomColors.white,
                            fontFamily: 'sm',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      child: Container(
                        decoration: BoxDecoration(
                          color: CustomColors.red,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 6.0),
                          child: Text(
                            '%3',
                            style: TextStyle(
                              fontFamily: 'sb',
                              fontSize: 12,
                              color: CustomColors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PriceTagButton extends StatelessWidget {
  const PriceTagButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 140,
          height: 60,
          decoration: BoxDecoration(
            color: CustomColors.blue,
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              width: 160,
              height: 53,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Center(
                child: Text(
                  'افزودن به سبد خرید',
                  style: TextStyle(
                    color: CustomColors.white,
                    fontFamily: 'sb',
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ColorVariantList extends StatefulWidget {
  List<Varinat> colorVarinatList;
  ColorVariantList(this.colorVarinatList, {super.key});

  @override
  State<ColorVariantList> createState() => _ColorVariantListState();
}

class _ColorVariantListState extends State<ColorVariantList> {
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 30.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.colorVarinatList.length,
          itemBuilder: (context, index) {
            String productColor = 'ff${widget.colorVarinatList[index].value}';
            int hexColor = int.parse(productColor, radix: 16);
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedColor = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10.0),
                padding: const EdgeInsets.all(1.0),
                width: 30.0,
                height: 30.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: (selectedColor == index) ? 2 : 2,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: (selectedColor == index)
                        ? CustomColors.blueIndicator
                        : CustomColors.white,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color(hexColor),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class StorageVariantList extends StatefulWidget {
  List<Varinat> storageVariants;
  StorageVariantList(this.storageVariants, {super.key});

  @override
  State<StorageVariantList> createState() => _StorageVariantListState();
}

class _StorageVariantListState extends State<StorageVariantList> {
  int selectedStorage = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 26.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.storageVariants.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedStorage = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10.0),
                height: 25.0,
                decoration: BoxDecoration(
                  color: CustomColors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    width: (selectedStorage == index) ? 2 : 1,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: (selectedStorage == index)
                        ? CustomColors.blueIndicator
                        : CustomColors.gery,
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      widget.storageVariants[index].name!,
                      style: const TextStyle(
                        fontFamily: 'sb',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class VariantGeneratorChild extends StatelessWidget {
  ProductVariant productVariant;
  VariantGeneratorChild(this.productVariant, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 44.0, left: 44.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            productVariant.variantType.title!,
            style: const TextStyle(fontFamily: 'sm', fontSize: 12.0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          if (productVariant.variantType.type == VariantTypeEnum.color) ...{
            ColorVariantList(productVariant.variantList)
          },
          if (productVariant.variantType.type == VariantTypeEnum.storage) ...{
            StorageVariantList(productVariant.variantList)
          },
        ],
      ),
    );
  }
}
