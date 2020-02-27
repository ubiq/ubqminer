Ubqminer - GPU Ubiq miner
Usage: ubqminer [OPTIONS] [pool...]

Positionals:
  pool TEXT ...               Specify one or more pool URLs. See below for URL syntax

Common Options:
  -h,--help                   Show help
  -V,--version                Show program version
  -v,--verbosity INT in [0 - 9]=5
                              Set log verbosity level
  --farm-recheck INT in [1 - 99999]=500
                              Set check interval in milliseconds for changed work
  --farm-retries INT in [0 - 99999]=3
                              Set number of reconnection retries
  --work-timeout INT in [1 - 99999]=180
                              Set disconnect timeout in seconds of working on the same job
  --response-timeout INT in [2 - 999]=2
                              Set disconnect timeout in seconds for pool responses
  -R,--report-hashrate        Report current hashrate to pool
  --display-interval INT in [1 - 99999]=5
                              Set mining stats log interval in seconds
  --HWMON INT in [0 - 1]      0 - Displays gpu temp, fan percent. 1 - and power usage. Note for Linux: The program uses sysfs for power, which requires running with root privileges.
  --exit                      Stops the miner whenever an error is encountered
  -P,--pool TEXT ...          Specify one or more pool URLs. See below for URL syntax
  --failover-timeout INT in [0 - 999]=0
                              Set the amount of time in minutes to stay on a failover pool before trying to reconnect to primary. If = 0 then no switch back.
  --nocolor                   Display monochrome log
  --syslog                    Use syslog appropriate log output (drop timestamp and channel prefix)
  --list-devices              List the detected OpenCL/CUDA devices and exit. Should be combined with -G, -U, or -X flag
  --noeval                    Bypass host software re-evaluation of GPU solutions
  -L,--dag-load-mode INT in [0 - 2]=0
                              Set the DAG load mode. 0=parallel, 1=sequential, 2=single.  parallel    - load DAG on all GPUs at the same time  sequential  - load DAG on GPUs one after another. Use this when the miner crashes during DAG generation  single      - generate DAG on device, then copy to other devices. Implies --dag-single-dev
  --dag-single-dev UINT=0     Set the DAG creation device in single mode
  --benchmark-warmup UINT=15  Set the duration in seconds of warmup for the benchmark tests
  --benchmark-trial INT in [1 - 99]=3
                              Set the number of benchmark trials to run
  -G,--opencl                 When mining use the GPU via OpenCL
  -U,--cuda                   When mining use the GPU via CUDA
  -X,--cuda-opencl            When mining with mixed AMD(OpenCL) and CUDA GPUs
  -M,--benchmark UINT=0       Benchmark mining and exit; Specify block number to benchmark against specific DAG
  -Z,--simulation UINT=0      Mining test. Used to validate kernel optimizations. Specify block number
  --tstop INT in [30 - 100]=0 Stop mining on a GPU if temperature exceeds value. 0 is disabled, valid: 30..100
  --tstart INT in [30 - 100]=40
                              Restart mining on a GPU if the temperature drops below, valid: 30..100


API Options:
  --api-bind TEXT             Set the API address:port the miner should listen to. Use negative port number for readonly mode
  --api-port INT in [-65535 - 65535]=0
                              Set the API port, the miner should listen to. Use 0 to disable. Use negative numbers for readonly mode
  --api-password TEXT         Set the password to protect interaction with API server. If not set, any connection is granted access. Be advised passwords are sent unencrypted over plain TCP!!
  --http-bind TEXT            Set the web API address:port the miner should listen to.
  --http-port INT in [0 - 65535]=0
                              Set the web API port, the miner should listen to. Use 0 to disable. Data shown depends on hwmon setting


OpenCL Options:
  --cl-kernel INT in [0 - 2]=-1
                              Ignored parameter. Kernel is auto-selected.
  --opencl-platform UINT=0    Use OpenCL platform n
  --opencl-device,--opencl-devices UINT ...
                              Select list of devices to mine on (default: use all available)
  --cl-parallel-hash INT in {1,2,4,8}=-1
                              ignored parameter
  --cl-global-work UINT=65536 Set the global work size multipler.
  --cl-local-work UINT in {64,128,192,256}=192
                              Set the local work size
  --cl-only                   Use opencl kernel. Don't attempt to load binary kernel


CUDA Options:
  --cuda-grid-size INT in [1 - 999999999]=8192
                              Set the grid size
  --cuda-block-size INT in [1 - 999999999]=128
                              Set the block size
  --cuda-devices UINT ...     Select list of devices to mine on (default: use all available)
  --cuda-parallel-hash UINT in {1,2,4,8}=4
                              Set the number of hashes per kernel
  --cuda-schedule TEXT in {auto,spin,sync,yield}=sync
                              Set the scheduler mode.  auto  - Uses a heuristic based on the number of active CUDA contexts in the process C          and the number of logical processors in the system P. If C > P then yield else spin.
  spin  - Instruct CUDA to actively spin when waiting for results from the device.  yield - Instruct CUDA to yield its thread when waiting for results from the device.  sync  - Instruct CUDA to block the CPU thread on a synchronization primitive when waiting for the results from the device.
  --cuda-streams INT in [1 - 99]=2
                              Set the number of streams
Pool URL Specification:
    URL takes the form: scheme://user[.workername][:password]@hostname:port[/...].
    where scheme can be any of:
    getwork     for getWork mode
    stratum     for stratum mode
    stratums    for secure stratum mode
    stratumss   for secure stratum mode with strong TLS12 verification

    Example 1:    stratums://0x012345678901234567890234567890123.miner1@ethermine.org:5555
    Example 2:    stratum://0x012345678901234567890234567890123.miner1@nanopool.org:9999/john.doe@gmail.com
    Example 3:    stratum://0x012345678901234567890234567890123@nanopool.org:9999/miner1/john.doe@gmail.com

Environment Variables:
    NO_COLOR - set to any value to disable color output. Unset to re-enable color output.
    SYSLOG   - set to any value to strip time and disable color from output, for logging under systemd
