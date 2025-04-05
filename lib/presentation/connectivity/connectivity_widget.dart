import 'package:feelcast/presentation/connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityWidget extends StatefulWidget {
  const ConnectivityWidget({super.key});

  @override
  State<ConnectivityWidget> createState() => _ConnectivityWidgetState();
}

class _ConnectivityWidgetState extends State<ConnectivityWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectivityCubit, ConnectivityState>(
      listenWhen: (prev, curr) {
        if (prev is ConnectivityInitial) return false;
        return true;
      },
      listener: (context, state) {
        if (state is ConnectivityDisconnected) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('인터넷 연결이 끊겼지만 앱은 계속 작동합니다.'),
              duration: Duration(seconds: 1),
            ),
          );
        }
        if (state is ConnectivityConnected) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('인터넷 연결이 복구되었습니다.'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },

      builder: (context, state) {
        if (state is ConnectivityDisconnected) {
          return Icon(Icons.wifi_off_outlined);
        }

        return SizedBox.shrink();
      },
    );
  }
}
