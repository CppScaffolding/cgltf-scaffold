-- scaffold geniefile for cgltf

cgltf_script = path.getabsolute(path.getdirectory(_SCRIPT))
cgltf_root = path.join(cgltf_script, "cgltf")

cgltf_includedirs = {
	path.join(cgltf_script, "config"),
	cgltf_root,
}

cgltf_libdirs = {}
cgltf_links = {}
cgltf_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { cgltf_includedirs }
	end,

	_add_defines = function()
		defines { cgltf_defines }
	end,

	_add_libdirs = function()
		libdirs { cgltf_libdirs }
	end,

	_add_external_links = function()
		links { cgltf_links }
	end,

	_add_self_links = function()
		links { "cgltf" }
	end,

	_create_projects = function()

project "cgltf"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		cgltf_includedirs,
	}

	defines {}

	files {
		path.join(cgltf_script, "config", "**.h"),
		path.join(cgltf_root, "**.h"),
		path.join(cgltf_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
