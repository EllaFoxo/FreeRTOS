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

sources = [
  'src/croutine.c',
  'src/event_groups.c',
  'src/list.c',
  'src/queue.c',
  'src/stream_buffer.c',
  'src/tasks.c',
  'src/timers.c',
  'src/portable/Common/mpu_wrappers_v2.c',
  'src/portable/Common/mpu_wrappers.c',
]

if mcu == 'ATSAME51G19A'
  includes += ['src/portable/GCC/ARM_CM4F']
  sources += []

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
  sources += []

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

freertos = static_library(
  'FreeRTOS',
  sources,
  include_directories : include_directories(includes)
)

freertos_dep = declare_dependency(include_directories : include_directories(includes),
  link_with : freertos
)
