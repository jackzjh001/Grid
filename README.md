# Grid

A WPF-like `Grid` view written in pure SwiftUI.

## NormalGrid

#### Usage

```swift
struct ContentView: View{
  var body: some View{
    NormalGrid(rowDefinitions: [
      .fixed(50),
      .fixed(100),
      .dynamic(),
      .dynamic(2)
    ], columnDefinitions: [
      .fixed(50),
      .fixed(100),
      .dynamic(),
      .dynamic(2)
    ]){
      SomeView
      	.gridCell(row: 0, column: 0)
      SomeView
      	.gridCell(row: 3, column: 3)
      GridCell(row: 1, column: 1, rowSpan: 2, columnSpan: 2){ frameAndPosition in
        SomeView(withFrameAndPosition: frameAndPosition)
      }
    }
  }
}
```

---

#### Currently supports

1. **Fixed** row height / column width;
2. **Dynamic** row height / column width;
3. **Span-able** row / column configuration;
4. Builtin **"`GeometryReader` functionality"** into `GridCell`.

---

#### ToDo

1. Correct animation when changing row / column configuration;
2. Correctly pass frame and position parameters from  `GridCell` when invalid configuration is found.

## UniformGrid

#### Usage

```swift
struct ContentView: View{
  var body: some View{
    UniformGrid(rows: 4, columns: 4){
      SomeView
      	.gridCell(row: 0, column: 0)
      SomeView
      	.gridCell(row: 3, column: 3)
      GridCell(row: 1, column: 1, rowSpan: 2, columnSpan: 2){ frameAndPosition in
        SomeView(withFrameAndPosition: frameAndPosition)
      }
    }
  }
}
```

---

#### Currently supports

1. **Smoother animation** when change grid's configuration;
2. Only **uniform space distribution** for rows and columns;
3. **Less CPU workload** compared to `NormalGrid`;
4. **Span-able** row / column configuration;
5. Builtin **"`GeometryReader` functionality"** into `GridCell`.

---

#### ToDo

1. Need to confirm that no buggy animation when arbitrary value is passed as grid's parameter;
2. Boundry clipping method without laggy animation;
3. Correctly pass frame and position parameters from  `GridCell` when invalid configuration is found.

## Error Handling

Handles basic errors, like:

1) Argument out of bound;
2) Using `GridCell` outside a `Grid`;
3) Using `NormalGrid` without using `GridCell`;
4) Using `UniformGrid` without using `GridCell`;

## Supported Platform

Should work on any platform after the release of SwiftUI 2.0, which are:

1. iOS (Version >= 14.0);
2. macOS (Version >= 11.0);
3. Mac Catalyst (Version >= 14.0); *Not Recommended*
4. tvOS (Version >= 14.0); *Not Tested*
5. watchOS (Version >= 7.0). *Not Tested*
