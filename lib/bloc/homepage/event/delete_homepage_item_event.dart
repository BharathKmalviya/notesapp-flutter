import 'package:notes/bloc/homepage/event/homepage_event.dart';

class DeleteHomepageItemEvent implements HomepageEvent {
  final String item;

    DeleteHomepageItemEvent(this.item);
}
