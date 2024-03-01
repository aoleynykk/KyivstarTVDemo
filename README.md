# KyivstarTV Demo
# Hello! 

This test briefly touches on key aspects of working in our `iOS` team, so try your best ;) 

You need to do this layout:

<img src="https://i.imgur.com/tdXjea6.png" width="750" height="430">
https://www.figma.com/file/6yVcKC9OJLeE4CUojqlQWe/Untitled?type=design&mode=design&t=9JbZpIuEDmbW3Oho-1

It contains content groups with assets and asset page with some simple logic. 

#### Required:
1. Home screen
2. Transition from `UIKit` home screen to `SUI` asset details screen
3. Simple Asset Details screen with image, buttons and title

#### Optional:
1. Asset details screen according to figma design, marked as optional


You can do only required section, or required and optional sections.


#### You must use:

0. UIKit + SwiftUI
1. MVVM+C
2. Combine for binding
3. Diffable Data Source and Compositional Layout in UIKit page
4. Lowest iOS version have to be 14.0

Any other technics and mechanics - on your choice.
Would be a plus if you will use modern concurency methods.

### API Details
Network setup is attached inside postman collection. Feel free to import it.

Bearer Token: `vf9y8r25pkqkemrk21dyjktqo7rs751apk4yjyrl`

All necessary requests and headers with tokens are stored there. 

When loading list of content groups please pay attention on content group type. We need to show only this ones: 

`
MOVIE, SERIES, LIVECHANNEL, EPG
`

And depending on type - we need to build different layout (more details in figma)

Basic flow:

1. User opens application.
2. Network calls start to load information. You can make network calls `sync` or `async` - depends on you. [Optional]: You can create skeletons if you want.
3. When some of the data is loaded - user starts to see it on screen.
4. User can see progress bar under asset image, if `progress > 0`
5. User can tap `Del` button - which will remove content group from screen if `canBeDeleted` flag of contentGroup is set to true

Additional flow, not required, but will be a plus:
1. User can tap on any asset and open `SwiftUI` asset details page.
2. Make network call to load asset details
3. Pay attention on UI in figma, how it have to work

Please, no storyboards, xib files, localizations.


It will be a plus to create pull request into this repository.
The best solution will be pushed into main repository - so everyone can know something new.

GL HF.

p.s. If you have any questions(maybe some endpoints stoped working, or flow is not clear), feel free to create issues inside this repository, we'll try to react quickly. 
