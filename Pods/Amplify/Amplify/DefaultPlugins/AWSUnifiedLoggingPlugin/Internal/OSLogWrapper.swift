//
// Copyright 2018-2019 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import os.log

final class OSLogWrapper: Logger {
    private let osLog: OSLog

    var getLogLevel: () -> LogLevel

    public var logLevel: LogLevel {
        get {
            getLogLevel()
        }
        set {
            getLogLevel = { newValue }
        }
    }

    init(osLog: OSLog, getLogLevel: @escaping () -> LogLevel) {
        self.osLog = osLog
        self.getLogLevel = getLogLevel
    }

    public func error(_ message: @autoclosure () -> String) {
        // Always logged, no conditional check needed
        os_log("%@",
               log: osLog,
               type: OSLogType.error,
               message())
    }

    public func error(error: Error) {
        // Always logged, no conditional check needed
        os_log("%@",
               log: osLog,
               type: OSLogType.error,
               error.localizedDescription)
    }

    public func warn(_ message: @autoclosure () -> String) {
        guard logLevel.rawValue >= LogLevel.warn.rawValue else {
            return
        }

        os_log("%@",
               log: osLog,
               type: OSLogType.info,
               message())
    }

    public func info(_ message: @autoclosure () -> String) {
        guard logLevel.rawValue >= LogLevel.info.rawValue else {
            return
        }

        os_log("%@",
               log: osLog,
               type: OSLogType.info,
               message())
    }

    public func debug(_ message: @autoclosure () -> String) {
        guard logLevel.rawValue >= LogLevel.debug.rawValue else {
            return
        }

        os_log("%@",
               log: osLog,
               type: OSLogType.debug,
               message())
    }

    public func verbose(_ message: @autoclosure () -> String) {
        guard logLevel.rawValue >= LogLevel.verbose.rawValue else {
            return
        }

        os_log("%@",
               log: osLog,
               type: OSLogType.debug,
               message())
    }
}
