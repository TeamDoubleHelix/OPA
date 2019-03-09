import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';

class PageDragger extends StatefulWidget {
  final StreamController<SlideUpdate> slideUpdateSteam;

  final bool canDragRightToLeft, canDragLeftToRight;

  PageDragger(
      this.slideUpdateSteam, this.canDragLeftToRight, this.canDragRightToLeft);

  @override
  _PageDraggerState createState() => _PageDraggerState();
}

class _PageDraggerState extends State<PageDragger> {
  static const double FULL_PAGE_DRAG = 300.0;

  Offset dragStart;
  SlideDirection direction;
  double slidePercent = 0.0;

  onDragStart(DragStartDetails details) {
    dragStart = details.globalPosition;
    slidePercent = 0.0;
    //print("started dragging");
  }

  onDragUpdate(DragUpdateDetails details) {
    if (dragStart != null) {
      final currentPostition = details.globalPosition;
      final dx = dragStart.dx - currentPostition.dx;

      if (dx < 0.0 && widget.canDragLeftToRight)
        direction = SlideDirection.leftToRight;
      else if (dx > 0.0 && widget.canDragRightToLeft)
        direction = SlideDirection.rightToLeft;
      else
        direction = SlideDirection.none;

      if (direction != SlideDirection.none)
        slidePercent = (dx / FULL_PAGE_DRAG).abs().clamp(0.0, 1.0);
      else
        slidePercent = 0.0;

      widget.slideUpdateSteam
          .add(SlideUpdate(direction, slidePercent, UpdateType.dragging,TransitionGoal.manual));
    }
  }

  onDragEnd(DragEndDetails details) {
    dragStart = null;

    widget.slideUpdateSteam
        .add(SlideUpdate(SlideDirection.none, 0.0, UpdateType.doneDragging, TransitionGoal.manual));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: onDragStart,
      onHorizontalDragEnd: onDragEnd,
      onHorizontalDragUpdate: onDragUpdate,
    );
  }
}

class PseudoPageDragger {
  static const PERCENT_PER_MILLI = 0.0035;

  final SlideDirection direction;
  final TransitionGoal transitionGoal;

  AnimationController controller;

  PseudoPageDragger(this.direction, this.transitionGoal, double slidePercent,
      StreamController<SlideUpdate> slideUpdateStream, TickerProvider vsync) {
        double startSlidePercent =slidePercent;
    double endSlidePercent;
    Duration duration;
    double slideRemaining;

    if (transitionGoal == TransitionGoal.open) {
      endSlidePercent = 1.0;
      slideRemaining = 1.0 - slidePercent;
    } else {
      endSlidePercent = 0.0;
      slideRemaining = slidePercent;
    }

    duration = new Duration(milliseconds: (slideRemaining / PERCENT_PER_MILLI).round());

    controller = new AnimationController(vsync: vsync, duration: duration)
      ..addListener(() {
        slidePercent = lerpDouble(startSlidePercent, endSlidePercent, controller.value);

        slideUpdateStream
            .add(SlideUpdate(direction, slidePercent, UpdateType.animating, transitionGoal));
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          slideUpdateStream.add(
              SlideUpdate(SlideDirection.none, endSlidePercent, UpdateType.doneAnimating, transitionGoal));
        }
      });

  }

  run(){
    controller.forward();
  }

  dispose(){
    controller.dispose();
  }
}

enum TransitionGoal { open, close, manual }

class SlideUpdate {
  final SlideDirection direction;
  final double percent;
  final UpdateType type;
  final TransitionGoal goal;

  SlideUpdate(this.direction, this.percent, this.type, this.goal);
}

enum SlideDirection { leftToRight, rightToLeft, none }

enum UpdateType { dragging, doneDragging, animating, doneAnimating }
