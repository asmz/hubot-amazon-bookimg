# hubot-amazon-bookimg

A hubot script return Amazon book image URL.

## Installation

Add `hubot-amazon-bookimg` to your `package.json` dependencies, and run `npm install`.

```
"dependencies": {
  "hubot-amazon-bookimg": ">= 0.0.1"
}
```

Add `hubot-amazon-bookimg` to `external-scripts.json`.

```
> cat external-scripts.json
> ["hubot-amazon-bookimg"]
```
## Usage

```
hubot bookimg me <asin> - Return the image of the book corresponding to <asin (isbn10 or isbn13 ) >.

Option: 
hubot (middle|small|thumb) bookimg me <asin> - Return the (middle|small|thumb) size image of the book.
```
