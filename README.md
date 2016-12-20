![Logo of the project](https://raw.githubusercontent.com/jehna/readme-best-practices/master/sample-logo.png)

# Hypermedia Wonderland
> Collaborative Composition Platform

HW is a flexible creative platform (Sinatra CRUD App) that provides the architecture, organized storage for text and multi-media links, and interconnectivity for a group of creators to work together on the development of a project. The platform is flexible enough to be used by a group or a single creator, and the idea of "project" is open to almost any interpretation, including: a performance, a book with multi-media enhancements, or an illustrated/recorded/typed interview.
Think of it as a collective storyboard/sketchpad/refinement tool. If you are interested to read more about HW, check out my blog post at: https://nicolefederici.wordpress.com/2016/12/19/hypermedia-wonderland/

## Installing / Getting started

To get HW up and running locally on your machine, open up a terminal and type this:

```shell
git clone https://github.com/nicolefederici/hypermedia_wonderland.git
cd hypermedia_wonderland
bundle install 
shotgun
```
Then, open your browser and navigate to localhost:9393/signup

You will be asked to create a username and password, after which you will be able to create or join a project. You can start exploring your options from there.

## Contributing

This is primitive prototype that will be recast in Rails, eventually. I'm not looking for contributions at the moment, but feel free to suggest new features and tell me about any issues you have. I'm working to transfer the db to Postgres ASAP, so users can collaborate online.

## Contact Me

Send me a message through LinkedIn:
https://www.linkedin.com/in/nicolefederici
(bugs, problems, questions, feature requests, administration)

## Features

What's all the bells and whistles this project can perform?
* collaborative creation of original material based upon an architechture the creater sets at the beginning of a project.
* allows artists to add links of multi-media to their creative ideas in development.
* collaborators can comment on any part of a project, and can vote up sections they love.
* it creates a "score" of the best developed and most popular ideas within the poject.

## Licensing

One really important part: Give your project a proper license. Here you should
state what the license is and how to find the text version of the license.
Something like:

"The code in this project is licensed under MIT license."
