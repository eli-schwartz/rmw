i18n = import('i18n')
add_project_arguments('-DLOCALEDIR="@0@/@1@"'.format(get_option('prefix'), get_option('localedir')), language: 'c')

# define GETTEXT_PACKAGE
add_project_arguments('-DGETTEXT_PACKAGE="@0@"'.format(meson.project_name()), language:'c')
add_project_arguments('-DENABLE_NLS', language:'c')
i18n.gettext(meson.project_name(),
  args: ['--directory=' + meson.source_root(), '--sort-output'])
