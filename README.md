# ViewTransition
视图控制器转场

UIViewControllerTransitioningDelegate
负责转场的协议。非交互式和交互式的转场都是由实现该协议的代理控制。其中有两个方法是控制专场动画，两个方法是控制交互进度。

UIViewControllerAnimatedTransitioning
转场动画协议。两个必须实现的方法，一个决定动画持续时间，一个决定转场动画。

UIViewControllerInteractiveTransitioning
交互式转场协议。该协议控制交互转场如何操作，不过该协议一般不需要我们自定义类来实现，因为系统已用UIPercentDrivenInteractiveTransition实现了该协议。

UIPercentDrivenInteractiveTransition : NSObject
系统实现了交互转场协议的类。通常我们只需要子类化该类返回给UIViewControllerAnimatedTransitioning协议中的方法即可。


UIViewControllerContextTransitioning
animateTransition方法的核心则是从转场动画上下文获取必要的信息以完成动画。上下文是一个实现了UIViewControllerContextTransitioning的对象，它的作用在于为animateTransition方法提供必备的信息。您不应该缓存任何关于动画的信息，而是应该总是从转场动画上下文中获取(比如fromView和toView)，这样可以保证总是获取到最新的、正确的信息。苹果文档说明，这个协议我们是不能实现的。

造成黑屏的原因：
1，当设置了transitioningDelegate后，如果delegate被释放了，那么视图返回会就黑屏。
2，视图出现和消失分别设置了不同的transitioningDelegate

如果interactionControllerForPresentation:animator:返回了非空值，说明是交互式动画，这时就必须调用交互式动画的更新方法，否则，视图动画不会进行，会停在开始。