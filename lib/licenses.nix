{ ... } @ args:

let
  # Common open source licenses
  licenses = {
    # GPL family
    gpl1 = { fullName = "GNU General Public License v1"; shortName = "GPL v1"; url = "https://www.gnu.org/licenses/old-licenses/gpl-1.0.html"; };
    gpl2 = { fullName = "GNU General Public License v2"; shortName = "GPL v2"; url = "https://www.gnu.org/licenses/old-licenses/gpl-2.0.html"; };
    gpl3 = { fullName = "GNU General Public License v3"; shortName = "GPL v3"; url = "https://www.gnu.org/licenses/gpl-3.0.html"; };
    gpl3Plus = { fullName = "GNU General Public License v3 or later"; shortName = "GPL v3+"; url = "https://www.gnu.org/licenses/gpl-3.0.html"; };
    lgpl2 = { fullName = "GNU Lesser General Public License v2"; shortName = "LGPL v2"; url = "https://www.gnu.org/licenses/old-licenses/lgpl-2.0.html"; };
    lgpl2Plus = { fullName = "GNU Lesser General Public License v2 or later"; shortName = "LGPL v2+"; url = "https://www.gnu.org/licenses/old-licenses/lgpl-2.0.html"; };
    lgpl3 = { fullName = "GNU Lesser General Public License v3"; shortName = "LGPL v3"; url = "https://www.gnu.org/licenses/lgpl-3.0.html"; };
    lgpl3Plus = { fullName = "GNU Lesser General Public License v3 or later"; shortName = "LGPL v3+"; url = "https://www.gnu.org/licenses/lgpl-3.0.html"; };
    
    # BSD family
    bsd0 = { fullName = "BSD Zero Clause License"; shortName = "BSD-0"; url = "https://spdx.org/licenses/0BSD.html"; };
    bsd2 = { fullName = "BSD 2-clause License"; shortName = "BSD-2"; url = "https://opensource.org/licenses/BSD-2-Clause"; };
    bsd3 = { fullName = "BSD 3-clause License"; shortName = "BSD-3"; url = "https://opensource.org/licenses/BSD-3-Clause"; };
    
    # MIT
    mit = { fullName = "MIT License"; shortName = "MIT"; url = "https://opensource.org/licenses/MIT"; };
    
    # Apache
    asl20 = { fullName = "Apache License 2.0"; shortName = "Apache-2.0"; url = "https://opensource.org/licenses/Apache-2.0"; };
    
    # Creative Commons
    cc0 = { fullName = "Creative Commons Zero v1.0 Universal"; shortName = "CC0"; url = "https://creativecommons.org/publicdomain/zero/1.0/"; };
    cc-by = { fullName = "Creative Commons Attribution 4.0"; shortName = "CC-BY"; url = "https://creativecommons.org/licenses/by/4.0/"; };
    cc-by-sa = { fullName = "Creative Commons Attribution-ShareAlike 4.0"; shortName = "CC-BY-SA"; url = "https://creativecommons.org/licenses/by-sa/4.0/"; };
    
    # Public domain
    publicDomain = { fullName = "Public Domain"; shortName = "Public Domain"; url = ""; };
    
    # Proprietary
    unfree = { fullName = "Unfree"; shortName = "Unfree"; url = ""; };
    unfreeRedistributable = { fullName = "Unfree redistributable"; shortName = "Unfree redistributable"; url = ""; };
  };
  
in {
  inherit licenses;
} 