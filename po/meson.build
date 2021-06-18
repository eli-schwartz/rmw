dep_intl = dependency('intl', required: get_option('enable-nls'), static: false)
if dep_intl.found()
  conf.set('ENABLE_NLS', 1)

  add_project_arguments('-DLOCALEDIR="@0@/@1@"'.format(get_option('prefix'), get_option('localedir')), language: 'c')

  # define GETTEXT_PACKAGE
  add_project_arguments('-DGETTEXT_PACKAGE="@0@"'.format(meson.project_name()), language:'c')
  i18n = import('i18n')
  i18n.gettext(meson.project_name(),
    args: ['--directory=' + meson.source_root(), '--sort-output'])
endif
