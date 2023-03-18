project('main', 'cpp')


thread_dep = dependency('threads')
lib = static_library('mylib', 'lib.cpp')
executable(
    'main', 
    'main.cpp', 
    link_with : lib,
    link_args : ['-static', '-s'],
    install : true, install_dir : '.'
)