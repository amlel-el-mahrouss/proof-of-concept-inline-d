import std, std.format, std.file, std.stdio, std.system, std.process;

string parseDLangModule(string blob) {
  auto app = appender!string();

  char delimiter = ':';

  auto index = blob.indexOf(delimiter);

  if (index != -1) {
    string before = blob[0 .. index] ~ ";\n\n";

    app.put(before);

    string after = blob[index + 1 .. $];

    app.put("void main()");
    app.put(after);
  }

  return app.data;
}

void main() {
  string blob = readText("example/hello_world.id");
  writeln(parseDLangModule(blob));
}
