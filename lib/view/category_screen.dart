import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_shop/bloc/catrgory/category_bloc.dart';
import 'package:royal_shop/bloc/catrgory/category_state.dart';
import 'package:royal_shop/bloc/catrgory/catrgory_event.dart';
import 'package:royal_shop/constants/colors.dart';
import 'package:royal_shop/data/model/category.dart';
import 'package:royal_shop/widgets/cashed_image.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(CategoryRequestList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
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
                      const Expanded(
                        child: Text(
                          'دسته بندی',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'sb',
                            color: CustomColors.blue,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 38.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoadingState) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is CategoryResponseState) {
                  return state.response.fold((l) {
                    return SliverToBoxAdapter(
                      child: Center(child: Text(l)),
                    );
                  }, (r) {
                    return _ListCategory(list: r);
                  });
                }
                return const SliverToBoxAdapter(
                  child: Text('error'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ListCategory extends StatelessWidget {
  List<Category>? list;
  _ListCategory({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 44,
      ),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          childCount: list?.length ?? 0,
          (context, index) {
            return CashedImage(imageUrl: list?[index].thumbnail);
          },
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
