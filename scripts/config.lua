Setup.Package
{
	vendor = "liflg.org",
	id = "civ_ctp",
	description = "Civilization: Call To Power",
	version = "1.2a-multilingual",
	splash = "splash.png",
	superuser = false,
	write_manifest = true,
	support_uninstall = true,
	recommended_destinations =
	{
		"/usr/local/games",
		"/opt",
		MojoSetup.info.homedir,
	},

	Setup.Readme
	{
		description = "README",
		source = "README.liflg"
	},

	Setup.Media
	{
		id = "civ-disc-version-1.0",
		description = "Civilization: Call To Power Loki Disc (Version 1.0)",
		uniquefile = "CivCTP.tar.gz",
	},

	Setup.Media
	{
		id = "civ-disc-version-1.1",
		description = "Civilization: Call To Power Loki Disc (Version 1.1)",
		uniquefile = "CivCTP-data.tar.gz",
	},

	Setup.Media
	{
		id = "civ-disc",
		description = "Civilization: Call To Power Loki Disc",
		uniquefile = "runtime/ctp_data/default/videos/ca001a.mpg",
	},


	Setup.Option {
		required = true,
		description = "Files for Civilization: Call to Power",
		bytes = 0,
		Setup.DesktopMenuItem
		{
			disabled = false,
			name = "Civilization: Call To Power",
			genericname = "Civilization: Call To Power",
			tooltip = "Play Civilization: Call To Power",
			builtin_icon = false,
			icon = "CivCTP/icon.xpm",
			commandline = "%0/civctp.sh",
			category = "Game",
		},

		Setup.OptionGroup {
			description = "Select your disc",
			Setup.Option {
				description = "Version 1.1",
				bytes = 150676585,
				Setup.File {
					source = "media://civ-disc-version-1.1/CivCTP-data.tar.gz",
					filter = function(dest)
						if string.match(dest, "CivCTP/ctp_data/") then
							if string.match(dest, "CivCTP/ctp_data/default/videos/") then
								return nil
							end
							if string.match(dest, "CivCTP/ctp_data/default/") then
								return dest
							end
							return nil
						end
						if string.match(dest, "appstr.txt" ) then
							return nil
						end
						if string.match(dest, "civpaths.txt") then
							return nil
						end
						if string.match(dest, "CivCTP/ctp_data/default/graphics/pictures/pic565.zfs") then
							return nil
						end
						if string.match(dest, "CivCTP/ctp_data/default/graphics/pictures/pic555.zfs") then
							return nil
						end
						if string.match(dest, "CivCTP/dll") then
							return nil
						end

						return dest
					end
				},

				Setup.File {
					source = "media://civ-disc/CivCTP-x86-glibc-2.1.tar.gz",
					filter = function(dest)
						if dest == "civctp" then
							return dest, "0755"
						end
						return dest
					end
				},
			},

			Setup.Option {
				description = "Version 1.0",
				bytes = 142643845,
				Setup.File {
					source = "media://civ-disc-version-1.0/CivCTP.tar.gz",
					filter = function(dest)
						if dest == "civctp" then
							return dest, "0755"
						end
						if string.match(dest, "CivCTP/ctp_data/") then
							if string.match(dest, "CivCTP/ctp_data/default/videos/") then
								return nil
							end
							if string.match(dest, "CivCTP/ctp_data/default/") then
								return dest
							end
							return nil
						end
						if string.match(dest, "appstr.txt") then
							return nil
						end
						if string.match(dest, "civpaths.txt") then
							return nil
						end
						if string.match(dest, "CivCTP/ctp_data/default/graphics/pictures/pic565.zfs") then
							return nil
						end
						if string.match(dest, "CivCTP/ctp_data/default/graphics/pictures/pic555.zfs") then
							return nil
						end
						if string.match(dest, "CivCTP/dll") then
							return nil
						end

						return dest
					end
				},
			},
		},

		Setup.File 
		{
			wildcards = "civctp.sh",
			permissions = "0755",
		},
		Setup.File
		{	
			wildcards = "README.liflg"
		},

		Setup.Option {
			required = true,
			value = true,
			description = "Install videos to harddisk",
			bytes = 233400266,
			Setup.File {
				source = "media://civ-disc/runtime",
				destination = "CivCTP",
				filter = function(dest)
					if ( string.match(dest, "gw38a.mpg") ) then
						return nil
					end
					return dest
				end
			},

			Setup.File {
				source = "base:///video.tar.xz",
			},
		},

		Setup.Option {
			required = true,
			value = true,
			description = "Apply Patch 1.2a",
			tooltip = "Latest update from Loki",
			bytes = 198686281,
			Setup.File {
				allowoverwrite = true,
				source = "base:///civ-1.2a-patch.tar.xz",
				filter = function(dest)
					if ( string.match( dest, "CivCTP/civctp" ) ) then
						return dest, "0755"
					end
					return dest
				end
			},

			Setup.File{
				permissions = "0755",
				wildcards = "civctp.dynamic.sh",
			}
		},

		Setup.OptionGroup {
			description = "Language",
			Setup.Option {
				value = true,
				description = "English",
				bytes = 32120111,
				Setup.File {
					source = "base:///civ2english.tar.xz/",
				},
			},

			Setup.Option {
				description = "French",
				bytes = 39276801,
				Setup.File {
					source = "base:///civ2french.tar.xz/",
				},
			},

			Setup.Option {
				description = "German",
				bytes = 36619260,
				Setup.File {
					source = "base:///civ2german.tar.xz/",
				},
			},

			Setup.Option {
				description = "Italian",
				bytes = 40359288,
				Setup.File {
					source = "base:///civ2italian.tar.xz/",
				},
			},

			Setup.Option {
				description = "Spanish",
				bytes = 40114183,
				Setup.File {
					source = "base:///civ2spanish.tar.xz/",
				},
			},
		},

		Setup.Option {
			value = true,
			required = true,
			description = "Install the Sprite Tool",
			bytes = 11273219,
			Setup.File {
				source = "base:///makespr-0.3-x86.tar.xz",
				filter = function(dest)
					if dest == "makespr" then
						return dest, "0755"
					end
					return dest
				end
			},

			Setup.File {
				wildcards = "makespr.sh",
				permissions = "0755",
			},
		},
	},
}
