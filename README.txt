Lamofire was used to request the New York Times server. To get information about posts.

SWXMLHash was used to parse the XML format.

SDWebImage was used to load images in the background stream, using Placeholder for the image.

The first screen shows a list of topics on which there are posts. There was no possibility to parse the list of topics, as I did not find it in the API.

The second screen shows a list of information posts on the topic selected from the previous screen. The table cell contains Title, Description, Image of the post.

On the third screen, a web page with the selected post is loaded from the second screen. Because the xml document contained an html link to the information post
