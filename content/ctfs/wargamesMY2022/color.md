---
title: "Color [STEGO]"
date: 2022-12-24
summary: "Basic QR Code Challenge based on RGB Color Model."
tags: ["Steganography", "Stegsolve", "RGB", "QRCODE"]
---
Basic QR Code Challenge based on RGB Color Model.

## Challenge Description
> Please message us on discord if you are colorblind (Because I’m easy come, easy go, Little high, little low,)

![image](https://user-images.githubusercontent.com/107750005/214093815-692ac6af-2f7a-468b-9e9c-c222e6b5e1ec.png)

## Solution
We get a QR code with multiple colors. The solution for this challenge is that the colored QR code contains more than one valid QR codes.
Hence, I utilize [stegsolve](https://github.com/zardus/ctf-tools/blob/master/stegsolve/install) to filter out valid QR codes and scan each of the QR code separately.

![image](https://user-images.githubusercontent.com/107750005/214091712-ad3e9bbd-7ebd-4d77-9f0e-227f6d1ca0fa.png)
![image](https://user-images.githubusercontent.com/107750005/214092220-f9f166f5-34f1-4a6c-aad7-ba117e486fb0.png)
![image](https://user-images.githubusercontent.com/107750005/214093530-7fbda061-33e5-47f1-a80e-514c2e82333c.png)

- blueplane.png: `5533b67bae8deb`
- greenplane.png: `wgmy{a437a259`
- redplane.png: `bac0f12d77}`

***FLAG***: `wgmy{a437a2595533b67bae8debbac0f12d77}`
