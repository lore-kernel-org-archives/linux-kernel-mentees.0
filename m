Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041461F4615
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 13 Jun 2025 03:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749786767; cv=none; b=DxeWfZDYFcGWDg4ScNZ9O8uaDlWYiy303M4bQRaDARz2jY/tzU/3nX8RmjX0XTaveyEFQ1vdFP/MGHkmsLpB4b5yvS47fyeap4r9szPmf8NpMo4+BFdkoxcwNmjKhskX6cPqD1CY1qEk/y2unYz2nHipFFbnBfycbYyrBWKP6/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749786767; c=relaxed/simple;
	bh=PCnqi5sVLD/Rz88yz5R4xSG2M0Y9Jq4pzJDU3PPIIMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ow38hr0aT103rZh1RZPpVG0ISB7n7H7zitdb5JK1nCkwsia0y0cQuANq2anrvW8z0zh/5nLZi7Rp4YKvM56BBJDnlzsbxdQJlccdPQYkgTZatstiMBsplQeIVagO3D6OC8c11SCVQec771fZZ264/HdFK8us3KsoHazRb999vvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfI+dpzG; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfI+dpzG"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235a3dd4f0dso11163005ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 20:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749786765; x=1750391565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/BJcwG5cjEd6RoVlGatwHPsYMBzQlGVzeAkVl5gfwcA=;
        b=TfI+dpzGldeu+mVKG8ZW7o7vRLa2CfBEj2DGkm0gxz3IQjh1dXoUONpNxvJRZEOzMD
         +Ou2d7eAyD1pR3HjEAojsLJSk2qKzUDFp21hqpEqk8R6TdTI7nCAEmyKHfGfiKC/9MOb
         OzF6M9JRNOYSlzv7/sSn/xGZpNDUCircJGKHiNCoWG+faWklJdQm6HNDxgkAYV9w9Z51
         V5cXdE9h8lwgJgDvD51lE0qPzvymA7T6pA+acUmpqD+QLooIL+DSihKk4wWqnzB1Psyc
         OrYQeWaBR+rtFCavfLLhq/WIevaK8Gdndn4F/WEPC2fi6NaGnEg6tjxNP7KvA22N3nPz
         exvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749786765; x=1750391565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BJcwG5cjEd6RoVlGatwHPsYMBzQlGVzeAkVl5gfwcA=;
        b=pMpiho5+BoAGOLgUKyjA64BZnMvDgrGIvTDDGQM/cKfwESGlF/2RoRBR95otP70/ni
         du/fCBTVDTv9Vykt6aVHmdR0uEKfXJgWChSOqI5YaNK4NFQXqLzBE/0cdKYdn/jUyNZG
         YvdvNiioIQjYq3I0W3AoLyJZ0H6ZSPJ3O6HeElJWdy9vof5FbO0JDo4cllVBOpdHk3vs
         AjmGeFnI/Bi2lMMNws+jBehIaeB2avgyURxRyETUrydmJslTKKwOEJMb0UDLnGYFl7oG
         7zJYEt5Xig20a3XrULhH8FP+iPHxgUJR2VHZ87tVojjOlefZ+BLGBYg6GOvAEUZQDa57
         3Ytg==
X-Forwarded-Encrypted: i=1; AJvYcCVGdHj0M+QTFwg4aPUMprVBAFi4vMArNL0KNEkC+5Z2eTB4qmT9MhJyxhbwq2Hh1yX0CrGITCR+t0X69anR4PUa8PZvCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmqpHED9wG+Zg1Ix+ANBg4zaJBQFT8U7TbDp23tBn+opo847TI
	DX7jBdntGvhDY70NybIyL9j1A1H9SZWk2iEcg337fGE6PIbUwpuayG/d
X-Gm-Gg: ASbGnctTxsaZUdF98s7InDFloPP+PNBDARG1b9rI9SzQ91RpBnwv/cqZXzwWEq9YhxP
	aBERm2y+etijUz3hLAYrX/Uamq99wbAPmd+xdJE9ILOXQ6gNzL3l0TQByD6GEv+ABdWvhJTbP9g
	AtxP7xLkkrsyvy57xrJ+QcPsBGZkS2jid2WNsFMtP0xw9mRIEGIIKDIuUYDKG1jTV5qGIO3P7L3
	KkoVYmdC5ahZymh1Dh5mARKn0GsEAtCh5vOEPQ444lG6IB+LmKHv1jBe2LTrDj+fjiJwyb2Nz+k
	Ap1QsNmG4fkxuCHCaetANWXe+QvpG89KRqXYDGKFrX+nmx/d9OQ7kYqmB6pQZ6PDy16RXaOnv9H
	hrss/lhZqJq/+O68=
X-Google-Smtp-Source: AGHT+IEMlMcFeu+56I8EdU4CSHOQVBz5TmparClkfG4A6JtMLI6BFWTm09zEB1uwzM3j/ltzKMrJ9w==
X-Received: by 2002:a17:903:3204:b0:22e:6cc6:cf77 with SMTP id d9443c01a7336-2365de40addmr22682765ad.53.1749786765169;
        Thu, 12 Jun 2025 20:52:45 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:873:d810:9d97:1c69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d82sm4982105ad.146.2025.06.12.20.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 20:52:44 -0700 (PDT)
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
Subject: [PATCH v5] clocksource: Replace loop within clocks_calc_mult_shift() with __fls() for calculation of "sftacc"
Date: Fri, 13 Jun 2025 11:52:39 +0800
Message-ID: <20250613035239.3571301-1-richard120310@gmail.com>
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

v4 -> v5:
	- Update commit header to mention the use of __fls()

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

