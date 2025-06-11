Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81EF2206BE
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749627380; cv=none; b=ShvbO7muA+w+ycfQYYVy0Zj0uGU/YqZvI9rHCXc/Edq7Jl+iuWrjyzywEsEjhMqAjG6VSMP5Pi2DY9ep0gFKSCtsM1UBau6cOrsCfif7Sxh9YVLeqgHY5EcTFdcNgQqk3dKHp5j5/RxN8QLi9K0jCQfGtRIBzJEeuGHfJkI6d2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749627380; c=relaxed/simple;
	bh=XfopYv8ohE728Xi2gCeSUZEs6u6N1lsc0va5XJdhNd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kLUO8U4ehZ7doHlkpqQFVHQS7aeLpkwraf1w61bGddQ2WCucv7uwkOtKrEYU2R7rtLwGTofNnDVOlzhcpyQI/ODE38WVVwSRt0LNv0v4x/7N0GFkSRx+xeIncWZTyXI9uNyn/YSQjoA+85QFHvLb/A0obVq8C49YrVsoztQLr64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0Q6F8sA; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0Q6F8sA"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-235d6de331fso74351825ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 00:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749627378; x=1750232178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lP9LxI7qONcXoTdRe9p4EMny84r1sepaW6Yqj2XZ3xs=;
        b=J0Q6F8sAvmD3b4BNQ9QZL/oSMOnIya4n4np4N0fIjYwUIZe3c/iiv0TugH4fmMZuov
         xmN5IwBYIzIUKYZtBkOm1QDDzRWZDM1v8hsLT50yHVO8CsddsmYftwI4tJazh+We8oiC
         dpA7auLFymnZ+N6NW+UKj4IrtijE9veC8DLhstADm1J5qria9uvIe5Tp1/zjsJVkp8FD
         +HR4br4xUHJjCgA1sw3Bbm2tPdPo3K+y+y8Y/+Sb8wVMkGST+1ALSEqRg29ERqooiDSb
         2UuxZOlMDgv7++Xx7vGjOCFz3IfCbqNAkTUdrVHdl2INu8lyk8Dpnicb0f9yMo4PCvlQ
         vpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749627378; x=1750232178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lP9LxI7qONcXoTdRe9p4EMny84r1sepaW6Yqj2XZ3xs=;
        b=OveJmjDUIxqGJ/D622qyfTJNa/ZQzDrEi9YnF1Bj1nnrxkIfyvbsI2pTmTgDuBFvAP
         A7UB4ZGnG5hU7rroVP18/42JXbE4cWrYvLvNqiNncgXMWFr5IkzB92xk5twbMRrKCBCy
         RDpqwacE8ejjcH5xDQYoaubjriJBNbRgb513DzM77MnjqEa9w70u+TlVBMdGBHuoLXGs
         RAzQjbnmE/i1Vmfiw1Ndyv8WkgVKzquohVSeOJd9SwjROKDvwb+DlrW7oZfPPHgayf7T
         C9aXiTZ6glB7C3p7gB6ZBBnl1FjmWAiCUba9qb2p8M8CRpDF/eK7zABaL7KX5/eZjOqn
         qcEg==
X-Forwarded-Encrypted: i=1; AJvYcCVblnBmX81gjbyKJBgwdnoy+gU8R6dVJtRgTHf4im0KhIpVKUMytvy8Iuu1DT4t9tJUufoFH9T2mQanKb4teZZgddyGWg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn3m9UkpkABiAr0SidHx+Gz/zHl8ft87uXvX72wBGauJSQQC02
	0s9vXeZMqxhpJYzh0Locc/cXrTR5RtDtqGAu7OzFoQG6kTQqnkmn3eV9
X-Gm-Gg: ASbGncslaSxp/I9wwA3uXtUZtM/X7ic+7MFQOT+5eIaDh4WSNT2NdzCGfnbactEM6kH
	lcGMN5C3lSHx+kU0s5zydMq3XfvIae5WNdIv1rLIiuNTpgl1vRfbKfPVJA84Zf9Pyfy7eB973LD
	kLA8/11svSYuQEjiXSwTm1L7stKunzfTm0wd8bD6/mBy32cB6UwNkDKJtg8nhjU+RqzI7Ta7TdB
	NmkObu9lbToVz1o096pjj/QIL3BsJ5JWViShep/6pIPCu/CuK7rg1strFy1JjfsfJMzg+YFuV/b
	MX6eigb9/MqAhPriVXgHxT6/7KfVmzG3wDIPCykZshOFeTjYy5+smMzBbyk7OCGyi39toIxMm2k
	UdA3roit0FZZ2Xgg4
X-Google-Smtp-Source: AGHT+IFNNhUjT+1QGSmPE5NgvvbvJ89c2dVTR659nK9UjRNnj478EreDAn07W7AdN0zsj4rdNl59mg==
X-Received: by 2002:a17:903:22ce:b0:234:d679:72e9 with SMTP id d9443c01a7336-2364261fa43mr28896165ad.12.1749627377692;
        Wed, 11 Jun 2025 00:36:17 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:52f2:ddbc:f858:ca43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2360340fbffsm81526305ad.197.2025.06.11.00.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:36:17 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: jstultz@google.com
Cc: tglx@linutronix.de,
	sboyd@kernel.org,
	linux-kernel@vger.kernel.org,
	yurynorov@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	jserv@ccns.ncku.edu.tw,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH v3] clocksource: Replace loop within clocks_calc_mult_shift() with find_last_bit() for calculation of "sftacc"
Date: Wed, 11 Jun 2025 15:36:08 +0800
Message-ID: <20250611073608.2049793-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Utilize "find_last_bit()" in replacement of while loop counting
for the decremenet of "sftacc". They're equivalent in computation result
but the former is more effective.

"find_last_bit()" will return the bit number of the last set bit of
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

Hi John, Yury,

Would you be so kind to give some suggestion/comments on how should the
usage of "find_last_bit()" be here ? I'm not sure about whether the type
conversion of "tmp" is appropriate, though compiler will pop out warnings
if not doing so.

Plus I'm thinking converting to another pointer type might might be correct
when the endianess isn't guaranteed ? (or this endianess problem should be
address and solved in filesystem layer ?)

Best regards,
I Hsin Cheng.
---
 kernel/time/clocksource.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index 2a7802ec480c..651bed1a53e7 100644
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
+	 * Using "find_last_bit(&tmp, 32) + 1" to get the bit width:
+	 * - find_last_bit(&tmp, 32) returns the bit number of the last set bit
+	 * - Plus 1 to convert 0-based index into bit width as desired
+	 *
+	 * Note: Only the lowest 32 bits of "tmp" is taken into consideration,
+	 *		 since it was already shifted right by 32 bits, the topmost 32
+	 *		 bits are guaranteed to be 0.
+	 *
+	 */
+	if (sftacc)
+		sftacc -= (find_last_bit((const unsigned long *)&tmp, 32) + 1);
 
 	/*
 	 * Find the conversion shift/mult pair which has the best
-- 
2.43.0

