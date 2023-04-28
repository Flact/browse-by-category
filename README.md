
## Batch URL Opener by Category

This script is a simple utility to open a list of URLs organized by categories. The URLs are stored in a text file, and the script allows the user to choose a category to open all the URLs within that category.

### Usage

1. Create a text file called `urls.txt` in the same directory as the script.
2. Organize the URLs in the `urls.txt` file by categories. Each category should start with a line in the format `[CAT:CategoryName]`, followed by the URLs, one per line.
3. Make sure the script has execute permissions, and run the script using the command `./url_launcher.sh` (assuming the script is named `url_launcher.sh`).
4. The script will display the categories and prompt you to select a category to open. Enter the number corresponding to the category you wish to open, and the script will open all the URLs in that category using the Firefox browser. You can also enter `0` to exit the program.

### Example

Here's an example of the contents of the `urls.txt` file:

```
[CAT:YouTube]
https://www.youtube.com/channel/1
https://www.youtube.com/channel/2
https://www.youtube.com/channel/3

[CAT:Social media]
https://www.facebook.com
https://www.twitter.com
https://www.instagram.com

[CAT:Blogs]
https://exampleblog1.com
https://exampleblog2.com
https://exampleblog3.com

[CAT:eCommerce]
https://www.amazon.com
https://www.ebay.com
https://www.etsy.com
```

When you run the script, it will display the categories and prompt you to select a category to open:

```
1) YouTube
2) Social media
3) Blogs
4) eCommerce
0) Exit
Select a category to open:
```

Enter the number corresponding to the category you wish to open, and the script will open all the URLs in that category using the Firefox browser.
