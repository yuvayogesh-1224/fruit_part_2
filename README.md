# Little Artist: Kids Coloring Game (Flutter Android)

A production-ready kids' coloring mobile game built with **Flutter**, **Dart**, **MVVM Architecture**, and an **offline-first universal coloring engine**.

---

## 🎨 Universal Coloring Engine — Zero Color Spill Guarantee

The core differentiator of this app is its **region-based clipping coloring engine**:

1. **Strict Region Boundary Isolation:**
   - Every drawing has mathematical vector `Path` masks defining each distinct colorable region (e.g., *Carrot Body*, *Carrot Leaves*, *Apple Body*, *Stem*, *Crown*).
   - When a child touches down on the canvas, `RegionMaskManager` evaluates `region.path.contains(touchPoint)` and locks the active stroke to that region.
   - During painting, `canvas.save()`, `canvas.clipPath(activeRegion.path)`, and `canvas.restore()` enforce a **hardware-level clipping barrier** via Skia/Impeller.
   - Even if the child vigorously draws circles across the entire tablet screen, **not a single pixel spills outside the outline or into adjacent regions**.

2. **Preserved Black Outlines & Details:**
   - The rendering pipeline follows strict layer ordering:
     1. Base canvas paper background with soft drop shadow.
     2. Region fills and user-drawn brush strokes (strictly clipped to region masks).
     3. Protected facial details layer (kawaii eyes, white reflection glints, smiling mouths, rosy cheeks).
     4. Original crisp black outlines (5.5–6.0px rounded stroke width) rendered on top.
   - This completely eliminates white seams or outline damage.

3. **6 Realistic Kid Brush Styles:**
   - **Soft Brush:** Smooth, rounded, feathered stroke for silky gradients.
   - **Crayon Brush:** Textured wax finish with micro-jitter wax grain particles along the path.
   - **Pencil:** Fine graphite stippling with parallel cross-hatch texture.
   - **Marker (Texture):** Rich, saturated semi-translucent ink layering.
   - **Spray Brush:** Airbrush droplet mist clustering naturally along finger motions.
   - **Glitter Brush:** Magical glowing stroke bursting with 4-pointed stars and golden diamond sparkles!

4. **100% Responsive Touch Mapping:**
   - The engine defines a canonical 500×500 coordinate system.
   - `LayoutBuilder` computes `scale` and offsets using `BoxFit.contain` so touch coordinates map 1:1 across all screen sizes (360×640, 390×844, 412×915, and tablets).

---

## 📚 105 Unique Drawings Library Across 15 Categories

All 105 drawings are available **100% offline**:

1. **Fruits (Levels 1–7):** Sweet Apple, Happy Banana, Juicy Strawberry, Sunny Orange, Watermelon Slice, Purple Grapes, Crown Pineapple.
2. **Vegetables (Levels 8–14):** Crunchy Carrot, Plump Tomato, Tiny Tree Broccoli, Sweet Corn, Purple Eggplant, Round Pumpkin, Spotted Mushroom.
3. **Cute Animals (Levels 15–21):** Cute Kitty, Playful Puppy, Fluffy Bunny, Sweet Panda, Chubby Hamster, Cozy Koala, Honey Bear.
4. **Wild Animals (Levels 22–28):** Brave Lion, Gentle Elephant, Tall Giraffe, Striped Zebra, Cheeky Monkey, Happy Hippo, Striped Tiger.
5. **Birds (Levels 29–35):** Playful Penguin, Wise Owl, Tropical Parrot, Cute Duckling, Pink Flamingo, Proud Peacock, Big-Beak Toucan.
6. **Flowers (Levels 36–42):** Sunny Sunflower, Bright Tulip, Velvet Rose, Happy Daisy, Water Lotus, Sakura Blossom, Desert Cactus.
7. **Nature (Levels 43–49):** Magic Rainbow, Happy Sunshine, Green Tree, Snowy Mountain, Crescent Moon, Magic Waterfall, Tropical Island.
8. **Vehicles (Levels 50–56):** Beep Beep Car, School Bus, Choo-Choo Train, Soaring Airplane, Whirly Helicopter, Yellow Submarine, Sailboat.
9. **Dinosaurs (Levels 57–63):** Baby T-Rex, Long-Neck Dino, Three-Horn Dino, Plated Stegosaurus, Flying Pterodactyl, Sail Spinosaurus, Shield Dinosaur.
10. **Sea Animals (Levels 64–70):** Bubbling Fish, Smiling Octopus, Leaping Dolphin, Spouting Whale, Gentle Sea Turtle, Glowing Jellyfish, Snappy Crab.
11. **Space (Levels 71–77):** Space Rocket, Brave Astronaut, Ringed Saturn, Flying Saucer, Moon Lander, Friendly Alien, Shooting Star.
12. **Fantasy Characters (Levels 78–84):** Magic Unicorn, Baby Dragon, Little Fairy, Sweet Mermaid, Wizard Hat, Magic Castle, Star Wand.
13. **Toys (Levels 85–91):** Cuddly Teddy, Beep Robot, Bongo Drum, Rocking Horse, Spinning Yo-Yo, Spinning Top, Bath Rubber Duck.
14. **Food (Levels 92–98):** Ice Cream Cone, Sweet Cupcake, Glazed Donut, Cheesy Pizza, Juicy Burger, Rainbow Lollipop, Celebration Cake.
15. **Cartoon Objects (Levels 99–105):** Cozy Teapot, Cheerful Clock, Smiling Pencil, Storybook, Bright Idea Bulb, Adventure Backpack, Smiling Teacup.

---

## 🛠️ Complete Toolset & Features

- **Color Palette:** 20 vibrant, kid-friendly swatches with active selection indicator.
- **Paint Bucket (Fill Tool):** Instant region fill preserving outlines.
- **Eraser:** Region-safe eraser that removes user color without wiping out black outlines.
- **Undo / Redo:** Full action stack for strokes, fills, and clears.
- **Brush Size Adjuster:** Slider with real-time visual preview circle.
- **Level Completion Detection:** Triggers when required regions reach completion threshold.
- **Rewards & Progression:** Coins, 3-star ratings, daily goals, and unlocked achievements.
- **Art Museum (Gallery):** Renders finished artworks to PNG offline and saves them locally.
