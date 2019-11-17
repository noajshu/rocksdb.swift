Pod::Spec.new do |s|
  s.name             = 'rocksdb.swift'
  s.version          = '6.4.6'
  s.summary          = 'rocksdb Wrapper for Swift. Cocoapods and SPM support. Linux support.'

  s.description      = <<-DESC
This pod wraps the awesome rocksdb key-value database from facebook to awesome Swifty Syntax.
Works on iOS, macOS, tvOS, watchOS and Linux. Major and Minor Version numbers are kept in sync with
the upstream rocksdb library. Patch version varies.
                       DESC

  s.homepage         = 'https://github.com/Ybrin/rocksdb.swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Koray Koska' => 'koray@koska.at' }
  s.source           = { :git => 'https://github.com/Ybrin/rocksdb.swift.git', :tag => s.version.to_s, :submodules => true }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.swift_versions = '5.1.2', '5.0', '5.1'

  s.module_name = 'RocksDB'

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => 'ROCKSDB_PLATFORM_POSIX=1 ROCKSDB_LIB_IO_POSIX=1 PORTABLE=1 OS_MACOSX=1',
    'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/rocksdb.swift/librocksdb/upstream" "${PODS_ROOT}/rocksdb.swift/librocksdb/upstream/include" "${PODS_ROOT}/rocksdb.swift/librocksdb/upstream/util"',
    'WARNING_CFLAGS' => '-Wno-shorten-64-to-32 -Wno-comma -Wno-unreachable-code -Wno-conditional-uninitialized -Wno-deprecated-declarations',
    'USE_HEADERMAP' => 'No'
  }
  #  "${PODS_ROOT}/rocksdb.swift/librocksdb/upstream/include" "${PODS_ROOT}/rocksdb.swift/librocksdb/upstream/util"

  s.header_dir = 'rocksdb'
  # s.header_mappings_dir = 'Sources/librocksdb'

  s.libraries = 'c++'

  s.source_files = 'Sources/librocksdb/upstream/{cache,db,env,file,include,logging,memory,memtable,monitoring,options,port,table,test_util,trace_replay,util,utilities}/**/*.{cc,c,h}',
                   'Sources/librocksdb/upstream/patches/build_version.cc',
                   # 'Sources/RocksDB/**/*.swift'
  s.public_header_files = 'Sources/librocksdb/upstream/include/**/*.h'
  # s.private_header_files = 'Sources/librocksdb/upstream/{cache,db,env,file,logging,memory,memtable,monitoring,options,port,table,test_util,trace_replay,util,utilities}/**/*.h'
  s.exclude_files = 'Sources/librocksdb/upstream/{cache,db,env,file,include,logging,memory,memtable,monitoring,options,port,table,test_util,trace_replay,util,utilities}/**/*_test.{cc,c}',
                    'Sources/librocksdb/upstream/{cache,db,env,file,include,logging,memory,memtable,monitoring,options,port,table,test_util,trace_replay,util,utilities}/**/*_bench.cc',
                    'Sources/librocksdb/upstream/db/db_test2.cc',
                    'Sources/librocksdb/upstream/db/db_test_util.cc',
                    'Sources/librocksdb/upstream/port/win',
                    'Sources/librocksdb/upstream/table/mock_table.h',
                    'Sources/librocksdb/upstream/table/mock_table.cc',
                    'Sources/librocksdb/upstream/test_util/testharness.cc',
                    'Sources/librocksdb/upstream/test_util/testharness.h',
                    'Sources/librocksdb/upstream/util/crc32c_ppc_asm.S',
                    'Sources/librocksdb/upstream/utilities/env_librados.cc',
                    'Sources/librocksdb/upstream/utilities/cassandra/test_utils.cc',
                    'Sources/librocksdb/upstream/utilities/cassandra/test_utils.h',
                    'Sources/librocksdb/upstream/utilities/cassandra/merge_operator.cc',
                    'Sources/librocksdb/upstream/utilities/cassandra/merge_operator.h',
                    'Sources/librocksdb/upstream/utilities/cassandra/format.cc',
                    'Sources/librocksdb/upstream/utilities/cassandra/format.h',
                    'Sources/librocksdb/upstream/utilities/cassandra/cassandra_compaction_filter.cc',
                    'Sources/librocksdb/upstream/utilities/cassandra/cassandra_compaction_filter.h'
end
