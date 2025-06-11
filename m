Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCD81B392B
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 03:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749612608; cv=none; b=tdBhflpD2ZRxztAZscOt5KakyzPwEj5FOhjj0dgaBWduXWh8M+C6M1uwGiML0FAiBoxwznc4zwo6+KvZZIC9Jklp1Jj6lbtKidqGb3kv7eBGW4kSXnkLN5OIAG5Dz3pusT3aeCL5reDuo0cPSUWYJrLSFD2Tvy/zyMbw6Hx9M0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749612608; c=relaxed/simple;
	bh=imFW4IVAwK25sxCBe37r/zhbuYFpu+JsPfSgg1qERHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wkxe50B93b/y6adaY+NPVyULL46yE4+A7O+cbfnUBEGs687vIuhkTEBfYPiNJ7Ymh+ilhJILrvSLIE07HW/QCOLrjRyCtvwfHTtkG9Ln4cxip3eM1t6/uOphu1EpxU5tt11Qs0eGS2aIO+9O/KzatQxrKBpJI6Ui/qQhkJu9dBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNcWaCBk; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNcWaCBk"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3139027b825so1737473a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 10 Jun 2025 20:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749612606; x=1750217406; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EqSs26f4pWYApxdp4s2SLF8oPpRm6z/KDbq/LNfibWk=;
        b=WNcWaCBk+k62b4CLKPbcmMA60gmVaY3I4QqcqZ6ZxwMP3p2YPgjLO0lPkAfNMq4etS
         wtEcmdNg1MAYXTuNrMrhd3hZ4FwEmA8GNoxpJ46Zff4C3+qfQHNLNKqcUOOIBIVZ7lKo
         oVNFY9mo1J3XyHEdAkPO4aYEAZKgmvSCjtM1v2J41bTTgTwXHiJPHcyv/hZneowfI9cj
         c8qANz+4LV4Ju3MnvGpCm3vv0Bp2It2gKDz4srA2Z2Yh7yQ19F603IOEabFHS9Enq3x9
         7bNdjSv3blHCF4Rshn0H0m+B7ZzOSfqkwDdUcxexnjKE5DFO810dNtA0YVugCNUPahMn
         FJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749612606; x=1750217406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqSs26f4pWYApxdp4s2SLF8oPpRm6z/KDbq/LNfibWk=;
        b=MBznv7KXZqqq6oEjwc3idkoemI+orSjw6dgZG/fQkqV37SXB8FEqOfvySm7+TqBvmE
         dRRPXLIm1s5azzrJklMrQZ7YLm8pHuvw+f1NtoWcILCoe1b6TQRK7ReEUWqzOqQqFy14
         hG9VddmzpAMiU3TM7a+Ugcm68ezY1eSaTwuLcRwxlXCWQtMRGfCOQhzn8jdvgJ4qIMCI
         2QrRaxu4ayjRZQqqMvAsdhy5sV8CasyOr6aWB98AAICsfDRImjp4ni7q3vDvmhZQLPIj
         icqZl/S3RSJNKBTTagxX9eHTmCiysKAIHxxIk/XhsmeaGbadIGM4jOAWcd6FMhvGIxnT
         D14A==
X-Forwarded-Encrypted: i=1; AJvYcCWIij+ucfa4ih8q8WgAqy6V2YKysBPikE05qPJrpQfx0pVAVzsC1rjb77zoXafxfLqCSQZvJ5Dw1D2gVkESUbFPcqmmBg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz56XzNxaUGYFpvjIw860gyIq0MNR6b7LeccrS+x1Ude5u7yqNB
	5kL+O4LkVeiPDtL4XmrpgMSw8EfHAWFaef9MTgKMIYUQYQMOf/Go/IVs
X-Gm-Gg: ASbGnctCWdByxyhUowzbgKaw1cBeSQgQy5xKyhlvCvGdCdUhZSM1oOM4Usdx+pOBmQt
	iFJoLfl5rIkpBdJ/KOUDLFtYt6FQyLsCRMP4kYyt1V9t/NtdnikNEmJydfp5p4MvkscBmSaqnRI
	g9sz1w4IIfxv3klwEvRVGaF03nKImWKpcSSpDEbZz3N7/T/f5Q65z+sP8fdU3szD8QtmDriKAlb
	/z3mB5g32KLwQeNTSKaH6ab1XdWrOS5q1BI/cFNTCGdBOHi9mVYaau67Z69Yan5fs0bnSxd6L1i
	DQfc9QcyHzP4sN7oMAZyBxRy6rpnf8ZkwWuzKonfatm0Tch/eVzEAJuWAOw5f+lCTB+EtOeWDmI
	zRfJ2ORrMEKHYe9iw
