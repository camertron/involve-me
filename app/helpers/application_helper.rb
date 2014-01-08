module ApplicationHelper

  LANGUAGES = {
    "ActionScript" => "as3",
    "AppleScript" => "applescript",
    "Assembly" => "nasm",
    "C" => "c",
    "C#" => "csharp",
    "C++" => "cpp",
    "Clojure" => "clojure",
    "CoffeeScript" => "coffeescript",
    "Common Lisp" => "common-lisp",
    "CSS" => "css",
    "Dart" => "dart",
    "Elixir" => "elixir",
    "Erlang" => "erlang",
    "Go" => "go",
    "Groovy" => "groovy",
    "Haskell" => "haskell",
    "Java" => "java",
    "JavaScript" => "javascript",
    "Lua" => "lua",
    "Markdown" => "markdown",
    "Objective-C" => "objective-c",
    "Pascal" => "pascal",
    "Perl" => "perl",
    "PHP" => "php",
    "Prolog" => "prolog",
    "Python" => "python",
    "R" => "r",
    "Ruby" => "ruby",
    "Rust" => "rust",
    "Scala" => "scala",
    "Scheme" => "scheme",
    "Shell" => "bash",
    "Smalltalk" => "smalltalk",
    "Tcl" => "tcl",
    "Visual Basic" => "visual-basic",
    "XML" => "xml"
  }

  def languages
    @@languages ||= { "Any" => "Any" }.merge(LANGUAGES)
  end

  def default_language
    "Any"
  end

end
