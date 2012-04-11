I'm hoping that my bookmark service is going to allow someone to enter a link to a book on Amazon and their printer URL in order to print a simple bookmark for that book.

The first thing I did was to create a really simple html page that I could use to test the print preview service.

Once I had that working I moved on to dynamically generating a bookmark for a given Amazon URL.

I used cURL to download an amazon book page so that I could play around with extracting the image and title which are the things I'm after.

     curl "http://www.amazon.co.uk/Vanishing-Point-Danielle-Ramsay/dp/1847562337/ref=tmm_pap_title_0" -L > examples/vanishing-point-amazon-page.html

After playing around a little I was able to create a script (generate-bookmark.rb) that took the URL of an Amazon book page, or the location of a local file, and emit the html of a simple bookmark.

The next step is to create a simple web interface that allows the bookmarks to be generated and, finally, printed.