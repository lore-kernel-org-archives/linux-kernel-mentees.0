Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3161848
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Nov 2023 02:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUZQPlde"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9296360B4C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Nov 2023 02:57:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9296360B4C
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eUZQPlde
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HmjTHcjYodn2
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 19 Nov 2023 02:57:39 +0000 (UTC)
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BD08A60B3C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Nov 2023 02:57:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD08A60B3C
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-66d122e0c85so5916746d6.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Nov 2023 18:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700362657; x=1700967457; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oZtE1sXq/6EOMIXLdRyz9i4gTsfOOa5vBqb4CxOsnD8=;
        b=eUZQPldeSyV9+WF2PIcwaZ8mVrrm+3IWzrMYu2AaEcsScVc+oP2h3h3oqA+fTnMQmn
         m7kF6gF+Upgnl1+aaxHy2LOUFQ0One/l/Rx3hfaCBG8i9mYbE2mR65m/uzPu9yWRbdC9
         jSXZ+jq0eLk438pELGXVUU8oOmpoxKT9wO+uOiGVj95Mm1gPDGAqtb2zy1YWUYQ57Zc0
         lqFg7O3oh3Iv6QnZD14V/9rcjqxCg1DkWtOnaNxFYnBHQiX9Zchufqq79uFEI4JLPqc8
         j7Pm2I6OGxrc3iMWTnxwLcYFNX2lQ2o4Ha9HsotBK2KtzVhZQPjcrJSIifkJKJPxy4x6
         eiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700362657; x=1700967457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZtE1sXq/6EOMIXLdRyz9i4gTsfOOa5vBqb4CxOsnD8=;
        b=huwbn3GBjML5jBDejjDsuguARh7gnGimPWS3aauEQqXfQXbUqiq+xqGzHXXxr899W3
         2N+Jz1Kicb2oLZcPp4kpv0CP8Fokt1UI4Zx5Zevf8H6km4CVE4iDjP9L1FkI9NJpURVm
         BExbXWGfvjdq/MvJTJeNIw1GWqOtPPEZdyBki4E3FlCoBv74Fzr8c3DNeRSZaR947MSJ
         oJNtSvAsh0T+xfF1wdR9NrEyMXFzGbeIVaWZ+iOTIHOFU6USalBr2O2i+eUAcrbj0EZ6
         DoZkJGjH3DGGZsuzS1C+pXRoeAADeviadrx+dA+eq4rlx6jldM585bpQVrn5gPt8gcVP
         QvUA==
X-Gm-Message-State: AOJu0Yz8tX/QWM3SbgtydcbNukKj5+5wutc4aDrYzHebf6CuC8rJcLm5
	sr3lpWDdGBefBR1LSZYGNEQ=
X-Google-Smtp-Source: AGHT+IGsCz7CzJEySl9vTXD9oR675mUX+GIN+013Sa73Md7ITvqJ85j1quqU97PyP/rhWDv6giTJKg==
X-Received: by 2002:ad4:5f08:0:b0:677:f79a:17f0 with SMTP id fo8-20020ad45f08000000b00677f79a17f0mr5498448qvb.25.1700362657542;
        Sat, 18 Nov 2023 18:57:37 -0800 (PST)
Received: from angquan-linux.. ([72.36.119.4])
        by smtp.gmail.com with ESMTPSA id v6-20020a0ccd86000000b0065b0771f2edsm1831981qvm.136.2023.11.18.18.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 18:57:37 -0800 (PST)
From: angquan yu <angquan21@gmail.com>
X-Google-Original-From: angquan yu
To: linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	shuah@kernal.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	angquan yu <angquan21@gmail.com>
Subject: [PATCH] [PATCH,breakpoints] selftests/breakpoints: Fix format specifier in ksft_print_msg in step_after_suspend_test.c
Date: Sat, 18 Nov 2023 20:57:31 -0600
Message-Id: <20231119025731.38846-1-angquan21@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: angquan yu <angquan21@gmail.com>

In the function 'tools/testing/selftests/breakpoints/run_test' within step_after_suspend_test.c, the ksft_print_msg function call incorrectly used '$s' as a format specifier. This commit corrects this typo to use the proper '%s' format specifier, ensuring the error message from waitpid() is correctly displayed.

The issue manifested as a compilation warning (too many arguments for format [-Wformat-extra-args]), potentially obscuring actual runtime errors and complicating debugging processes.

This fix enhances the clarity of error messages during test failures and ensures compliance with standard C format string conventions.

Signed-off-by: angquan yu <angquan21@gmail.com>
---
 tools/testing/selftests/breakpoints/step_after_suspend_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/breakpoints/step_after_suspend_test.c b/tools/testing/selftests/breakpoints/step_after_suspend_test.c
index 2cf6f10ab..b8703c499 100644
--- a/tools/testing/selftests/breakpoints/step_after_suspend_test.c
+++ b/tools/testing/selftests/breakpoints/step_after_suspend_test.c
@@ -89,7 +89,7 @@ int run_test(int cpu)
 
 	wpid = waitpid(pid, &status, __WALL);
 	if (wpid != pid) {
-		ksft_print_msg("waitpid() failed: $s\n", strerror(errno));
+		ksft_print_msg("waitpid() failed: %s\n", strerror(errno));
 		return KSFT_FAIL;
 	}
 	if (WIFEXITED(status)) {
-- 
2.39.2

