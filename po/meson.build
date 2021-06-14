dep_intl = dependency('', required: false)
if get_option('enable-nls')
  #libintl = cc.find_library('intl', required : false)
  if host_machine.system() != 'linux' and host_machine.system() != 'gnu'
    dep_intl = dependency('intl', required: true)
    if not dep_intl.found()
      error('ngettext not found but NLS support requested')
    endif
  endif

  conf.set('ENABLE_NLS', 1)

  add_project_arguments('-DLOCALEDIR="@0@/@1@"'.format(get_option('prefix'), get_option('localedir')), language: 'c')

  # define GETTEXT_PACKAGE
  add_project_arguments('-DGETTEXT_PACKAGE="@0@"'.format(meson.project_name()), language:'c')
  i18n = import('i18n')
  i18n.gettext(meson.project_name(),
    args: ['--directory=' + meson.source_root(), '--sort-output'])
endif
