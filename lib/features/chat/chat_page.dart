import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constant.dart';
import '../../core/cubit/layout_cubit.dart';

class ChatPage extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=LayoutCubit.get(context);
        return Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        // Use a Material design search bar
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            // Add a clear button to the search bar
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () => searchController.clear(),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          // Perform the search here
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => listOfAdmin(context: context ,id: cubit.allAdminListId[index],model: cubit.allAdminList[index]),
                      separatorBuilder: (context, index) =>
                      const SizedBox(
                        height: 5,
                      ),
                      itemCount: cubit.allAdminList.length
                  ),
                ),
              ],
            )
        );
      },
    );
  }
}
