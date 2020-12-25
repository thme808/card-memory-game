# card-memory-game
note taking from the lecture [CS193p iPhone Application Development Spring 2020](https://www.youtube.com/playlist?list=PLpGHT1n4-mAtTj9oywMWoBx0dCGd51_yG)

## Access Control
```swift
private(set) var cards: Array<Card>
```

## @ViewBuilder
it supports **`list-oriented syntax`**
* a simple mechanism for supporting a more convinient syntax for lists of views
* it interprets the contents as a list of Views to combine them into **one View**


> delevelopers can apply it to any of their functions that **return something that conforms to View**.

That **one View** can be:
* TupleView(for two to ten Views)
* _ConditionalContentView (for if-else in there)

#### How to use?
As below, any func or read-only computed var can be marked with `@ViewBuilder`. if so, the contents of that will be interpeted as a list of Views.

```swift
@ViewBuilder
func front(of card: Card) -> some View {
    RoundedRectangle(cornerRadius: 10)
    RoundedRectangle(cornerRadius: 10).stroke()
    Text(card.content)
}
```

you can also use `@ViewBuilder` to mark a parameter that returns a View.
```swift
struct GeometryReader<Content> where Content: View {
    init(@ViewBuilder content: @escaping (GeometryProxy) -> Content} {
        ...
    }
}
```

## Shape
A 2D shape that you can use when drawing a view.
```swift
protocol Shape : Animatable, View
```
it is a `protocal` that inherits from View. (it implements `View`'s body var for you)
.stroke() and .fil() returns a View that draws the Shape by sroking and filling. 
```swift
func fill<S>(_ whatToFillWith: S) -> View where S: ShapeStyle
```
* .fill() is a generic function.
* S can be anything that implements the `ShapeStyle` protocol.

`Shape` requires to implement:
```swift
func path(in rect: CGRect) -> Path {
    return Path
}
```
in this function you create and return `Path` that draws anything you want.
what `Path` can do is like: 
* add lines
* draw arcs
* draw bezier curves, etc


## Animation
### ViewModifier
View modifying functions like .aspectRatio and .padding() are calling a function in `View` called `modifier()`. e.g. .aspectRatio(2/3) is something like `.modifier(AspectModifier(2/3)`

The `ViewModifier` protocol has one function in it, whoose only job is to create new `View` based on the thing passed to it.

```swift
protocal ViewModifier {
    associatedtype Content // a protocol's version of generic
    func body(content: Content) -> some View{
        return some View that represents a modification of content
    }
}
