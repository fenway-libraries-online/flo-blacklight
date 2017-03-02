module ApplicationHelper
  # Mappings for display and faceting
  @@doctype_map ||= {
    "bib" => "Catalog",
    "cres" => "Course reserves",
  }
  @@format_map ||= {
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
    "mic" => "Microform",
    "obj" => "Object",
    "onl" => "Online",
    "sli" => "Slide",
    "tac" => "Tactile",
    "vid" => "Video",
    "xxx" => "Other/unknown",
    'cres' => "Course reserve list",
  }
  @@institution_map ||= {
    "ecl" => "Emerson College",
    "emc" => "Emmanuel College",
    "epi" => "Episcopal Divinity School",
    "flo" => "FLO (all libraries)",
    "les" => "Lesley Sherrill",
    "luc" => "Lesley Moriarty",
    "mca" => "MassArt",
    "mcp" => "MCPHS Boston",
    "mcpm" => "MCPHS Manchester",
    "mcpw" => "MCPHS Worcester",
    "mfa" => "Museum of Fine Arts",
    "naf" => "NEC Firestone Audio Library",
    "nas" => "NEC Spaulding Library",
    "nco" => "New England College of Optometry",
    "wen" => "Wentworth Institute of Technology",
    "whe" => "Wheelock College",
    # Legacy and deprecated
    "eds" => "Episcopal Divinity School",
    "eme" => "Emerson College",
    "emm" => "Emmanuel College",
    "aib" => "Lesley Moriarty",
    "nec" => "New England Conservatory",
    "smfa"=> "School of the MFA",
    "wor" => "MCPHS (Worcester)",
    "wit" => "Wentworth Institute of Technology",
    "mas" => "MassArt",
  }
  @@collection_map ||= {
    "lesley" => "Lesley (all)",
  }
  @@access_map ||= {
    "onl" => "Online",
    "lib" => "At a library",
  }
  @@rda_content_map ||= {
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
  @@rda_media_map ||= {
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
  @@rda_carrier_map ||= {
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
  @@item_status_map ||= [
    nil,
    "Not checked out",
    "Charged",
    "Renewed",
    "Overdue",
    "Recall Request",
    "Hold Request",
    "On Hold",
    "In Transit",
    "In Transit Discharged",
    "In Transit On Hold",
    "Discharged",
    "Missing",
    "Lost",  ### "Lost--Library Applied",
    "Lost",  ### "Lost--System Applied",
    "Claims Returned",
    "Damaged",
    "Withdrawn",
    "At Bindery",
    "Cataloging Review",
    "Circulation Review",
    "Scheduled",
    "In Process",
    "Call Slip Request",
    "Short Loan Request",
    "Remote Storage Request",
  ]
  
  # Render coded fields for view and show using the above mappings
  def render_doctype_value_list(vals)     vals[:value].map { |v| @@doctype_map[v]     || v } end
  def render_format_value_list(vals)      vals[:value].map { |v| @@format_map[v]      || v } end
  def render_institution_value_list(vals) vals[:value].map { |v| @@institution_map[v] || v } end
  def render_collection_value_list(vals)  vals[:value].map { |v| @@collection_map[v]  || v } end
  def render_access_value_list(vals)      vals[:value].map { |v| @@access_map[v]      || v } end
  def render_rda_content_value_list(vals) vals[:value].map { |v| @@rda_content_map[v] || v } end
  def render_rda_media_value_list(vals)   vals[:value].map { |v| @@rda_media_map[v]   || v } end
  def render_rda_carrier_value_list(vals) vals[:value].map { |v| @@rda_carrier_map[v] || v } end

  # Ditto for faceting
  def render_doctype_value(val)     @@doctype_map[val]     || val end
  def render_format_value(val)      @@format_map[val]      || val end
  def render_institution_value(val) @@institution_map[val] || val end
  def render_collection_value(val)  @@collection_map[val]  || val end
  def render_access_value(val)      @@access_map[val]      || val end
  def render_rda_content_value(val) @@rda_content_map[val] || val end
  def render_rda_media_value(val)   @@rda_media_map[val]   || val end
  def render_rda_carrier_value(val) @@rda_carrier_map[val] || val end

  def hm2time(h, m)
      ampm = 'AM'
      if h == '00'
        h = '12'
      elsif h == '12'
        ampm = 'PM'
      elsif h > '12'
        ampm = 'PM'
        h = sprintf('%02d', h.to_i - 12)
      end
      return "#{h}:#{m} #{ampm}"
  end

  # Other mappings
  def render_item_status(item)
    copy  = item['copy']
    stat  = item['status']
    sdate = item['status_date']
    due   = item['due_date']
    if stat.nil?
      return ''
    elsif stat.class != Array
      stat = [stat]
    end
    str = ""
    # str = if copy.nil? then '' else "c.#{copy} " end
    str += stat.map{ |s| @@item_status_map[s.to_i] }.join(", ")
    if !due.nil?
      t = hm2time(due['H'], due['M'])
      str += " (due #{due['m']}-#{due['d']}-#{due['Y']} at #{t})"
    elsif !sdate.nil?
      ### Do something with the status date
    end
    return str
  end

  def read_location_map(f)
    begin
      file = File.open(f, 'r')
      hash = {}
      while !file.eof?
        line = file.readline
        key, val = line.split(" ", 2)
        hash[key] = val
      end
    rescue
      STDERR.puts "Can't read from #{f}"
      hash = @@location_map_static
    end
    return hash
  end
  def render_location_value(val)
    @@location_map ||= read_location_map(Rails.root.join('local', 'conf', 'locations.map'))
    @@location_map[val] || val
  end
  @@location_map_static = {
    "AIB-ALUM" => "Lesley Moriarty Library -- Lesley-LUCAD Alumni/ae Collection",
    "AIB-CAT" => "Lesley-Moriarty Library Cataloging Desk",
    "AIB-CIRC" => "Lesley-LUCAD Library Circulation Desk",
    "AIB-DISPLY" => "Lesley-Moriarty Library Display Case",
    "AIB-DSPOFF" => "Lesley-Moriarty Library Display Offsite",
    "AIB-DVD" => "Lesley-Moriarty Library DVD",
    "AIB-ENCYC" => "Lesley-Moriarty Library Encyclopedias",
    "AIB-FOLIO" => "Lesley-Moriarty Library Folios",
    "AIB-MEDCD" => "Lesley-Moriarty Library Media CD",
    "AIB-MEDIA" => "Lesley-Moriarty Library Media",
    "AIB-OFFICE" => "Lesley-Moriarty Library Office",
    "AIB-OVER" => "Lesley-Moriarty Library Oversize",
    "AIB-PASS" => "Lesley-Moriarty Library Circulation Desk",
    "AIB-PER" => "Lesley-Moriarty Library Periodicals",
    "AIB-RARE" => "Lesley-Moriarty Library Rare Books",
    "AIB-REF" => "Lesley-Moriarty Library Reference",
    "AIB-RESERV" => "Lesley-Moriarty Library Reserves",
    "AIB-SPRESV" => "Lesley-Moriarty Library Special Reserves",
    "AIB-STACKS" => "Lesley-Moriarty Library Stacks",
    "AIB-VIDEO" => "Lesley-Moriarty Library Video",
    "ECL" => "Emerson Main Stacks",
    "ECL-ACQ" => "Emerson Acquisitions",
    "ECL-ARCV" => "Emerson Archives",
    "ECL-BIND" => "Emerson Bindery",
    "ECL-CARSER" => "Emerson Career Services",
    "ECL-CAT" => "Emerson Cataloging",
    "ECL-CIRC" => "Emerson Circulation Desk",
    "ECL-CIS" => "Emerson Computer & Internet Services Office",
    "ECL-DIR" => "Emerson Directors Office",
    "ECL-DSPL" => "Emerson Display",
    "ECL-EBOOKS" => "Emerson EBooks",
    "ECL-EJOURN" => "Emerson EJournals",
    "ECL-ILL" => "Emerson ILL Office",
    "ECL-INDEX" => "Emerson Indexes",
    "ECL-IR" => "Emerson Information Resources",
    "ECL-MCRFM" => "Emerson Microform",
    "ECL-MEDIA" => "Emerson Media Collection - Check Media Desk for Availability",
    "ECL-MEDIAC" => "Emerson Circulating Media Collection",
    "ECL-MSCOFF" => "Emerson Media Collection Desk",
    "ECL-NEWSPR" => "Emerson Newspaper",
    "ECL-ONLINE" => "Emerson Streaming Media",
    "ECL-PERIOD" => "Emerson Periodicals",
    "ECL-READYR" => "Emerson Ready Reference - Does Not Circulate",
    "ECL-REF" => "Emerson Reference - Does Not Circulate",
    "ECL-REFOFF" => "Emerson Reference Office",
    "ECL-REMOTE" => "Emerson Remote Storage",
    "ECL-RESERV" => "Emerson Reserve",
    "ECL-STOR02" => "Emerson Storage",
    "ECL-STOR03" => "Emerson Storage",
    "ECL-STOR04" => "Emerson Storage",
    "ECL-STOR05" => "Emerson Storage",
    "ECL-STOR06" => "Emerson Storage",
    "ECL-STOR08" => "Emerson Storage",
    "ECL-STOR97" => "Emerson Storage",
    "ECL-STOR98" => "Emerson Storage",
    "ECL-STOR99" => "Emerson Storage",
    "ECL-THESIS" => "Emerson Thesis - Does Not Circulate",
    "ECL-VC" => "Emerson Virtual Catalog",
    "ECLTVC" => "ECL Test VC Loc",
    "EDS-ALUM" => "Lesley/EDS-Sherrill Library - EDS Alumni/ae Collection",
    "EDS-ARCV" => "Lesley/EDS-Sherrill Library EDS Archives",
    "EDS-ARCVF" => "Lesley/EDS-Sherrill Library Archives Folio",
    "EDS-ATLAS" => "Lesley/EDS-Sherrill Library Atlas Stand",
    "EDS-CASUAL" => "Lesley/EDS-Sherrill Library Atrium",
    "EDS-CAT" => "Lesley-Sherrill Library Collection Services Office",
    "EDS-EBOOKS" => "Lesley/EDS-Sherrill Library EBook",
    "EDS-EJOURN" => "Lesley/EDS-Sherrill Library EJournal",
    "EDS-FICHE" => "Lesley/EDS-Sherrill Library Microform Cabinet",
    "EDS-FILM" => "Lesley/EDS-Sherrill Library Microform Cabinet",
    "EDS-FOLIO" => "Lesley/EDS-Sherrill Folio. Call #: A-E on 3rd, F-Z on 2nd Fl",
    "EDS-HODGES" => "Lesley/EDS-Sherrill Library Hodges Special Collection",
    "EDS-MEDIA" => "Lesley/EDS-Sherrill Library Media Cabinet,1st floor hallway",
    "EDS-NEW" => "Lesley/EDS-Sherrill Library Atrium New & Noteworthy",
    "EDS-NEWS" => "Lesley/EDS-Sherrill Library Atrium",
    "EDS-OFFICE" => "Lesley/EDS-Sherrill Library Office",
    "EDS-ONLINE" => "Lesley/EDS-Sherrill Library Online Resource",
    "EDS-PER" => "Lesley/EDS-Sherrill Library Journal Collection",
    "EDS-PORT" => "Lesley/EDS-Sherrill Library Portfolio - 2nd Floor",
    "EDS-READY" => "Lesley/EDS-Sherrill Library Ready Reference",
    "EDS-REF" => "Lesley/EDS-Sherrill Library Reference Stacks",
    "EDS-REFF" => "Lesley/EDS-Sherrill Library Reference Folio",
    "EDS-RESERV" => "Lesley/EDS-Sherrill Library Reserve",
    "EDS-STACKS" => "Lesley/EDS-Sherrill Library Main Stacks",
    "EMC-CAT" => "Emmanuel Cataloging Desk",
    "EMCACQ" => "Emmanuel Acquisitions",
    "EMCARC" => "Emmanuel Archives",
    "EMCAUTH" => "Emmanuel Authors",
    "EMCB" => "Special Collections Emmanuel Room",
    "EMCBIND" => "Emmanuel Bindery",
    "EMCCD" => "Emmanuel CDROM",
    "EMCCFIC" => "Emmanuel Catholic Literature",
    "EMCCIRC" => "Emmanuel Circulation",
    "EMCDIR" => "Emmanuel Director's Office",
    "EMCDISP" => "Emmanuel Display",
    "EMCDNU" => "Emmanuel Do Not Use",
    "EMCFFIC" => "Emmanuel Foreign Literature",
    "EMCILL" => "Emmanuel Interlibrary Loan",
    "EMCINDEX" => "Emmanuel Index",
    "EMCJSTOR" => "Emmanuel JSTOR",
    "EMCJSTORPU" => "Emmanuel JSTOR",
    "EMCJUV" => "Emmanuel Juvenile",
    "EMCLEIS" => "Emmanuel Leisure",
    "EMCMED" => "Emmanuel Media Office",
    "EMCMICRO" => "Emmanuel Microfilm and Microfiche",
    "EMCMUL" => "Emmanuel Mulvaney Leadership",
    "EMCNEW" => "Emmanuel New Book",
    "EMCONL" => "Emmanuel Online",
    "EMCOS" => "Emmanuel Oversized Book",
    "EMCPER" => "Emmanuel Periodical",
    "EMCREF" => "Emmanuel Reference",
    "EMCREFDK" => "Emmanuel Reference Desk",
    "EMCRES" => "Emmanuel Reserve",
    "EMCRYAN" => "Emmanuel Ryan Collection",
    "EMCSER" => "Emmanuel Serials",
    "EMCSTKS" => "Emmanuel Main Stacks",
    "EMCSTOR" => "Emmanuel Storage",
    "EMCTECH" => "Emmanuel Technical Services",
    "EMCTVC" => "EMC Test VC Loc",
    "EMCVC" => "Emmanuel Virtual Catalog",
    "EMCVIDEO" => "Emmanuel Video",
    "FLO-CREDO" => "available online (Credo Reference Premium)",
    "FLO-EBL" => "available online (EBL)",
    "FLO-EBRARY" => "available online (Ebrary)",
    "FLO-EXCEPT" => "",
    "FLO-MLSEBL" => "available online (EBL)",
    "FLO-ONLINE" => "freely available online",
    "FLOCIRC" => "FLO Circ Happening",
    "FLODNU" => "FLO Do Not Use",
    "FLOPIC" => "-Choose a pickup location (REQUIRED)",
    "FLOVC" => "Commonwealth Catalog",
    "LES-ACQ" => "Lesley-Sherrill Library Acquisitions Desk",
    "LES-ALUM" => "Lesley/EDS-Sherrill Library - Lesley Alumni/ae Collection",
    "LES-ARCV" => "Lesley/EDS-Sherrill Library Archives",
    "LES-ATLAS" => "Lesley/EDS-Sherrill Library Atlas Stand",
    "LES-BROWSE" => "Lesley-Sherrill Library Browsing Collection",
    "LES-CASUAL" => "Lesley/EDS-Sherrill Library Atrium",
    "LES-CAT" => "Lesley-Sherrill Library Staff Offices",
    "LES-CIRC" => "Lesley/EDS-Sherrill Library Circulation Desk",
    "LES-DSPOFF" => "Lesley/EDS-Sherrill Library Display Offsite",
    "LES-EBOOKS" => "Lesley/EDS-Sherrill Library EBook",
    "LES-EJOURN" => "Lesley/EDS-Sherrill Library EJournal",
    "LES-FICHE" => "Lesley/EDS-Sherrill Library Microform Cabinet",
    "LES-FILM" => "Lesley/EDS-Sherrill Library Microform Cabinet",
    "LES-FOLIO" => "Lesley/EDS-Sherrill Folio. Call #: A-E on 3rd, F-Z on 2nd Fl",
    "LES-ILL" => "Lesley/EDS-Sherrill Library ILL",
    "LES-INDBAS" => "Lesley Indexes - Basement Stacks",
    "LES-INDMIC" => "Lesley Indexes - Microform Room",
    "LES-INDREF" => "Lesley Indexes - Reference Area",
    "LES-NEW" => "Lesley/EDS-Sherrill Library Atrium New & Noteworthy",
    "LES-NEWS" => "Lesley/EDS-Sherrill Library Atrium",
    "LES-OFFICE" => "Lesley-Sherrill Library Office",
    "LES-ONLINE" => "Lesley/EDS-Sherrill Library Online Resource",
    "LES-PASS" => "Lesley/EDS-Sherrill Library Circulation Desk",
    "LES-PER" => "Lesley/EDS-Sherrill Library Journal Collection",
    "LES-PERIOD" => "Lesley-Sherrill Library Periodicals Desk",
    "LES-READY" => "Lesley/EDS-Sherrill Library Ready Reference",
    "LES-REF" => "Lesley/EDS-Sherrill Library Reference Stacks",
    "LES-REFF" => "Lesley/EDS-Sherrill Library Reference Folio",
    "LES-RESERV" => "Lesley/EDS-Sherrill Library Reserves",
    "LES-STACKS" => "Lesley/EDS-Sherrill Library Main Stacks",
    "LES-STUDY" => "Lesley Study Room - 3rd Floor",
    "LES-VC" => "Lesley-Sherrill Library Virtual Catalog",
    "LESDISPLAY" => "Lesley/EDS-Sherrill Library Display Atrium",
    "LESFEATURE" => "Lesley/EDS-Sherrill Library Featured Materials - 1st floor",
    "LESK-CAT" => "LESK-CAT",
    "LESK-DESK" => "Lesley/EDS-Sherrill Library Videos",
    "LESK-EARLY" => "Lesley/EDS-Sherrill Library Juv Leveled Readers",
    "LESK-FICT" => "Lesley/EDS-Sherrill Library Juv Fiction",
    "LESK-MAG" => "Lesley-Sherrill Library Juvenile Magazines",
    "LESK-MEDCD" => "Lesley/EDS-Sherrill Library Atrium - Music CDs",
    "LESK-MEDIA" => "Lesley/EDS-Sherrill Library Atrium - Media",
    "LESK-NEW" => "Lesley/EDS-Sherrill Library TRC Room Display",
    "LESK-OVER" => "Lesley-Sherrill Library TRC Oversize",
    "LESK-PICT" => "Lesley/EDS-Sherrill Library Juv Picture Books",
    "LESK-PORT" => "Lesley/EDS-Sherrill Library TRC Big Books",
    "LESK-REF" => "Lesley/EDS-Sherrill Library TRC Reference",
    "LESK-REFM" => "Lesley Kresge Library Media Center (UHALL)",
    "LESK-REFT" => "Lesley Kresge Center Test Reference",
    "LESK-TESTS" => "Lesley/EDS-Sherrill Library Tests",
    "LESK-TRC" => "Lesley/EDS-Sherrill Library Teaching Resources Collection",
    "LESK-TRCTX" => "Lesley/EDS-Sherrill Library TRC Textbooks",
    "LESKDSPLAY" => "Lesley/EDS-Sherrill Library Finnegan Collection Display",
    "LESKRESERV" => "Lesley Kresge Library Media Center Reserves (UHALL)",
    "LESKSTACKS" => "Lesley/EDS-Sherrill Library Juv Non-Fiction",
    "MCA-ACQ" => "MassArt Acquisitions Desk",
    "MCA-ARCHIV" => "MassArt Archives",
    "MCA-ARTBKS" => "MassArt Artists' Books",
    "MCA-AVCIRC" => "MassArt AVMS Circulation",
    "MCA-AVLOST" => "",
    "MCA-AVMS" => "MassArt AVMS Dept.",
    "MCA-AVMSME" => "MassArt AVMS Media",
    "MCA-AVMain" => "MassArt AVMS Maintenance",
    "MCA-AVPerm" => "",
    "MCA-AVSURP" => "",
    "MCA-AVTran" => "",
    "MCA-AVWITH" => "",
    "MCA-CAT" => "MCA-CAT",
    "MCA-CIRC" => "MassArt Circulation Desk",
    "MCA-CIRCUL" => "MassArt Library Circulation Desk",
    "MCA-FOLIO" => "MassArt Folios",
    "MCA-INDEX" => "MassArt Index Table",
    "MCA-LAB" => "MassArt Library Computer Lab",
    "MCA-MAIN" => "MassArt Main",
    "MCA-MEDIA" => "MassArt Media",
    "MCA-MPA" => "MassArt Media & Performing Arts Dept.",
    "MCA-NEWBK" => "MassArt New Book Display",
    "MCA-OVERSZ" => "MassArt Oversized",
    "MCA-RECORD" => "MassArt Record Albums",
    "MCA-REF" => "MassArt Reference",
    "MCA-REFCD" => "MassArt Reference -- CD",
    "MCA-REFCDR" => "MassArt Reference--CD-ROM",
    "MCA-SERIAL" => "MassArt Periodicals",
    "MCA-SLCIRC" => "MassArt Slide Lib Circ",
    "MCA-SLIDE" => "MassArt Slide Library",
    "MCA-SpC-OS" => "MassArt Special Collections Oversized",
    "MCA-SpCol" => "MassArt Special Collections",
    "MCA-TS" => "MassArt Technical Services Dept.",
    "MCA-VC" => "MassArt Virtual Catalog",
    "MCA-VIDLAB" => "MassArt Video Lab",
    "MCA-WDN" => "MassArt--Withdrawn, being considered for reorder",
    "MCACASSETT" => "MassArt Main--Cassettes",
    "MCAFVVAULT" => "",
    "MCAMAINCD" => "MassArt Main -- CDs",
    "MCAMAINCDR" => "MassArt Main -- CD-ROMs",
    "MCARESERVE" => "MassArt Reserves",
    "MCP-4thFLR" => "MCPHS Retrospective Pharmacy Collection",
    "MCP-ACQ" => "MCPHS Acquisitions Desk",
    "MCP-ACQW" => "MCPHS Acquisitions Desk - Worcester Campus",
    "MCP-ARCHIV" => "MCPHS Archives",
    "MCP-CAT" => "MCP-CAT",
    "MCP-CDROM" => "MCPHS CD-ROM Cabinet",
    "MCP-CIRC" => "MCPHS Circulation - Boston Campus",
    "MCP-CIRDSK" => "MCP-CIRDSK",
    "MCP-DIR" => "MCPHS Director's Office",
    "MCP-DIT" => "MCPHS Thesis Storage",
    "MCP-EBARC" => "MCPHS eBook Archives",
    "MCP-ELECT" => "MCPHS Electronic Collections",
    "MCP-EMEDIA" => "",
    "MCP-FACDEV" => "",
    "MCP-L.R." => "MCPHS Leisure Reading Collection",
    "MCP-LIBOFF" => "MCPHS Librarians' Offices",
    "MCP-LOCKCS" => "MCPHS Locked Case - 4th Floor Storage",
    "MCP-MANC" => "MCPHS Circulation - Manchester Campus",
    "MCP-MANCIR" => "MCPHS Manchester Circulation Desk",
    "MCP-MANMED" => "MCPHS Media - Manchester Campus",
    "MCP-MANREF" => "MCPHS Reference - Manchester Campus",
    "MCP-MANRES" => "MCPHS Manchester Reserve ",
    "MCP-MEDIA" => "MCPHS Media",
    "MCP-REF" => "MCPHS Reference - Boston Campus",
    "MCP-REFDSK" => "MCPHS Reference Desk",
    "MCP-REPAIR" => "MCPHS History of Pharmacy Collection",
    "MCP-RESDK" => "MCPHS Reserve Desk - Boston Campus",
    "MCP-SERIAL" => "MCPHS Journals - Boston Campus",
    "MCP-STORAG" => "MCPHS W-Offsite Storage",
    "MCP-TECH" => "MCPHS Technical Services",
    "MCP-THESIS" => "MCPHS Thesis Collection",
    "MCP-VCR" => "MCPHS Video Cabinet",
    "MFA-02" => "MFA Art of Asia, Africa and Oceania Library ",
    "MFA-02A" => "MFA Art of Asia, Africa and Oceania Library, 02A",
    "MFA-02B" => "MFA Art of Asia, Africa and Oceania Library, 02B",
    "MFA-03" => "MFA Art of the Americas and Art of Europe Library",
    "MFA-04" => "MFA Art of the Ancient World Library",
    "MFA-04A" => "MFA Art of the Ancient World Library",
    "MFA-04B" => "MFA Art of the Ancient World Library",
    "MFA-05" => "MFA Musical Instruments Library",
    "MFA-06" => "MFA Prints, Drawings and Photographs Library",
    "MFA-07" => "MFA Paper Conservation Library",
    "MFA-08" => "MFA Textile and Fashion Arts Library",
    "MFA-09" => "MFA Conservation & Collections Management Library",
    "MFA-09A" => "MFA Textile Conservation Library",
    "MFA-AB" => "MFA Main Library, Horticultural Hall, Artists' Books",
    "MFA-ADA" => "MFA Art of the Americas and Art of Europe Library",
    "MFA-ARC" => "MFA Archives ",
    "MFA-Acq" => "MFA-Acquisitions",
    "MFA-C" => "MFA Main Library, Horticultural Hall, Special Collections",
    "MFA-CAT" => "MFA-CAT",
    "MFA-CONS" => "MFA Conservation & Collections Management Library",
    "MFA-Circ" => "MFA Main Library, Horticultural Hall, Circulation Desk",
    "MFA-DA" => "MFA Art of the Ancient World Library",
    "MFA-DC" => "MFA Art of the Ancient World Library",
    "MFA-DE" => "MFA Art of the Ancient World Library",
    "MFA-DI" => "MFA Art of Asia, Africa and Oceania Library, 02A",
    "MFA-DJ" => "MFA Art of Asia, Africa and Oceania Library",
    "MFA-DMI" => "MFA Musical Instruments Library",
    "MFA-DP" => "MFA Prints, Drawings and Photographs Library",
    "MFA-DPA" => "MFA Art of the Americas and Art of Europe Library",
    "MFA-DPC" => "MFA Paper Conservation Library",
    "MFA-DT" => "MFA Textile and Fashion Arts Library",
    "MFA-EDA" => "MFA Art of the Americas and Art of Europe Library",
    "MFA-ERESOU" => "MFA and SMFA Electronic Collections",
    "MFA-MAIN" => "MFA Main Library, Horticultural Hall",
    "MFA-REF" => "MFA Main Library, Horticultural Hall, Reference",
    "MFA-REFM" => "MFA Main Library, Horticultural Hall, Reference/Microform",
    "MFA-SCH" => "School of the Museum of Fine Arts",
    "MFA-SCH-AB" => "School of the Museum of Fine Arts, Artists' Books",
    "MFA-SCH-C" => "School of the Museum of Fine Arts, Special Collections",
    "MFA-SCH-ON" => "MFA-SCH-ON",
    "MFA-SCH-RB" => "School of the Museum of Fine Arts, Special Collections",
    "MFA-SCH-VF" => "School of the Museum of Fine Arts, Vertical Files",
    "MFA-SCHARC" => "School of the Museum of Fine Arts, Artist Resource Center",
    "MFA-SCHREF" => "School of the Museum of Fine Arts, Reference",
    "MFA-SER" => "MFA-Serials",
    "MFA-Stor" => "MFA Offsite Storage",
    "MFA-VF" => "MFA Main Library, Horticultural Hall, Vertical Files",
    "MFA-WS" => "MFA Library Waystation",
    "MFASCH-CAT" => "MFASCH-CAT",
    "MFASCH-NEW" => "School of the Museum of Fine Arts, New Books",
    "MFASCHCIRC" => "School of the Museum of Fine Arts, Circulation Desk",
    "NCO-BOARDS" => "NECO National Boards Study Materials",
    "NCO-CDROM" => "NECO CD/DVD-ROMs; ask for help at circ. desk.",
    "NCO-CIRC" => "NECO Circulation Desk",
    "NCO-DISPLY" => "NECO Reading Room",
    "NCO-DRMRES" => "NECO Dormant Reserves",
    "NCO-EBOOK" => "NECO eBooks",
    "NCO-EDUC" => "NECO Education and eLearning Resources",
    "NCO-EJRNLS" => "NECO eJournals",
    "NCO-JRNLS" => "NECO Journal Stacks",
    "NCO-LAPTOP" => "NECO Laptops",
    "NCO-MARCO" => "NECO Marco PCs",
    "NCO-MEDIA" => "NECO Slides and VHS",
    "NCO-MYERS" => "NECO Myers Collection",
    "NCO-NEEC" => "New England Eye Commonwealth",
    "NCO-NEER" => "New England Eye Roslindale",
    "NCO-NEW" => "NECO New Books",
    "NCO-OFFICE" => "NECO Library Office; ask for help at circ. desk.",
    "NCO-OVERSZ" => "NECO Oversize",
    "NCO-REF" => "NECO Reference",
    "NCO-REFOVR" => "NECO Reference Oversize",
    "NCO-REFPC" => "NECO Reference PCs",
    "NCO-RESERV" => "NECO Reserves",
    "NCO-REVIEW" => "NECO Review",
    "NCO-SERVER" => "NECO CD-ROM Server",
    "NCO-SPCOLL" => "NECO Historical Studies Room",
    "NCO-STACKS" => "NECO Book Stacks",
    "NEC" => "New England Conservatory Spaulding Library",
    "NEC-AQDSK" => "New England Conservatory Spaulding Acquisitions Office",
    "NEC-AVRARE" => "New England Conservatory Firestone Rare Audio/Visual",
    "NEC-BINDER" => "New England Conservatory Spaulding Bindery",
    "NEC-BNDNCR" => "New England Conservatory Spaulding Bindery Non-Circulating",
    "NEC-CRDESK" => "New England Conservatory Spaulding Circulation Desk",
    "NEC-DESK" => "New England Conservatory Spaulding Desk",
    "NEC-DSKNCR" => "New England Conservatory Spaulding Desk Non-Circulating",
    "NEC-FAQDSK" => "New England Conservatory Firestone Acquisitions Office",
    "NEC-FCRDSK" => "New England Conservatory Firestone Circulation Desk",
    "NEC-FIRE" => "New England Conservatory Firestone Library",
    "NEC-FIRNCR" => "New England Conservatory Firestone Non-Circulating",
    "NEC-INDEX" => "New England Conservatory Spaulding Index Table",
    "NEC-MINI" => "New England Conservatory Spaulding Miniature Scores",
    "NEC-MINNCR" => "New England Conservatory Spaulding Miniature Scores Non-Circ",
    "NEC-NONCIR" => "New England Conservatory Spaulding Non-Circulating",
    "NEC-OFFICE" => "New England Conservatory Spaulding Office",
    "NEC-ONLINE" => "New England Conservatory Firestone Library",
    "NEC-OVRNCR" => "New England Conservatory Spaulding Oversize Non-Circulating",
    "NEC-OVRSIZ" => "New England Conservatory Spaulding Oversize",
    "NEC-PRES" => "New England Conservatory President's Library",
    "NEC-REFER" => "New England Conservatory Spaulding Reference",
    "NEC-RESERV" => "New England Conservatory Spaulding Reserve Desk",
    "NEC-RESFIR" => "New England Conservatory Firestone Reserve Desk",
    "NEC-SRDESK" => "New England Conservatory Spaulding Non-Circulating",
    "NEC-STOR" => "New England Conservatory Spaulding Library Storage",
    "NEC-VAULT" => "New England Conservatory Spaulding Library Vault",
    "NECF-CAT" => "New England Conservatory Firestone Cataloging Office",
    "NECF-VC" => "New England Conservatory Firestone Virtual Catalog",
    "NECS-CAT" => "New England Conservatory Spaulding Cataloging Office",
    "NECS-VC" => "New England Conservatory Spaulding Virtual Catalog",
    "NECTVC" => "NEC Test VC Loc",
    "WHE-1" => "Wheelock Floor 1",
    "WHE-1Case" => "Wheelock Display Case",
    "WHE-1M" => "Wheelock Floor 1M (library use only)",
    "WHE-1NEW" => "Wheelock New Books Shelf",
    "WHE-2" => "Wheelock Floor 2",
    "WHE-2(NC)" => "Wheelock Floor 2 (library use only)",
    "WHE-2Disp" => "Wheelock Floor 2 Display",
    "WHE-2M" => "Wheelock Floor 2M",
    "WHE-2M(NC)" => "Wheelock Floor 2M (library use only)",
    "WHE-3" => "Wheelock Floor 3",
    "WHE-3M" => "Wheelock Floor 3M",
    "WHE-4Disp" => "Wheelock Floor 4 Display",
    "WHE-Acq" => "WHE Acquisitions Desk",
    "WHE-Archve" => "Wheelock Archives (library use only)",
    "WHE-Browse" => "Wheelock Popular Reading Collection, Floor 1",
    "WHE-CAT" => "WHE Technical Services",
    "WHE-CIRC" => "Wheelock College Library Desk",
    "WHE-CollOf" => "Wheelock-Floor2 Collections Office",
    "WHE-Desk" => "Wheelock Circulation Desk",
    "WHE-DigRef" => "Wheelock Digital Reference",
    "WHE-EBook" => "Wheelock E-Book",
    "WHE-ECDisp" => "Wheelock Earl Center for Learning and Innovation Display",
    "WHE-LibOff" => "Wheelock-Library Office",
    "WHE-Main" => "Wheelock Main",
    "WHE-Online" => "Wheelock Online Resource",
    "WHE-PERMRS" => "Wheelock Circulation Desk (Permanent Reserve)",
    "WHE-PubSer" => "WHE Floor-1M Public Services Office",
    "WHE-RC(NC)" => "Wheelock Earl Center (EC use only)",
    "WHE-RCCirc" => "Wheelock Earl Center for Learning and Innovation Circulation",
    "WHE-REF" => "WHE Reference Desk",
    "WHE-ResCtr" => "Earl Center for Learning and Innovation",
    "WHE-SER" => "WHE Floor 3 - Serials Desk",
    "WHE-Stor" => "Wheelock Storage (library use only)",
    "WHE-Sys" => "Wheelock Systems Office",
    "WHE-TeStor" => "Wheelock Test Storage (Please see librarian for assistance)",
    "WHE-Tech" => "Wheelock-Lower Level Tech. Specialist's Desk",
    "WHE-VC" => "Wheelock Virtual Catalog",
    "WIT-CAT" => "Wentworth Cataloging Desk",
    "WIT-EBOOKS" => "Wentworth E-Books",
    "WITACQDESK" => "Wentworth Acquisitions Desk",
    "WITCIRC" => "Wentworth Circulation Desk",
    "WITCIRCDSK" => "Wentworth Circulation Desk",
    "WITDISPLAY" => "Wentworth Display Area",
    "WITDRAWER" => "Wentworth Circulation Desk --  CD/DVD Drawers",
    "WITFICTION" => "Wentworth Fiction",
    "WITONLINE" => "Wentworth Online Resource",
    "WITORDER" => "Wentworth order",
    "WITOVERSIZ" => "Wentworth - Oversized on Main Level",
    "WITREF" => "Wentworth Reference--Main Level",
    "WITSERDSK" => "Wentworth Serials",
    "WITSTACKS" => "Wentworth Stacks--Upper Level",
    "WITSTAFF" => "Wentworth Staff Collection",
    "WITVC" => "Wentworth Virtual Catalog",
    "WITVIEW" => "Wentworth Movies",
    "WOR-CAT" => "WOR-CAT",
    "WOR-CIRC" => "MCPHS Circulation - Worcester Campus",
    "WOR-CIRDSK" => "MCPHS Circulation Desk - Worcester Campus",
    "WOR-MEDIA" => "MCPHS Media - Worcester Campus",
    "WOR-REF" => "MCPHS Reference - Worcester Campus",
    "WOR-SER" => "MCPHS Journals - Worcester Campus",
    "emclib" => "",
    "review" => "review",
    "zmedia" => "zMedia Scheduling",
  }
end
