{ ... } @ args:

let
  # Basic string manipulation
  hasPrefix = prefix: str: builtins.substring 0 (builtins.stringLength prefix) str == prefix;
  hasSuffix = suffix: str: let
    lenStr = builtins.stringLength str;
    lenSuffix = builtins.stringLength suffix;
  in lenStr >= lenSuffix && builtins.substring (lenStr - lenSuffix) lenStr str == suffix;
  
  # List operations
  head = builtins.head;
  tail = builtins.tail;
  length = builtins.length;
  elem = x: xs: builtins.elem x xs;
  concatLists = builtins.concatLists;
  
  # Attribute set operations
  attrNames = builtins.attrNames;
  attrValues = builtins.attrValues;
  getAttr = name: set: set.${name};
  hasAttr = name: set: builtins.hasAttr name set;
  
  # Type checking
  isString = x: builtins.isString x;
  isList = x: builtins.isList x;
  isAttrs = x: builtins.isAttrs x;
  isBool = x: builtins.isBool x;
  isInt = x: builtins.isInt x;
  isFloat = x: builtins.isFloat x;
  isPath = x: builtins.isPath x;
  isNull = x: builtins.isNull x;
  isFunction = x: builtins.isFunction x;
  
  # String operations
  concatStrings = builtins.concatStringsSep "";
  concatStringsSep = builtins.concatStringsSep;
  replaceStrings = builtins.replaceStrings;
  
  # File operations
  readFile = builtins.readFile;
  pathExists = builtins.pathExists;
  
  # Debugging
  trace = builtins.trace;
  traceVal = x: trace x x;
  
  # Comparison
  compareVersions = builtins.compareVersions;
  
  # List to attribute set
  listToAttrs = builtins.listToAttrs;
  
  # Filter and map
  filter = builtins.filter;
  map = builtins.map;
  
  # Optional values
  optional = cond: elem: if cond then [elem] else [];
  
  # Debugging helpers
  traceIf = p: msg: x: if p x then trace msg x else x;
  
  # String manipulation
  removeSuffix = suffix: str: let
    lenStr = builtins.stringLength str;
    lenSuffix = builtins.stringLength suffix;
  in if lenStr >= lenSuffix && builtins.substring (lenStr - lenSuffix) lenStr str == suffix
     then builtins.substring 0 (lenStr - lenSuffix) str
     else str;
     
  removePrefix = prefix: str: let
    lenPrefix = builtins.stringLength prefix;
  in if builtins.substring 0 lenPrefix str == prefix
     then builtins.substring lenPrefix (builtins.stringLength str - lenPrefix) str
     else str;
     
  # Type conversion
  toString = builtins.toString;
  
  # Boolean operations
  and = builtins.and;
  or = builtins.or;
  not = builtins.not;
  
  # Math operations
  add = builtins.add;
  sub = builtins.sub;
  mul = builtins.mul;
  div = builtins.div;
  
in {
  inherit
    hasPrefix hasSuffix
    head tail length elem concatLists
    attrNames attrValues getAttr hasAttr
    isString isList isAttrs isBool isInt isFloat isPath isNull isFunction
    concatStrings concatStringsSep replaceStrings
    readFile pathExists
    trace traceVal traceIf
    compareVersions
    listToAttrs
    filter map optional
    removeSuffix removePrefix
    toString
    and or not
    add sub mul div;
} 