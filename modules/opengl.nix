{config, pkgs, ...}:

{

# services.xserver.videoDrivers = ["amdgpu"];

hardware = {
  graphics = {
  enable = true;
  

  extraPackages = with pkgs; [
  libva
  libva-utils
  mesa
  vulkan-loader
  vulkan-tools
  vulkan-validation-layers
   ];
  };
 };
}