X-Google-Smtp-Source: AGHT+IHgU2Pp0OibXDfJ5GEXHjFB6R/DCOOvsnsDdMuw0OtMeleth8YXYWmzmVwgLt6uLhHXriVoEA==
X-Received: by 2002:a17:90a:f94d:b0:313:31ca:a69 with SMTP id 98e67ed59e1d1-313b1fbe765mr1688087a91.18.1749612606365;
        Tue, 10 Jun 2025 20:30:06 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:52f2:ddbc:f858:ca43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b20078a4sm328899a91.13.2025.06.10.20.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 20:30:05 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: jstultz@google.com
Cc: tglx@linutronix.de,
	sboyd@kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	jserv@ccns.ncku.edu.tw,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH v2] clocksource: Replace loop within clocks_calc_mult_shift() with clz-based calculation for sftacc
Date: Wed, 11 Jun 2025 11:30:01 +0800
Message-ID: <20250611033001.707396-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Utilize (32 - __builtin_clz(tmp)) in replacement of while loop counting
for the decremenet of "sftacc". They're equivalent in computation result
but the former is more effective.

Using 32 instead of 31 here because MSB position is 0-index, and the bit
width will be (MSB position + 1).

The case for "tmp == 0" should be handled separately since
__builtin_clz(0) has undefined behavior.

This change is tested against a test script [1].
Run the test 10 times for each version of implementation and take the
average. The result shown that with this change, the operation overhead
of "clocks_calc_mult_shift()" can be reduced around 99.7% .

-----------------------------
| old version | new version |
-----------------------------
|  11500.6 ns |       44 ns |
-----------------------------

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
Changelog:

v1 -> v2:
	- Refine commit message to explain more about "why"
	- Check the frequency of "clocks_calc_mult_shift()" get called,
	  it's not in hotpath on my machine, refine the commit message
      to avoid overselling it
	- Add comments for the code to explain the implementation in
	  more detail
	- Handle case for "tmp == 0" to avoid undefined behavior
    - Experiment using ffs() but it's used for finding the LSB of
      a number, which isn't MSB as we want. It would still need
      looping when intended to use ffs() in this scenario

[1]:
static int __init test_init(void)
{
    u32 mult, shift;
    u32 from, to, maxsec;
    ktime_t start_time, end_time, total_time;
    pr_info("Starting clocks_calc_mult_shift simple test\n");

    start_time = ktime_get();
    // Test with parameters from 1 to 1000
    for (from = 1; from <= 1000; from += 100) {
        for (to = 1; to <= 1000; to += 100) {
            for (maxsec = 1; maxsec <= 10; maxsec++) {

                clocks_calc_mult_shift(&mult, &shift, from, to, maxsec);
            }
        }
    }

    end_time = ktime_get();
    total_time = ktime_to_ns(ktime_sub(end_time, start_time));

    pr_info("Test completed\n");
    pr_info("Total execution time: %lld ns \n", total_time);
    return 0;
}

The test is running in the form of kernel module.
The test machine is running ubuntu 24.04 on x86_64 machine with kernel
version of v6.14.0, CPU type is AMD Ryzen 7 5700X3D 8-Core Processor.

Best regards,
I Hsin Cheng.
---
 kernel/time/clocksource.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index 2a7802ec480c..59145d762f1e 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -66,10 +66,20 @@ clocks_calc_mult_shift(u32 *mult, u32 *shift, u32 from, u32 to, u32 maxsec)
 	 * range:
 	 */
 	tmp = ((u64)maxsec * from) >> 32;
-	while (tmp) {
-		tmp >>=1;
-		sftacc--;
-	}
+
+	/*
+	 * Decrement "sftacc" by the number of bits needed to represent "tmp".
+	 * Using (32 - __builtin_clz(tmp)) to ge the bit width:
+	 * - __builtin_clz(tmp) returns the count of leading zero bits
+	 * - (32 - __builtin_clz(tmp)) gives us the number of significant bits
+	 *
+	 * Note: It use 32 instead of 31 because we want bit width (0-index MSB
+	 * position + 1), not just the MSB position itself.
+	 *
+	 * Handle tmp == 0 separately since __builtin_clz(0) has undefined behavior.
+	 */
+	if (tmp)
+		sftacc -= (32 - __builtin_clz(tmp));
 
 	/*
 	 * Find the conversion shift/mult pair which has the best
-- 
2.43.0

