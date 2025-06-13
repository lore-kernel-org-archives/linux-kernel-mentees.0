Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7593E1B0413
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 13 Jun 2025 03:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749786544; cv=none; b=XigPb/1TpNNdp6U+lstxN//O03OQ8B62dUNnBhD8wPFkJRNAlJJAOfJ51cloKn9PGJVcnpXtRPTa2BROo1KKMtvcii78r5d4eIpPeez1xqjIQi0xOy2Bn0XK5BEc6NsCDYT79ZVYrYFw/YqZLYWaM2vcox59ec54YHG0zoqdASA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749786544; c=relaxed/simple;
	bh=68tEN2dZo1tcrtx31a6qsgDBD/Bh/ugfqDRSZqkFmK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hDneyBnaNpBHgO1+kxWTLbJveXdwNsy7nb5VY+y8hJAPi7odKfvR5OL5UeMWARlxgmllSqXpGvfZgvz3MlbAR+Mde/oM6nR43HWQuLx5VX3l3mVs4vVxv+q1khibd8gdM9qGdEYz+t4lQLSgTaHs7L7qCfG6mxPNmHh0Tm4L4hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/JU38Va; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/JU38Va"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23636167afeso16751115ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 20:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749786542; x=1750391342; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hOV1CbIWien3pdSZwfL1WXU4HFPINY1VNUJGegt7uI0=;
        b=F/JU38VaufzqPErFkVRv5/ZSRNMCYDPAloRUWfGaZM22KK+xAk+H9FI73g7gtQzB24
         mesoSMXk3vDazhjRWEIVbCfJfMDBurgSZIXSumsRzesZ5o+MzPpKzFZD4oGypO/ibHOc
         v2DaVQfZcnxWhjumKY+pYDl3OlkCh5KBX/PGdteW22/LJY+s6nFqJTwAm6G2ykEx9U/Y
         uNioNqYApKu+rk/RA8ZDlnQ+3IRwNaFyCZ6lHTAb71w7JLPFbqKdmoSZiETZhBp81ZzD
         xjJM6QnbVZx7MtvbJSvcbfvHr0iLSOYcahR7/8jCM4qt9fhokWLfP8im+kUVElbdoS3I
         owxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749786542; x=1750391342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOV1CbIWien3pdSZwfL1WXU4HFPINY1VNUJGegt7uI0=;
        b=h/UgCgU4s61NW/j8t0M5q5fwzbW380H5OoqRxLW8M7r2WYqmDPMjpvgqYkPPUvpNYS
         FTpuuTW48+p/SDAWOdBXFFy1B6GdXtGPtwoXfh/d6+uKD7Pko35IVCHdCM5dXqLConGH
         yZ4UZXoBpbllD6umDZ5MNedEyDMMRW+tuhZdF+XE4ESMq+cIPoKmFLGvv6ciPfLt68+U
         ag8FBPcLeZeKLn+IeIwT5y6nNqn1do6ngmpTF1mJONeLimmGDlsQW0CtkyGCt8JVgkU1
         PPoHV/cpKWaXtmpMk5W4Cs/QxzhYHKmCyD8/mMOR3WonIbb5aoV1mfHd4cKDKTdmlIZZ
         Wk8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQc6rYkbNEjKxk2+QgOKg2AjZ1Ma8fvvic9nc744vG2DB3BC7Q+dSn3X0Shb0sB/kNCXE5HDLg+pDLCPfRsMBN/oFDpg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDd23QsYyZuQKqKxWWNQm4bFziI+yINbLWOhNyqJpEhZnx6oeT
	KXysSHN58puxmh88iVXTfg9mJqODwhdcj3VRsZhrI/cq2L/7xg/+cCwSPB6Skv50
X-Gm-Gg: ASbGncv+gwFRJLbUWAqhhz8dkSFFYAW6t0Ig1NbRkglLkYDmfMu/SeZgVCPPO9KjqCe
	edOPjWw7bXhbF+G9HMo2hnTIOkY8mzCAnMXoC+2E2q3BfS31lapEBGE76umjZf/uk2cZNO/inb/
	AAtMS15HzuCPzfWJlMDrmEweCICpg8d5ZS/JA3bTIkgLm9ZcRWLuWcd77Ldp1fBoPpgNW80dXJ1
	cx5Vaw5wuW6Ve0QKca09iVHa36Efyiwj/+wMVfhPxMx0CQTvUY5XQoSwljj4MEyzZw+PEBiQyrm
	XB3gIuzlYJuPUCqBO9CxpDivFwIH2Bdb9pZA6OFo/Ws+mzV0UCD121+FvLowaGBoVDEuMzJKOWM
	snOQPjT5rxiNk/7s=
X-Google-Smtp-Source: AGHT+IGcCPbmzcZ4ZFmcQvKsoG8mD+Ad+sBXd7G1jj4p/pJan4whW0SJ9sBLXl3J2tSuwpMj7yia0A==
X-Received: by 2002:a17:903:1c9:b0:234:f4da:7ecf with SMTP id d9443c01a7336-2365d887fb5mr17476245ad.8.1749786541656;
        Thu, 12 Jun 2025 20:49:01 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:873:d810:9d97:1c69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88bf78sm5090925ad.27.2025.06.12.20.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 20:49:01 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: jstultz@google.com
Cc: tglx@linutronix.de,
	sboyd@kernel.org,
	yury.norov@gmail.com,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH v4] clocksource: Replace loop within clocks_calc_mult_shift() with find_last_bit() for calculation of "sftacc"
Date: Fri, 13 Jun 2025 11:48:55 +0800
Message-ID: <20250613034855.3570641-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Utilize "__fls()" in replacement of while loop counting
for the decremenet of "sftacc". They're equivalent in computation result
but the former is more effective.

"__fls()" will return the bit number of the last set bit of
"tmp", which is 0-based index. Plus 1 to convert it into bit width as
desired.

Note that only the lowest 32 bits of "tmp" is taken into consideration
of the operation, since it was already shifted right by 32 bits, the
topmost 32 bits should remain 0, only the lowest 32 bits are possible to
be non-zero.

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

v2 -> v3:
	- Use "find_last_bit()" instead of "__builtin_clz()"
	- Convert the type of "tmp" to "const unsigned long *" when
	  sending into the function
	- Highlight in the comment that only the lowest 32 bits part
	  of "tmp" is taken into consideration

v3 -> v4:
	- Use "__fls()" since "tmp" is of type u64, not cpumask
	- Refine commit messages to match the current implementation

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
 kernel/time/clocksource.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index 2a7802ec480c..1e3dc68c696d 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -66,10 +66,19 @@ clocks_calc_mult_shift(u32 *mult, u32 *shift, u32 from, u32 to, u32 maxsec)
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
+	 * Using "__fls(tmp) + 1" to get the bit width:
+	 * - __fls(tmp) returns the bit number of the last set bit
+	 * - Plus 1 to convert 0-based index into bit width as desired
+	 *
+	 * Note: Only the lowest 32 bits of "tmp" is taken into consideration,
+	 *		 since it was already shifted right by 32 bits, the topmost 32
+	 *		 bits are guaranteed to be 0.
+	 */
+	if (tmp)
+		sftacc -= __fls(tmp) + 1;
 
 	/*
 	 * Find the conversion shift/mult pair which has the best
-- 
2.43.0

