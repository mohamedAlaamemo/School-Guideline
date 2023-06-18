import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trypro/core/network/local/cache_helper.dart';

import '../../../core/constant.dart';
import '../../../core/model/add_new_user_model.dart';
import '../../core/cubit/layout_cubit.dart';



class ChatRomePage extends StatelessWidget {
  AddNewUserModel? model;
  String receiverId;
  ChatRomePage({this.model,required this.receiverId});

  TextEditingController messageSendController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      LayoutCubit.get(context).getMessageInChat(
          senderId: CacheHelper.getData(key: 'uId'),
          receiverId: receiverId);
      return BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor:color1,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              titleSpacing: 0.0,
              title: Row(
                children: [

                  const SizedBox(
                    width: 5,
                  ),
                  Text('${model?.name}'),
                ],
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 20,),
                Expanded(
                  child: ListView.separated(
                      //reverse: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (cubit.messageInChat[index].senderId ==
                            CacheHelper.getData(key: 'uId')) {
                          return MyMessage(
                              mess: cubit.messageInChat[index].textMessage);
                        }
                        return SenderMessage(
                            mess: cubit.messageInChat[index].textMessage);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 5,
                          ),
                      itemCount: cubit.messageInChat.length),
                ),
                const SizedBox(height: 10,),
                Container(
                  margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onChanged: (value) {
                            cubit.emitState();
                          },
                          controller: messageSendController,
                          maxLines: 2,
                          minLines: 1,
                          decoration: const InputDecoration(
                              hintText: 'write your message',
                              border: InputBorder.none),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            cubit.sendMessage(
                                senderId:CacheHelper.getData(key: 'uId'),
                                receiverId: receiverId,
                                date: DateTime.now().toString(),
                                textMessage: messageSendController.text);
                            messageSendController.text = "";
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Color(0xff073D97)
                          )),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  Widget MyMessage({required String? mess}) {
    return Align(
      alignment: AlignmentDirectional.bottomEnd,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(left: 80.0, right: 16.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: Colors.blueAccent[200]
        ),
        child: Text(
          '$mess',
          style: TextStyle(
            fontSize: 20
          ),
        ),
      ),
    );
  }

  Widget SenderMessage({required String? mess}) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(left: 16.0, right: 80.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: Colors.grey[300]),
        child: Text(
          '$mess',
          style: const TextStyle(
              fontSize: 20
          ),
        ),
      ),
    );
  }
}
