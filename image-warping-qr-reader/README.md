# Image Warping and a QR Code Reader from First Principles

**Computer vision · NumPy · homographies · bilinear interpolation**

Graduate computer vision lab, East Carolina University. Interpolation, warping, and QR decoding are all written by hand in NumPy, without OpenCV or image-library warping functions.

## What's implemented

| Part | Component | Notes |
|---|---|---|
| 1 | **Bilinear interpolation** | Samples an image at non-integer pixel locations; used to scale an image by 2.3× |
| 2 | **Backward-mapping compose** | For each target pixel, applies the inverse transform and samples the source, so the output has no holes |
| 3 | **Perspective warp** | Uses a 4-point homography to place one image inside a quadrilateral in another (a picture inserted into a TV screen) |
| 4 | **Bounding-box speed-up** | Back-maps only pixels inside the destination quad's bounding box instead of the whole frame |
| 5 | **QR code reader** | Finds the three finder patterns, solves the homography to a canonical grid, rectifies the code, samples module centers, and decodes |
| Extra | **Any-size QR reader** | A self-contained version with its own SVD-based homography solver. It tests each size from 21×21 to 41×41 by scoring how well the timing pattern alternates, binarizes with Otsu-style thresholds, and tries corner orderings, quiet-zone offsets, and all four rotations until one decodes |

## Results

- The any-size reader correctly decoded the extra-credit QR image, a URL on the ECU Computer Science faculty site.
- Known issue: in the saved run, the fixed 29×29 reader in Part 5 returned `None` for `test1` and `test2`. The any-size reader replaced it, and re-running it on those two images is the next step.

## Running it

The notebook expects the course-provided helper module `qr.py` (finder-pattern detection and the bit decoder) and the `qr-code-images/` folder. Those belong to the instructor and are not included here.

```bash
pip install -r requirements.txt
jupyter notebook image_warping_qr_reader.ipynb
```

## Skills shown

Linear algebra for vision (homographies, inverse mapping) · numerical sampling · algorithm optimization · debugging geometry pipelines
