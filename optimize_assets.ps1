# Wizard's Trial - GLB Optimization Pipeline
# This script uses glTF-Transform and gltfpack to optimize assets for 60fps WebXR performance.

# Requirements:
# 1. Node.js installed
# 2. npm install -g @gltf-transform/cli
# 3. Download gltfpack binary from https://github.com/zeux/meshoptimizer/releases

echo "Starting GLB Optimization Pipeline..."

# 1. FLOW FOR THE LARGE MANA PORTAL (Heavy Poly Count)
echo "Optimizing mana_fantasy_teamed_portal.glb..."
gltf-transform simplify mana_fantasy_teamed_portal.glb mana_portal_low.glb --ratio 0.1 --error 0.01
gltf-transform draco mana_portal_low.glb mana_portal_opt.glb
# Convert textures to KTX2 (requires basisu)
# gltf-transform ktx2 mana_portal_opt.glb mana_portal_final.glb --uastc

# 2. FLOW FOR THE MAGE TOWER (Environment)
echo "Optimizing free_stone_mage_tower.glb..."
# Using gltfpack for aggressive mesh optimization
gltfpack -i free_stone_mage_tower.glb -o mage_tower_opt.glb -c -cc

# 3. FLOW FOR THE FLOATING ISLAND (Repeated Asset - Instance check)
echo "Optimizing floating_island.glb..."
gltf-transform simplify floating_island.glb island_low.glb --ratio 0.2
gltf-transform meshopt island_low.glb island_final.glb

# 4. FLOW FOR STYLIZED CRYSTAL (Small detail)
echo "Optimizing stylized_crystal.glb..."
gltfpack -i stylized_crystal.glb -o crystal_opt.glb -c

echo "Optimization Complete. Updated assets are ready for testing."
echo "Note: Update the src paths in index.html to use the *_opt.glb files."
