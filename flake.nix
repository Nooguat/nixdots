{
  description = "System Config";

  inputs = {
	nixpkgs.url = "nixpkgs/nixos-unstable";
	flake-utils = {
    		url = "github:numtide/flake-utils";
	};
	nur = {
    		url = "github:nix-community/NUR";
	};
	home-manager = {
    		url = "github:nix-community/home-manager";
    		inputs.nixpkgs.follows = "nixpkgs";
	};
  };
  outputs = {
      self
      , nixpkgs
      , home-manager
      , nur
      , ...
  } @ inputs:
  let
  
      system = "x86_64-linux";
      user = "rev";
      hostname = "nixrev";
      supportedSystems = nixpkgs.lib.genAttrs [ "x86_64-linux"  ];
      legacyPackages = supportedSystems (system:
      	import nixpkgs {
          	inherit system;
          	config = { allowUnfree = true; };
          	overlays = [
              		inputs.nur.overlay
              		# (import ./overlays) Hoping to never uncomment this
          	];
      });
      lib = nixpkgs.lib;
      in {
      defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
      nixosConfigurations = {
	  nixrev = lib.nixosSystem {
    	    pkgs = legacyPackages.x86_64-linux;
    	    modules = [
		./system/configuration.nix
    	    ];
	  };
      };
      homeConfigurations = {
	rev = home-manager.lib.homeManagerConfiguration {
		pkgs = self.outputs.nixosConfigurations.nixrev.pkgs;
        	modules  = [ ./users/rev/home.nix ];
	};
      };
  };

}
