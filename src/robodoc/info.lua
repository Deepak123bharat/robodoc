-- Information and help text are all stored here

local parser = parser
local tonumber = tonumber
local io = io

local M = {}
package.loaded[...] = M
if setfenv and type(setfenv) == "function" then
	setfenv(1,M)	-- Lua 5.1
else
	_ENV = M		-- Lua 5.2
end

VERSION = "1.20.07.23"

use = [[ROBODoc Version ]]..VERSION..[[(c) 1994-2020 Frans Slothouber, Petteri Kettunen,
				Gergely Budai, Jacco van Weert and Milind Gupta
	ROBODoc comes with ABSOLUTELY NO WARRANTY.
	This is free software, and you are welcome to redistribute it
    under certain conditions; type `robodoc -c' for details.]]
	

-- options table
options = {
    {opt="--dotname NAME",help="Specify the name (and path / options) of DOT tool"},
    {opt="--header_breaks NUMBER",help="Insert a linebreak after every NUMBER header names (default value: 2, set to zero to disable)"},
}

parser:option("--rc","Specify an alternate configuration file.","robodoc.rc",io.open,1,1)
parser:flag("--debug","same as --tell, but with lots more details.")
parser:flag("--tell","ROBODoc will tell you what it is doing.")
parser:flag("--license","Print open source license information and exit.")
parser:flag("--version","Print version info and exit.")
parser:mutex(
	parser:flag("--singledoc","Output as a single document.")
	parser:flag("--singlefile","Output as a single file.")
	parser:flag("--multidoc","Output in multiple documents.")
)
parser:flag("--no_subdirectories","Do no create documentation subdirectories.")
parser:flag("--one_file_per_header","Create a separate documentation file for each header")
parser:flag("--sections","Add sections and subsections.")
parser:flag("--internal","Also include internal headers.")
parser:flag("--ignore_case_when_linking","Ignore the case of the symbols when trying to create crosslinks.")
parser:flag("--internalonly","Only include internal headers.")
parser:flag("--toc","Add a table of contents.")
parser:flag("--index","Add an index.")
parser:flag("--nosource","Do not include SOURCE items.")
parser:flag("--nodesc","Do not descent into subdirectories.")
parser:flag("--nogeneratedwith","Do not add the 'generated by robodoc' message at the top of each documentation file.")
--parser:flag("--cmode","Use ANSI C grammar in source items (html only).")	-- Removed in the Lua version since we can specify keywords directly no need to hardcode C keywords
parser:flag("--lockheader","Recognize only one header marker per file.")
parser:flag("--footless","Do not create the foot of a document.")
parser:flag("--verbal","????????????????????????????????")	---- ################################################???????????????????????
parser:flag("--headless","Do not create the head of a document.")
parser:flag("--nopre","Do not use <PRE> </PRE> in the HTML output.")
parser:flag("--nosort","Do not sort the headers.")
parser:flag("--sectionnameonly","Generate section header with name only.")
parser:mutex(
	parser:flag("--syntaxcolors","Turn on all syntax highlighting features in SOURCE items"),
    parser:flag("--syntaxcolors_enable","Enable only specific syntax highlighting features in SOURCE items (html only)"):args("1-6"):choices({"quotes","squotes","line_comments","block_comments","keywords","non_alpha"})
)
parser:flag("--source_line_numbers","Display original source line numbers for SOURCE items")
-- The below 2 should be added/handled by the latex generator module
--[[
parser:flag("--altlatex","Alternate LaTeX file format (bigger / clearer than normal)")
parser:flag("--latexparts",help="Make the first module level as PART in LaTeX output")
]]
parser.option("--charset","Add character encoding information."):args(1)
parser.option("--ext","Set extension for generated files."):args(1)
parser.option("--css","Specify the stylesheet to use."):convert(io.open):args(1)
-- The following option for troff was removed. The troff exporter should handle it
--parsr:option("--compress","Only supported by TROFF output format. Defines by which program manpages will be compressed. Either bzip2 or gzip."):args(1):choices({"bzip2","gzip"})
parser:option("--mansection","Manual section where pages will be inserted (default: 3).",3,tonumber,1)
parser:option("--documenttitle","Set the document title")
parser:option("--first_section_level","Start the first section not at 1 but at level NUMBER.",1,tonumber,1)
-- doctype_name and doctype_location should be handled directly by the docbook generator
--[[
parser:option("--doctype_name","<!DOCTYPE> tag version"):args(1)
parser:option("--doctype_location","<!DOCTYPE> tag location information."):args(1)
]]
parser:option("--tabsize","Set the tab size."):convert(tonumber):args(1)
parser:option("--tabstops","Set TAB stops"):convert(tonumber):args("1-256")
parser:option("--masterindex","Specify the title and filename for master index page"):args(2)
parser:option("--sourceindex","Specify the title and filename for source files index page"):args(2)


	
authors = {
	"Frans Slothouber",
	"Jacco van Weert",
	"Petteri Kettunen",
	"Bernd Koesling",
	"Thomas Aglassinger",
	"Anthon Pang",
	"Stefan Kost",
	"David Druffner",
	"Sasha Vasko",
	"Kai Hofmann", 
	"Thierry Pierron",
	"Friedrich Haase",
	"Gergely Budai",
	"Milind Gupta"
}

license = [[Distributed under the GNU GENERAL PUBLIC LICENSE
	TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
 See the source archive for a copy of the complete licence
 If you do not have it you can get it from URL
 http://www.gnu.org/copyleft/gpl.html
]] 