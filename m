Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7588DC6FA8F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Aug 2023 20:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF3E560E78;
	Thu, 24 Aug 2023 20:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF3E560E78
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=WUSRCgZ5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uvrF753cEmyi; Thu, 24 Aug 2023 20:25:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E437C60BA4;
	Thu, 24 Aug 2023 20:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E437C60BA4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1686C0071;
	Thu, 24 Aug 2023 20:25:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C96AC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 20:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2315C60E78
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 20:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2315C60E78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5RcqgGDpx0KT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 20:25:17 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 356F960BA4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 20:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 356F960BA4
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fee769fd53so1920555e9.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 13:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692908715; x=1693513515;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CT70rySUmSO2bksh3FYToT/efZgAxO1OuH/DvcX6pRY=;
 b=WUSRCgZ5zI1H+MXDszraZ+zjwXXxwh0GZZ0r5TZLdWKZY7ihpxk4c2mSlYd7nz35Wc
 3AGz3QmxoZVe2FsaqxnFxL6rAy10Yoonxp60VYKhLdOTw62NyFmSg6UODsOMMpP+A4Cm
 1v/eK0pHF/UsIuzflUVWa1N8mr/DYTMcAzBFnhRX2Ay2lMgjmdVt1vN2SjInjGz0bhZ0
 7wsSD+C0XbMR51TAwDvZcv8EePYLirQhPA2OiRo4wCYE9Jt3F77gRFMlIJMwuu9EKog9
 8BDVN+tMlUUcxH0+hML4Q94ul6PvaqRkHW/5RHK1RjsSPlAlsGU5T7IvXO9X9lX9FDeR
 UJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692908715; x=1693513515;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CT70rySUmSO2bksh3FYToT/efZgAxO1OuH/DvcX6pRY=;
 b=er7PP5l4DRYW7P+Wc7t5J/kJCSfBr2Yyl/7aKT42T492ORFub4Kabho3bTKDAguVKx
 mfo5/8jTNZdjLIPLvBpAdQniipW+j4zKGXMeM9F7rmVhonN7Zuf9tiYh4sL5IhgwtnhS
 qzV4TqUabC2/ZWJ2xarEuzvzjR6wkoiaHRkvDSoeFFr/oWhiu5ZAXSt8d2xm4iFJNeEk
 NNh58tsSC+bRqIxB82c0bMZX7dMvAyJWBJ8b4369bPr5BGvOwU67R/bXjWQfMbMhB3z/
 mKp27lF0333ktMs+FwAgeNsuwS91x2GLv+Pa6T1ZVTk750eATA/5jjaS9Jt4ubRlQ8Th
 ZVAw==
X-Gm-Message-State: AOJu0YztyxDpU0/XiZSIIzAQ2zpsQTQiaNtvhqTPLrqZxOR5jKlq18/v
 foEWVZ3E+3b2W8vPAHlAJAk=
X-Google-Smtp-Source: AGHT+IFVggixjRKv+k1PsUsi/3yPBGxoC4sdW7AW7aYjPdoFyMRrFWA/l3xDWvG7qGe41ZHVQn5tSw==
X-Received: by 2002:a5d:630e:0:b0:314:1ca4:dbd9 with SMTP id
 i14-20020a5d630e000000b003141ca4dbd9mr12062013wru.27.1692908715030; 
 Thu, 24 Aug 2023 13:25:15 -0700 (PDT)
Received: from mmaatuq-HP-Laptop-15-dy2xxx..
 ([2001:8f8:1163:806e:f960:7197:6afd:b6ed])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a5d5405000000b0031435731dfasm150416wrv.35.2023.08.24.13.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 13:25:14 -0700 (PDT)
From: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
To: keescook@chromium.org, edumazet@google.com,
 willemdebruijn.kernel@gmail.com, wad@chromium.org, luto@amacapital.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
 shuah@kernel.org, pabeni@redhat.com, linux-kselftest@vger.kernel.org,
 davem@davemloft.net
Subject: [PATCH v2 1/2] selftests: Provide local define of min() and max()
Date: Fri, 25 Aug 2023 00:24:14 +0400
Message-Id: <20230824202415.131824-1-mahmoudmatook.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: David Laight <David.Laight@aculab.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

to avoid manual calculation of min and max values
and fix coccinelle warnings such WARNING opportunity for min()/max()
adding one common definition that could be used in multiple files
under selftests.
there are also some defines for min/max scattered locally inside sources
under selftests.
this also prepares for cleaning up those redundant defines and include
kselftest.h instead.

Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
Suggested-by: David Laight <David.Laight@aculab.com>
---
changes in v2:
redefine min/max in a more strict way to avoid 
signedness mismatch and multiple evaluation.
is_signed_type() moved from selftests/kselftest_harness.h 
to selftests/kselftest.h.
---
 tools/testing/selftests/kselftest.h         | 24 +++++++++++++++++++++
 tools/testing/selftests/kselftest_harness.h |  2 --
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index 829be379545a..93d029471cc9 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -55,6 +55,30 @@
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
 #endif
 
+#ifndef is_signed_type
+#define is_signed_type(var)       (!!(((__typeof__(var))(-1)) < (__typeof__(var))1))
+#endif
+
+#ifndef min
+#define min(x, y) ({ \
+	_Static_assert(is_signed_type(typeof(x)) == is_signed_type(typeof(y)), \
+	       "min: signedness mismatch"); \
+	typeof(x) _x = (x); \
+	typeof(y) _y = (y); \
+	_x < _y ? _x : _y; \
+})
+#endif
+
+#ifndef max
+#define max(x, y) ({ \
+	_Static_assert(is_signed_type(typeof(x)) == is_signed_type(typeof(y)), \
+	       "max: signedness mismatch"); \
+	typeof(x) _x = (x); \
+	typeof(y) _y = (y); \
+	_x > _y ? _x : _y; \
+})
+#endif
+
 /*
  * gcc cpuid.h provides __cpuid_count() since v4.4.
  * Clang/LLVM cpuid.h provides  __cpuid_count() since v3.4.0.
diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 5fd49ad0c696..e4e310815226 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -699,8 +699,6 @@
 	if (_metadata->passed && _metadata->step < 253) \
 		_metadata->step++;
 
-#define is_signed_type(var)       (!!(((__typeof__(var))(-1)) < (__typeof__(var))1))
-
 #define __EXPECT(_expected, _expected_str, _seen, _seen_str, _t, _assert) do { \
 	/* Avoid multiple evaluation of the cases */ \
 	__typeof__(_expected) __exp = (_expected); \
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
