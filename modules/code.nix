{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vscode
    # (vscode-with-extensions.override {
    #   vscodeExtensions = with vscode-extensions; [
    #     ms-python.python # Python extension
    #     # ms-vscode.cpptools # C++ extension
    #     divyanshuagrawal.competitive-programming-helper
    #
    #     # competitive-companion # Helpful for competitive programming
    #   ];
    # })
  ];
}
