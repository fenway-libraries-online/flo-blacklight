module ApplicationHelper
  # Mappings for display and faceting
  @@format_map = {
    "bk"  => "Book",
    "ser" => "Journal or newspaper",
    "map" => "Map or globe",
    "mus" => "Musical recording",
    "sco" => "Musical score",
    "aud" => "Sound recording",
    "com" => "Software or data",
    "dan" => "Dance",
    "dat" => "Data",
    "img" => "Image",
    "kit" => "Kit",
    "lib" => nil,
    "mic" => "Microform",
    "obj" => "Object",
    "onl" => "Online",
    "sli" => "Slide",
    "tac" => "Tactile",
    "vid" => "Video",
  }
  @@institution_map = {
    "eds" => "Episcopal Divinity School",
    "ecl" => "Emerson College",
    "emc" => "Emmanuel College",
    "les" => "Lesley University",
    "mca" => "MassArt",
    "mcp" => "MCPHS",
    "mfa" => "Museum of Fine Arts",
    "nec" => "New England Conservatory",
    "nco" => "New England College of Optometry",
    "smfa"=> "School of the MFA",
    "whe" => "Wheelock College",
    "wit" => "Wentworth Institute of Technology",
  }
  @@access_map = {
    "onl" => "Online",
    "lib" => "At a library",
  }
  @@rda_content_map = {
    "cod" => "Computer dataset",
    "cop" => "Computer program",
    "crd" => "Cartographic dataset",
    "crf" => "Cartographic three-dimensional form",
    "cri" => "Cartographic image",
    "crm" => "Cartographic moving image",
    "crn" => "Cartographic tactile three-dimensional form",
    "crt" => "Cartographic tactile image",
    "ntm" => "Notated music",
    "ntv" => "Notated movement",
    "prm" => "Performed music",
    "snd" => "Sounds",
    "spw" => "Spoken word",
    "sti" => "Still image",
    "tcf" => "Tactile three-dimensional form",
    "tci" => "Tactile image",
    "tcm" => "Tactile notated music",
    "tcn" => "Tactile notated movement",
    "tct" => "Tactile text",
    "tdf" => "Three-dimensional form",
    "tdi" => "Two-dimensional moving image",
    "tdm" => "Three-dimensional moving image",
    "txt" => "Text",
    "xxx" => "Other",
    "zzz" => "Unspecified",
  }
  @@rda_media_map = {
    "c" => "Computer",
    "e" => "Stereographic",
    "g" => "Projected",
    "h" => "Microform",
    "n" => "Unmediated",
    "p" => "Microscopic",
    "s" => "Audio",
    "v" => "Video",
    "x" => "Other",
    "z" => "Unspecified",
  }
  @@rda_carrier_map = {
    "ca" => "Computer tape cartridge",
    "cb" => "Computer chip cartridge",
    "cd" => "Computer disc",
    "ce" => "Computer disc cartridge",
    "cf" => "Computer tape cassette",
    "ch" => "Computer tape reel",
    "ck" => "Computer card",
    "cr" => "Online resource",
    "cz" => "Other",
    "eh" => "Stereograph card",
    "es" => "Stereograph disc",
    "ez" => "Other",
    "gc" => "Filmstrip cartridge",
    "gd" => "Filmslip",
    "gf" => "Filmstrip",
    "gs" => "Slide",
    "gt" => "Overhead transparency",
    "ha" => "Aperture card",
    "hb" => "Microfilm cartridge",
    "hc" => "Microfilm cassette",
    "hd" => "Microfilm reel",
    "he" => "Microfiche",
    "hf" => "Microfiche cassette",
    "hg" => "Microopaque",
    "hh" => "Microfilm slip",
    "hj" => "Microfilm roll",
    "hz" => "Other",
    "mc" => "Film cartridge",
    "mf" => "Film cassette",
    "mo" => "Film roll",
    "mr" => "Film reel",
    "mz" => "Other",
    "na" => "Roll",
    "nb" => "Sheet",
    "nc" => "Volume",
    "nn" => "Flipchart",
    "no" => "Card",
    "nr" => "Object",
    "nz" => "Other",
    "pp" => "Microscope slide",
    "pz" => "Other",
    "sd" => "Audio disc",
    "se" => "Audio cylinder",
    "sg" => "Audio cartridge",
    "si" => "Sound track reel",
    "sq" => "Audio roll",
    "ss" => "Audiocassette",
    "st" => "Audiotape reel",
    "sz" => "Other",
    "vc" => "Video cartridge",
    "vd" => "Videodisc",
    "vf" => "Videocassette",
    "vr" => "Videotape reel",
    "vz" => "Other",
    "zu" => "Unspecified",
  }
  
  # Render coded fields for view and show using the above mappings
  def render_format_value_list(vals)      vals[:value].map { |v| @@format_map[v]      || v } end
  def render_institution_value_list(vals) vals[:value].map { |v| @@institution_map[v] || v } end
  def render_access_value_list(vals)      vals[:value].map { |v| @@access_map[v]      || v } end
  def render_rda_content_value_list(vals) vals[:value].map { |v| @@rda_content_map[v] || v } end
  def render_rda_media_value_list(vals)   vals[:value].map { |v| @@rda_media_map[v]   || v } end
  def render_rda_carrier_value_list(vals) vals[:value].map { |v| @@rda_carrier_map[v] || v } end

  # Ditto for faceting
  def render_format_value(val)      @@format_map[val]      || val end
  def render_institution_value(val) @@institution_map[val] || val end
  def render_access_value(val)      @@access_map[val]      || val end
  def render_rda_content_value(val) @@rda_content_map[val] || val end
  def render_rda_media_value(val)   @@rda_media_map[val]   || val end
  def render_rda_carrier_value(val) @@rda_carrier_map[val] || val end
end
