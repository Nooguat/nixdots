{ pkgs, ... }:
{
	programs.git = {
		enable = true;
		userName = "p.gsd";
		userEmail = "pgsd@disroot.org";
	};
}

