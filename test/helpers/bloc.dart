import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:bloc_presentation_test/bloc_presentation_test.dart' as bpt;
import 'package:bloc_test/bloc_test.dart' as bt;
import 'package:mocktail/mocktail.dart';

abstract class MockBloc<E, S> extends bt.MockBloc<E, S> {
  MockBloc({
    required S initialState,
    Stream<S> stream = const Stream.empty(),
  }) {
    bt.whenListen<S>(this, stream, initialState: initialState);
  }
}

class MockPresentationBloc<E, S, P> extends MockBloc<E, S>
    implements BlocPresentationMixin<S, P> {
  MockPresentationBloc({
    required super.initialState,
    super.stream,
    List<P>? initialEvents,
  }) {
    bpt.whenListenPresentation<P>(this, initialEvents: initialEvents);
    when(close).thenAnswer((_) => Future<void>.value());
  }
}

abstract class MockCubit<S> extends bt.MockCubit<S> {
  MockCubit({
    required S initialState,
    Stream<S> stream = const Stream.empty(),
  }) {
    bt.whenListen<S>(this, stream, initialState: initialState);
  }
}

class MockPresentationCubit<S, P> extends MockCubit<S>
    implements BlocPresentationMixin<S, P> {
  MockPresentationCubit({
    required super.initialState,
    super.stream,
    List<P>? initialEvents,
  }) {
    bpt.whenListenPresentation<P>(this, initialEvents: initialEvents);
    when(close).thenAnswer((_) => Future<void>.value());
  }
}
