A Swift extension that add a collapsable `UINavigationBar` when scrolling content.

![alt tag](demo1.gif)

## Usage

In your view controller that contains scrollable content (i.e. a `UIScrollView` or something that contains one, like a `UITableView`) implement the UIScrollViewDelegate:

```
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
```

Then, inside your view controller, add this to the end of `viewDidLoad:`:

```
// Set up the collapsible bar.
self.navigationController?.pvs_collapsibleBar()
```

Then implement the following UIScrollViewDelegate method like so:

```
//#pragma - mark UIScrollViewDelegate

func scrollViewDidScroll(scrollView: UIScrollView) {
    self.navigationController?.pvs_collapisbleBarScrollViewDidScroll(scrollView)
}
```

That's it!
If needed, play with the globals inside `PVSCollapsibleBarNavigationController` to change the speed of the collapse and the title size.
