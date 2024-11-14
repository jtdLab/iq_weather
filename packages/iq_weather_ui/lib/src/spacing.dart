import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart' as gap;

extension SpacingBuildContextX on BuildContext {
  double get xs => 4;

  double get s => 8;

  double get m => 12;

  double get l => 16;

  double get xl => 32;

  double get xxl => 56;
}

abstract class Gap extends StatelessWidget {
  const factory Gap(double mainAxisExtent, {Key? key}) = _Gap;

  const factory Gap.xs({Key? key}) = _GapXS;

  const factory Gap.s({Key? key}) = _GapS;

  const factory Gap.m({Key key}) = _GapM;

  const factory Gap.l({Key key}) = _GapL;

  const factory Gap.xl({Key key}) = _GapXL;

  const factory Gap.xxl({Key key}) = _GapXXL;

  const Gap._({super.key});
}

class _Gap extends Gap {
  const _Gap(this.mainAxisExtent, {super.key}) : super._();

  final double mainAxisExtent;

  @override
  Widget build(BuildContext context) {
    return gap.Gap(mainAxisExtent);
  }
}

class _GapXS extends Gap {
  const _GapXS({super.key}) : super._();

  @override
  Widget build(BuildContext context) {
    return gap.Gap(context.xs);
  }
}

class _GapS extends Gap {
  const _GapS({super.key}) : super._();

  @override
  Widget build(BuildContext context) {
    return gap.Gap(context.s);
  }
}

class _GapM extends Gap {
  const _GapM({super.key}) : super._();

  @override
  Widget build(BuildContext context) {
    return gap.Gap(context.m);
  }
}

class _GapL extends Gap {
  const _GapL({super.key}) : super._();

  @override
  Widget build(BuildContext context) {
    return gap.Gap(context.l);
  }
}

class _GapXL extends Gap {
  const _GapXL({super.key}) : super._();

  @override
  Widget build(BuildContext context) {
    return gap.Gap(context.xl);
  }
}

class _GapXXL extends Gap {
  const _GapXXL({super.key}) : super._();

  @override
  Widget build(BuildContext context) {
    return gap.Gap(context.xxl);
  }
}
