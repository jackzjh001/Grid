# Grid

A WPF-like `Grid` view written in pure SwiftUI.

## Functionality

Currently supports:

1. **Fixed** row height / column width;
2. **Dynamic** row height / column width;
3. **Span-able** row / column configuration;
4. Builtin "`GeometryReader` functionality" into `GridCell`.

ToDo:

1. Correct animation when changing row / column configuration;
2. Correctly pass frame and position parameters from  `GridCell` when invalid configuration is found.

## Error Handling

Handles basic errors, like:

1) Argument `row` / `column` out of bound;
2) Using `GridCell` outside a `Grid`;
3) Using `Grid` without using `GridCell`

## Supported Platform

Should work on any platform after the release of SwiftUI 2.0, which are:

1. iOS (Version >= 14.0);
2. macOS (Version >= 11.0);
3. Mac Catalyst (Version >= 14.0); *Not Recommended*
4. tvOS (Version >= 14.0); *Not Tested*
5. watchOS (Version >= 7.0). *Not Tested*
