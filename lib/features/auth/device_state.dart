import 'package:isar/isar.dart';
part 'device_state.g.dart';

@collection
class DeviceState {
  Id deviceID = Isar.autoIncrement;
  bool? voted;
}
