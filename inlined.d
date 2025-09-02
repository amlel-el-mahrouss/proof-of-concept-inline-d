import std, std.format, std.file, std.stdio, std.system, std.process;

string parseInline(string blob) {
  auto app = appender!string();

  char delimiter = ':';

  auto index = blob.indexOf(delimiter);

  if (index != -1) {
    string before = blob[0 .. index] ~ ";\n\n";

    app.put(before);

    string after = blob[index + 1 .. $];

    app.put("void main(string[] argv)");
    app.put(after);
  }

  return app.data;
}

void main(string[] argv) {
  if (argv.length <= 1) return;

  string blob = readText(argv[1]);

  writeln("/// Pipe '|' this into a compiler!");
  writeln(parseInline(blob));
}
