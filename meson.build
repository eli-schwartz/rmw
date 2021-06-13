project(
  'rmw',
  'c',
  version: '0.8.0',
  default_options: ['warning_level=2']
  )

add_global_arguments(
  '-fno-common',
  language : 'c'
  )

compiler = meson.get_compiler('c')
if compiler.has_argument('-fstack-protector-strong')
  add_project_arguments('-fstack-protector-strong', language: 'c')
endif
if compiler.has_argument('-fanalyzer')
  add_project_arguments('-fanalyzer', language: 'c')
endif

conf = configuration_data()
conf.set_quoted('VERSION', meson.project_version())
conf.set_quoted('PACKAGE_STRING', meson.project_name())
conf.set_quoted('PACKAGE_URL', 'https://remove-to-waste.info/')
conf.set_quoted('PACKAGE_BUGREPORT', 'https://github.com/theimpossibleastronaut/rmw/issues')

check_headers = [
	['ncursesw/menu.h', 'HAVE_NCURSESW_MENU_H'],
	['ncurses/menu.h', 'HAVE_NCURSES_MENU_H'],
	['menu.h', 'HAVE_MENU_H'],
	['ncursesw/curses.h', 'HAVE_NCURSESW_CURSES_H'],
	['ncursesw.h', 'HAVE_NCURSESW_H'],
	['ncurses/curses.h', 'HAVE_NCURSES_CURSES_H'],
	['ncurses.h', 'HAVE_NCURSES_H'],
	['curses.h', 'HAVE_CURSES_H'],
]

foreach h : check_headers
	if compiler.has_header(h.get(0))
		conf.set(h.get(1), 1)
	endif
endforeach

config_h = configure_file(output : 'config.h', configuration : conf)


if host_machine.system() == 'linux' or host_machine.system() == 'gnu'
	gettext_deps = []
elif host_machine.system() == 'freebsd' or host_machine.system() == 'openbsd' or host_machine.system() == 'dragonfly'
	# Workaround for https://github.com/mesonbuild/meson/issues/4468
	gettext_deps = [cpp.find_library('intl', has_headers: ['libintl.h'], dirs: ['/usr/local/lib'], header_args: c_args)]
elif host_machine.system() == 'netbsd'
	# Workaround for https://github.com/mesonbuild/meson/issues/4468
	gettext_deps = [cpp.find_library('intl', has_headers: ['libintl.h'], dirs: ['/usr/pkg/lib'], header_args: c_args)]
else # darwin, cygwin
	gettext_deps = [cpp.find_library('intl', has_headers: ['libintl.h'])]
endif

subdir('po')
subdir('external/canfigger')

subdir('src')

executable(
  'rmw',
  'src/main.c',
  link_with : [dep_canfigger, dep_librmw],
  install : true
  )

subdir ('man')
subdir ('test')
