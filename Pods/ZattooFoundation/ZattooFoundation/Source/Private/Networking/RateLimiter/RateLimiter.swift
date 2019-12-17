//
//  RateLimiter.swift
//  RateLimiter
//
//  Created by Erik Little on 11/16/14.
//  Open Source
//

import Foundation


class RateLimiter {
    let bucket: TokenBucket
    let queue: DispatchQueue

    var intervalStart = Date().timeIntervalSince1970
    var tokensThisInterval = 0.0
    var firesImmediatly = false

    init(tokensPerInterval: Double,
                interval: RateInterval,
                firesImmediatly: Bool = false,
                queue: DispatchQueue = .main) {
        self.bucket = TokenBucket(sizeOfBucket: tokensPerInterval,
                                  tokensPerInterval: tokensPerInterval,
                                  interval: interval)
        self.bucket.contains = tokensPerInterval
        self.firesImmediatly = firesImmediatly
        self.queue = queue
    }

    func removeTokens(_ count: Double, callback: @escaping (Double) -> Void) {
        if count > bucket.sizeOfBucket {
            callback(-Double.infinity)

            return
        }

        let now = Date().timeIntervalSince1970

        if now - intervalStart >= bucket.interval {
            intervalStart = now
            tokensThisInterval = 0
        }

        guard count <= bucket.tokensPerInterval - tokensThisInterval else {
            if firesImmediatly {
                return callback(-Double.infinity)
            }

            queue.asyncAfter(deadline: DispatchTime.now() + ceil(intervalStart + bucket.interval - now)) {
                func afterBucketRemove(tokensRemaining: Double) {
                    self.tokensThisInterval += count

                    callback(tokensRemaining)
                }

                self.bucket.removeTokens(count, callback: afterBucketRemove)
            }

            return
        }

        func afterBucketRemove(tokensRemaining: Double) {
            tokensThisInterval += count

            callback(tokensRemaining)
        }

        return bucket.removeTokens(count, callback: afterBucketRemove)
    }

    func getTokens() -> Double {
        bucket.drip()

        return bucket.contains
    }
}
