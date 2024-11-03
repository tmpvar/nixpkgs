{ lib, stdenv, fetchFromGitHub, cmake, python3 }:
stdenv.mkDerivation {
  pname = "shaderSlang";
  version = "2024.14.4";
  src = fetchFromGitHub {
    owner = "shader-slang";
    repo = "slang";
    rev = "v2024.14.4";
    fetchSubmodules = true;
    hash = "sha256-oEGcprgdDLDyhjMXGVSE7kbhlCW3RY2CBd2meij22dU=";
  };

  cmakeFlags = [
    "-DSLANG_ENABLE_XLIB=OFF"
    "-DSLANG_BUILD_EXAMPLES=OFF"
    "-DSLANG_ENABLE_PREBUILT_BINARIES=OFF"
    "-DSLANG_ENABLE_SLANG_RHI=OFF"
  ];

  nativeBuildInputs = [ cmake python3 ];

  meta = with lib; {
    description =
      "A modern shader compiler and framework for real-time graphics";
    longDescription = ''
      Slang is a shading language and compiler framework designed to extend HLSL
      with modern language features while maintaining compatibility with existing
      tools and codebases. It provides features like generics, interface-based
      polymorphism, robust modularity, and high-performance metaprogramming
      capabilities for real-time graphics programming.
    '';
    homepage = "https://github.com/shader-slang/slang";
    license = licenses.mit;
    platforms = platforms.all;
    mainProgram = "slangc";
  };

}
