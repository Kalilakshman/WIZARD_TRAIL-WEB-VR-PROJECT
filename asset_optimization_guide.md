# AAA VR Optimization Guide (Web Tools)

Since we are avoiding NPM and CLI builds, use these powerful web-based tools to optimize your GLB assets for "AAA" performance (60fps on mobile/VR).

## Tool 1: GLTF.Report (Mesh & Texture Optimization)
This is the most powerful tool for non-NPM users.
1. Visit [gltf.report](https://gltf.report/).
2. Drag and drop your `.glb` file.

### Actions to Take:
- **Simplify**: Under the "Script" or "Transform" tab, look for **Simplify**. Set the ratio to `0.1` (10%) for large background objects like the Mage Tower or Portal. This reduces polygon count while keeping the silhouette.
- **Draco Compression**: Apply Draco compression to reduce file size.
- **Texture Compression (KTX2)**: If your textures are huge, select **uastc** or **etc1s** to convert them to KTX2 format. 
  > [!NOTE]
  > Our `index.html` already uses the standard A-Frame loader which handles KTX2 if configured, but for "Minimal" tech, sticking to optimized JPEG/PNG with a low resolution (1024x1024 max) is often simpler.

## Tool 2: RapidCompact / Gestaltor (LODs)
If you need automated Levels of Detail (LODs):
1. Use [gestaltor.io](https://gestaltor.io/) (Online Editor).
2. It allows you to manually prune nodes and merge materials to reduce "Draw Calls."
   > [!TIP]
   > AAA visuals depend on low Draw Calls. Merge as many meshes as possible into a single object before exporting from Blender.

## Performance Checklist for AAA Feel:
- **Draw Calls**: Keep under 50 for mobile VR.
- **Texture Size**: Never use 4K textures. Use 1K or 2K with high-quality shaders.
- **Polygons**: The `mana_fantasy_teamed_portal.glb` should be simplified from its current size down to < 5MB if possible.

## Integration
Once you have the optimized files:
1. Replace the original `.glb` files in your project folder.
2. The `index.html` is already configured to load these files and handle high-accuracy rendering.
