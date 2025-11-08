
{
 description = "My personal dev enviorments for C and python";

 inputs = {
   nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
 };
 outputs = {self, nixpkgs}:
 let
   pkgs = nixpkgs.legacyPackages."x86_64-linux";
 in{
   devShells."x86_64-linux".default = pkgs.mkShell {
     packages = with pkgs; [ gcc gnumake ];
   };
   devShells."x86_64-linux".python = pkgs.mkShell {
     packages = with pkgs; [
       (pkgs.python3.withPackages (python-pkgs: [
         python-pkgs.requests
         python-pkgs.discord
    ]))];
   };
   devShells."x86_64-linux".zigc = pkgs.mkShell {
     packages = with pkgs; [ zig_0_13 ];
   }; 
 };
}
