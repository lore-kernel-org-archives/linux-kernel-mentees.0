Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1DD1D86FF
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  9 Jun 2025 19:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749498380; cv=none; b=KeWdh5tkELtA12tdupwZa2tJtNjyT04HrXB6fcPLiXfUKRKbeat850xuisyfp08KXdZtLV61PQH6+zMiuzT9MQTLN0VtFgRfO7YvA6HCbUztP4ereBA1hZYINX5BwVR0Ucvdcd6XJuZ2pbCC8blgRsv9y/MCNwvVx2vqc4K3gSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749498380; c=relaxed/simple;
	bh=tsQS5vYjgoSyTwBOiFvqbFkiSsjkmILrOh0sxzhs/C8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bXWLthhS7li+zMAFjJ1KCEfqUGreIjq7yHumpVshY6xW6R8+x9JU9h59v4QKNVjFuAqj3CGM+1mgd7f3mzItsUSviUdbebbpYE7G8ArS8SdjSJdvfSdJ+QwARo5dQNmB6nSShNCJxX1Wuz5jMEBcsLFUFPJHg7/ugBoe/TUy788=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btPUhtwr; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btPUhtwr"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-747ef5996edso3570497b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 09 Jun 2025 12:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749498378; x=1750103178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3kuBPdet+hShSBLgDexOYKZ1NMt1ij//HP+eZ7EoV18=;
        b=btPUhtwreWx8AEGe0BU3P+/gM+bZuY34Chtqmkw/TyvF3JdX4l1S0EPRcgEIk8fgWS
         7ePT/LTOzkA+vpC8Zu1t2k1R9pyWVLEJm5A4UBHPhnCOAlOS5aJ9vgoucah1GNmel9en
         sPwokBykO0UMgQqtKPT1nPiOAOWR9/+jLPJTtsIOHfwqmoLM4hpviheZwelzOkB5vK3D
         XilAe6FszT6B2dstte3MS37JUn07ZEVpm6wf3LngIEg25ov7mmKkqsUuLIHYq9xB4L8g
         LWcxWfLzdJifCFxaXQB94XZbWwxjkm7+jyXxY80TEkt1BpO5xq2ir7ARwKQUj0ARI0bi
         oaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749498378; x=1750103178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3kuBPdet+hShSBLgDexOYKZ1NMt1ij//HP+eZ7EoV18=;
        b=elWTN+jiw+LQFkFenAaNruh0rwGBVnky7w1MQLx+eYcl/Wpq+u2OMZJbTaOCjegFUF
         Cl/2wITCs0F/oUrQ9zUse+fxdaC7kZtWTx1XZl5S8zLBHrTnLMIo1dxyhfCmBnUYPnQw
         eTk6R5Tio52w01861K7GUEIMGw6FoLtH27sYut8QtKFRDWgBmeG2XaQfIhGZtbqBFiDe
         IDYGxEI+m+3YvyHOBYl2JBM798vKcmhJ66KLBijwGEUnL8JGqtKedbp/uYN1bgIXzw2X
         fa5l4zZZU+BLbzQDoDfmiaPRl/53EroMnwWp2f9fsqhDIfLWTV7fLSYKLpExL9HOOHFm
         oDeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX76VCAkvCMPx7mvZXTXTfFizft34TuOI0Ln4sKhNcWb1PhQL4q66qdf+jt9ZEx1rP82RIrQi9/BIEVuYB5QClXVtf+5A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw857ML/KTGCeqG0cltKWRdX0Xv85wjIcbRi1O7FGANxJebzkU0
	mKniDvCR3hMmOoKpym9sXsYLD3IUvpBZxS4k+5NxZJjuWXMgW7LTHrZm
X-Gm-Gg: ASbGncuLFjptf6TOVKtPveeOdlJJS+nWb4h89ry3eICzUcGcCDIP6r06zHBCSVbV4gw
	yIzHznjoxI8i18MPlyelr3Ba8PuwMbpwrP5InG/dR0IUN9gDrJikOu5maOJBNPXVRUhSUgmt/EW
	RhamiiyvfhFK+QW3g3HcO2BiRCW6qVBXH6efPGEea+n1ZMaaadllOCMi8BfEMExwLjtaUzN7K0g
	JyZnIz7eereh9yVR6rKHomVAs5IE4VD655rqZBPrQ7eil1sziasRVXcE+lr4FRul+HOQnRkwzN8
	yA5Q+DPPRkgy39O6+t8d6zZDWwfADfHi24p0P985sFrS9T8dhpXsR1YRrfdMB/bX9fJF2JrpGr6
	fZbaMbw==
X-Google-Smtp-Source: AGHT+IHkRM4sw5qQkvn3TOI5WSvRdJnBiE1KCLyaJHjsxSsh1uf7TbYqdTfYkJQKUBorJhfzz96P2Q==
X-Received: by 2002:a05:6a21:495:b0:1f5:8cc8:9cbe with SMTP id adf61e73a8af0-21ee24fd675mr19260356637.5.1749498378028;
        Mon, 09 Jun 2025 12:46:18 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:e987:d76b:ffe6:6a43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c7db7sm6299052b3a.138.2025.06.09.12.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 12:46:17 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: sboyd@kernel.org
Cc: jstultz@google.com,
	tglx@linutronix.de,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	jserv@ccns.ncku.edu.tw,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH] clocksource: Enhancement for clocks_calc_mult_shift()
Date: Tue, 10 Jun 2025 03:46:11 +0800
Message-ID: <20250609194611.690678-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, counting the value of "sftacc" within
"clocks_calc_mult_shift()" use a while loop to determine the amount of
decrement operation for "sftacc".
It's equivalent to the position of MSB of "tmp", for which we can
derive from (32 - __builtin_clz(tmp)). Use 32 instead of 31 here because
1UL should be treat as an amount of 1, not the index 0, and even though
"tmp" is of type u64, since it's already shifted right by 32, only the
lowest 32 bits will be possible to have non-zero value.

This change is tested against a test script [1].
Result shown that it can save a significant amount of execution overhead
for this function, which is invoked often, the whole system would likely
benefit from it.

-----------------------------
| old version | new version |
-----------------------------
|  11500.6 ns |       44 ns |
-----------------------------

The execution time is reduced around 99.7%

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
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
 kernel/time/clocksource.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index 2a7802ec480c..b4f8fffae847 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -66,10 +66,7 @@ clocks_calc_mult_shift(u32 *mult, u32 *shift, u32 from, u32 to, u32 maxsec)
 	 * range:
 	 */
 	tmp = ((u64)maxsec * from) >> 32;
-	while (tmp) {
-		tmp >>=1;
-		sftacc--;
-	}
+	sftacc -= (32 - __builtin_clz(tmp));
 
 	/*
 	 * Find the conversion shift/mult pair which has the best
-- 
2.43.0

