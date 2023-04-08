Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43A2C7619A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  8 Apr 2023 07:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D24D60DF6;
	Sat,  8 Apr 2023 07:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D24D60DF6
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=J7XZw3bV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id by9Zq7EFcEO6; Sat,  8 Apr 2023 07:41:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 42D9260D88;
	Sat,  8 Apr 2023 07:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42D9260D88
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1ACCAC0036;
	Sat,  8 Apr 2023 07:41:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D53D6C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Apr 2023 07:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8E6B4213C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Apr 2023 07:41:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8E6B4213C
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=J7XZw3bV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hVuVKMHw_gND
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Apr 2023 07:41:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4FA942138
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4FA942138
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Apr 2023 07:41:39 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id ji2so2057150plb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 08 Apr 2023 00:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680939699; x=1683531699;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VsuUm4YX/XjWWZOsFBvpGIfKPAChp0tf2MJjRZl8j3U=;
 b=J7XZw3bVQ/DE6NA9GMQXDyqsXs3rZa5eFRlx4UOL3Bx85BCycV7BVO54AUIgRcD5ff
 1ikL0SIky5zX8N5EyS+DqpvIi/NJXPCKBWYox7CsJ7VcIuhCcIwm0Xj72ehgStnf8Qff
 zP5+AORI/YVxMmL4mmQzIrhOs4kz2rQXSTaU/M4u8CuBs8QKT+HeCudLrfTTeQYqgphE
 PFBLIFUZQfPu/ADAc26je7GOkFS8AOupO4xw+pZ/KgXKKXsTe6F0f0UGLfTsTstdJnkM
 XlqG9UMtfocWrIExcxwZm3fjMissAKUnGeKBSQ1ktx6YAPRXXujtHvQ6VY0HdnO+b3Sn
 PxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680939699; x=1683531699;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VsuUm4YX/XjWWZOsFBvpGIfKPAChp0tf2MJjRZl8j3U=;
 b=bQ44CorcWu5CLleptBrIIH/NnltJ9IV2HLPLqYDI0ULVTwLhOPTiTY92TuaeHuRHyi
 iDDF5ZOShnBipM80vfSIgQM7o/OLkWQupEs2oZbFWLAe8XI5pLO7Ky1ZQ4WuQ9qJwQzg
 rO0VY7TwYBgzr9+1FjOxTd1kC9pgm7KvMx/0aaaBYrM15Nv8rvi3PA+M8D85s3D+SxH/
 ncDdmyKL6+l0VxBZI3iaMy3mmbuu64zmSRAG5NZ4g5dIjUscftBvxmMp1GTJjEO8uUjx
 KDWrhUwg73+s+HgPB1UQfm4Rqk7QzfT2DMLZRmtqkMwbNjPhr/vN2043tt/PvLJdvy67
 4Mtw==
X-Gm-Message-State: AAQBX9cgPt9fOQNJYEdF5DRjiCuOaQk0mRaeXJoxfBowdL9MzcaaoB+k
 YVE0IochHx4xo0E1OYu8udk=
X-Google-Smtp-Source: AKy350adTwA5UgpiBoxFIoffsU9fR6DyXdRJo/cIf5rWjBULanOtWjUY8nX0OH7Qu/c6DhxLU82udQ==
X-Received: by 2002:a17:903:32ca:b0:1a1:97b5:c660 with SMTP id
 i10-20020a17090332ca00b001a197b5c660mr5312808plr.20.1680939698569; 
 Sat, 08 Apr 2023 00:41:38 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:1c0f:b9e0:61a3:ff75:f49d:df98])
 by smtp.gmail.com with ESMTPSA id
 ik23-20020a170902ab1700b001a281063ab4sm3975799plb.233.2023.04.08.00.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 00:41:37 -0700 (PDT)
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com
Subject: [PATCH] selftests: Improves rtctest error handling.
Date: Sat,  8 Apr 2023 13:10:59 +0530
Message-Id: <20230408074059.397065-1-atulpant.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: shuah@kernel.org, Atul Kumar Pant <atulpant.linux@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

When running the rtctest without root privileges the test fails
expectedly, but prints the logs that are not useful to point to the issue.
Similarly, if we pass wrong rtc device file as an argument, the test
output failure logs do not point to the issue that the rtc file is
invalid.
To handle these issues, this patch adds checks to verify uid with which
the test is run and also if the rtc_file is valid.

Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
---
 tools/testing/selftests/rtc/rtctest.c | 34 +++++++++++++++++++--------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftests/rtc/rtctest.c
index 2b9d929a24ed..9564346c63eb 100644
--- a/tools/testing/selftests/rtc/rtctest.c
+++ b/tools/testing/selftests/rtc/rtctest.c
@@ -388,16 +388,30 @@ __constructor_order_last(void)
 
 int main(int argc, char **argv)
 {
-	switch (argc) {
-	case 2:
-		rtc_file = argv[1];
-		/* FALLTHROUGH */
-	case 1:
-		break;
-	default:
-		fprintf(stderr, "usage: %s [rtcdev]\n", argv[0]);
-		return 1;
+    int ret = -1;
+
+    // Verify if the test is run as root
+    if (getuid() != 0) {
+		ksft_exit_skip("[ERROR]: Please run the test as root - Exiting.\n");
+    }
+
+    switch (argc) {
+    case 2:
+        rtc_file = argv[1];
+        /* FALLTHROUGH */
+    case 1:
+        break;
+    default:
+        fprintf(stderr, "usage: %s [rtcdev]\n", argv[0]);
+        return 1;
 	}
 
-	return test_harness_run(argc, argv);
+    // Run the test if rtc_file is valid
+    if (access(rtc_file, F_OK) == 0) {
+	    ret = test_harness_run(argc, argv);
+    } else {
+		ksft_exit_skip("[ERROR]: %s : File does not exists - Exiting\n", rtc_file);
+    }
+
+    return ret;
 }
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
