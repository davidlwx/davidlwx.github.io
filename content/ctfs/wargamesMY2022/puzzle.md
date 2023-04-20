---
title: "Puzzle [STEGO]"
date: 2022-12-24
summary: "QR Code segments hidden in an image file."
tags: ["Steganography", "Stegsolve", "QRCODE"]
---
QR Code segments hidden in an image file.

## Challenge Description
>Is the original always better? Maybe, should we check? (I’m just a poor boy, I need no sympathy,)
ZIP Password: `wgmy2022`

![image](https://user-images.githubusercontent.com/107750005/214097304-5813855d-c5cd-4497-b0c5-82fec1440ca4.png)

## Analysis
From initial observation, we are not really sure what information is hiding in this image since it is a stego challenge.
Hence, I launch [stegsolve](https://github.com/zardus/ctf-tools/blob/master/stegsolve/install) again to look for clues.

***NOTE***: The `puzzle.jpg` is utterly big causing stegsolve out of the screen range after rendered the file.

Luckily, we can barely observe some QR code fractions scattered around on the top of `puzzle.jpg`.

![image](https://user-images.githubusercontent.com/107750005/214103785-d656b4e4-df9f-4f2a-9fc9-2f54c6664da1.png)

Based on this observation, the ***FLAG*** most likely is hiding in the QR Code. Additionally, the organizers' hint might come in handy.

We checked the [original image](https://en.wikipedia.org/wiki/File:Mona_Lisa,_by_Leonardo_da_Vinci,_from_C2RMF_retouched.jpg) and found that
the image size is exactly identical compared to `puzzle.jpg`.

## Solution
[Stegsolve](https://github.com/zardus/ctf-tools/blob/master/stegsolve/install) has an `Image Combiner` feature which can overlap two image files and perform various operations such as `XOR, ADD, SUB, ...`. In this situation, `SUB` gives the best output.

![image](https://user-images.githubusercontent.com/107750005/214103530-09b71365-47f2-4ccb-90ff-d8fe3a3ce592.png)

Combine each QR Code fraction together manually with [GIMP](https://www.gimp.org/). (Can't find a way to automate the process -.-)

To install GIMP in Debian OS: `sudo apt install gimp`

- Upload the Combined image.
- Select `Free Select Tool`.
- Trace every segment and combine the pieces.
- Scan QR Code to get the ***FLAG***.

![image](https://user-images.githubusercontent.com/107750005/214114529-040b4abe-6e77-4726-a5d6-b8cfec393444.png)

***FLAG***: `wgmy{3b68891a1ba20a27b9efd93f8d8c2fb0}`
