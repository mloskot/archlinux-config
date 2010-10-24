;; ede project definition for libLAS
;;

;; boost from debian/ubuntu package (1.42)
(setq boost-base-directory "/usr/include/")

(setq cpp-liblas-project
  (ede-cpp-root-project "cpp-liblas"
    :file "~/dev/liblas/_hg/main/CMakeLists.txt"
    :include-path '(
      "include/liblas"
      "include/liblas/external"
      "include/liblas/external/property_tree"
      "include/liblas/external/property_tree/detail"
      "include/liblas/detail"
      "include/liblas/detail/reader"
      "include/liblas/detail/writer"
      "include/liblas/detail/index"
      "include/liblas/capi"
      )
    :system-include-path '( boost-base-directory )
    :local-variables (list 
      (cons 'compile-command 'alexott/gen-cmake-debug-compile-string))))
