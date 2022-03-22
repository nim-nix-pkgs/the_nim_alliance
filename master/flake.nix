{
  description = ''A Nim wrapper for TheBlueAlliance'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-the_nim_alliance-master.flake = false;
  inputs.src-the_nim_alliance-master.owner = "tervay";
  inputs.src-the_nim_alliance-master.ref   = "master";
  inputs.src-the_nim_alliance-master.repo  = "the-nim-alliance";
  inputs.src-the_nim_alliance-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-the_nim_alliance-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-the_nim_alliance-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}