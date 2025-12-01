project(
  'FreeRTOS',
  'c',
  version: '3.6.1',
  default_options : [
    'c_std=gnu99',
    'prefer_static=true'
  ]
)

mcu = get_option('mcu')
if mcu == ''
  error('Target MCU was not specified. Example: -Dmcu=ATSAME51G19A')
endif

includes = ['src/include']

if build_machine.system() == 'windows'
  g = run_command('scripts\glob.bat', check : false)
  source_globber = find_program('scripts\glob.bat')
elif build_machine.system() == 'darwin'
  g = run_command('scripts/glob.sh', check : false)
  source_globber = find_program('scripts/glob_darwin.sh')
else
  g = run_command('scripts/glob.sh', check : false)
  source_globber = find_program('scripts/glob.sh')
endif

newline = '''
'''

if mcu == 'ATSAME51G19A'
  includes += ['src/portable/GCC/ARM_CM4F']

  add_project_arguments(
    '-D__SAME51G19A__',
    '-Dnoexcept=',
    '-c',
    '-mcpu=cortex-m4',
    '-mthumb',
    '-fno-math-errno',
    '-mfpu=fpv4-sp-d16',
    '-mfloat-abi=hard',
    '-ffunction-sections',
    '-fdata-sections',
    '-nostdlib',
    '-Wundef',
    '-Wdouble-promotion',
    '-fsingle-precision-constant',
    '-Wa,-ahl=$*.s',
    '-fstack-usage',
    '-fdump-rtl-expand',
    language : 'c'
  )
endif

if get_option('mcu') == 'ATSAME51G19A'
  includes += ['src/portable/GCC/ARM_CM4F']

  add_project_arguments(
    '-D__SAME51G19A__',
    '-Dnoexcept=',
    '-c',
    '-mcpu=cortex-m4',
    '-mthumb',
    '-fno-math-errno',
    '-mfpu=fpv4-sp-d16',
    '-mfloat-abi=hard',
    '-ffunction-sections',
    '-fdata-sections',
    '-nostdlib',
    '-Wundef',
    '-Wdouble-promotion',
    '-fsingle-precision-constant',
    '-Wa,-ahl=$*.s',
    '-fstack-usage',
    '-fdump-rtl-expand',
    language : 'c'
  )
endif

sources = g.stdout().strip().split(newline)
message('=== Sources ===')
foreach s : sources
  message(s)
endforeach
message('===============')

freertos = static_library(
  'FreeRTOS',
  sources,
  include_directories : include_directories(includes)
)

freertos_dep = declare_dependency(include_directories : include_directories(includes),
  link_with : freertos
)
