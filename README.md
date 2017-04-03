# WWDC16
Why did you choose the features and technologies that you used in your app? What were your biggest technical challenges in implementing these features and technologies, and how did you overcome them? If given more time, what would you add or improve upon?

The main idea of my app is to tell you about me, my story and how I live and develop. So first I introduce myself, here I use a Live Photo to really show you what I am all about having fun and doing crazy stuff. Now on the map you can see my typical three daily hotspots and how close they are together. I really liked this idea about popping an annotation pin, like you press just to hard on it and it bursts, so I used 3D touch for it with maximum force. When you pop a pin, it is like you are right here with me, jumping into the map and we are going into the building together (Live Photo), once inside you can see the inside or even my workspace. I show you around and tell you all about my projects I am working on here. Leave the place and go to another one and keep exploring. That is basically why I used all of these technologies to tell you a story, my story.
First up I have not used Live Photos or 3D Touch before this. So I had to study them first. The documentation by apple is good but there are not many examples out there that use these technologies yet so I just jumped in and did trial and error. My biggest technical challenge was not having the newest iPhone (only 6 Plus) so I could not really test everything on my device and to take the live photos I had to borrow a iPhone 6s from a good friend of mine. The most helpful feature was that I could use my trackpad for 3D touch via its force touch. This really saved my life. The popping of the pins was tough because there is no official gesture recogniser for it yet. So I used one build by the community but I had to understand it first to manipulate it for my needs. After I got that working the next challenge was right around the corner: Live Photos. I have never taken, nor did ever see one. So I searched for some resource online and basically build my own PHLivePhotoView without testing. Gladly when I was able to take some photos and could test it I had only some minor bugs to fix. 
If I had have more time I would have made the pop of the pin more responsive. Kind of in the way peek and pop works. So if you apply more pressure to a pin it would slowly grow until it was big enough for a peak and if you keep applying pressure you could pop it. And also an animation when you close the pin again, like it shrinks back to size or something. I would have added more pins, like where I do sports, eat, party... Or maybe even go as far as people adding their own places and showing you around.
