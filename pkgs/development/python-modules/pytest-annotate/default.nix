{ stdenv
, lib
, buildPythonPackage
, fetchPypi
, pyannotate
, pytest
}:

buildPythonPackage rec {
  pname = "pytest-annotate";
  version = "1.0.5";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    sha256 = "09269320f8d218728247436f7ade96f33cf3fe85840b40632142d9f8968c1fd0";
  };

  buildInputs = [
    pytest
  ];

  propagatedBuildInputs = [
    pyannotate
  ];

  # Module has no tests
  doCheck = false;

  pythonImportsCheck = [
    "pytest_annotate"
  ];

  meta = with lib; {
    broken = (stdenv.isLinux && stdenv.isAarch64) || stdenv.isDarwin;
    description = "Generate PyAnnotate annotations from your pytest tests";
    homepage = "https://github.com/kensho-technologies/pytest-annotate";
    license = licenses.asl20;
    maintainers = with maintainers; [ costrouc ];
  };
}
