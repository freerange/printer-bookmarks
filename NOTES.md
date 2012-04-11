I'm hoping that my bookmark service is going to allow someone to enter a link to a book on Amazon and their printer URL in order to print a simple bookmark for that book.

The first thing I did was to create a really simple html page that I could use to test the print preview service.

Once I had that working I moved on to dynamically generating a bookmark for a given Amazon URL.

I used cURL to download an amazon book page so that I could play around with extracting the image and title which are the things I'm after.

     curl "http://www.amazon.co.uk/Vanishing-Point-Danielle-Ramsay/dp/1847562337/ref=tmm_pap_title_0" -L > examples/vanishing-point-amazon-page.html

After playing around a little I was able to create a script (generate-bookmark.rb) that took the URL of an Amazon book page, or the location of a local file, and emit the html of a simple bookmark.

    ./generate-bookmark.rb "http://www.amazon.co.uk/Vanishing-Point-Danielle-Ramsay/dp/1847562337/ref=tmm_pap_title_0"

The next step is to create a simple web interface that allows the bookmarks to be generated and, finally, printed.

I've now got my sinatra app that allows me to dynamically generate bookmarks for a given Amazon page, e.g. http://printer-bookmarks.dev/bookmark?url=http://www.amazon.co.uk/gp/product/1849014752/ref=s9_simh_gw_p14_d0_g14_i4?pf_rd_m=A3P5ROKL5A1OLE&pf_rd_s=center-2&pf_rd_r=1JDCZ1FRTRETGVAZZ5XX&pf_rd_t=101&pf_rd_p=467128533&pf_rd_i=468294

I've also got the app deployed to heroku at http://printer-bookmarks.heroku.com/

Now I need to make the bookmark a little more printer friendly.