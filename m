Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9792AC761AF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Apr 2023 20:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3965D417CD;
	Wed,  5 Apr 2023 20:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3965D417CD
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SfZj5ver
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0hvme_6Gqet4; Wed,  5 Apr 2023 20:04:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A4CFD417A1;
	Wed,  5 Apr 2023 20:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4CFD417A1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83129C0037;
	Wed,  5 Apr 2023 20:04:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F9D2C002F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Apr 2023 20:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4815A60F3A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Apr 2023 20:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4815A60F3A
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SfZj5ver
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZNrkgYe9B4-4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Apr 2023 20:04:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC13F60F34
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC13F60F34
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Apr 2023 20:04:55 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-947a47eb908so60210166b.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 05 Apr 2023 13:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680725094;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l4ybHK0lZfDPR4eVPVTes6mvN8filGMsCKj+vPBAOkc=;
 b=SfZj5verxakoXZSU3gC/cXy7s7AfRZIwhg0IWLmtOH5SyE3h/YNrp60UByYgAnt7v4
 gxcJWWvgmjT2qe76JuFzWh7g56XFG3SKTCF+bqM5Viml0xwTF274jjduEp3XaSNF7cZz
 wxMoTkCYWP3dUOFF+h30hIJ9y/D82UIWIOktbYP/qGhv5KdsKt4NbDCOK3ZVvR9Xvdel
 tHpACLggCxUQ/0DdwMkln/3PyRLP2hvh9+A48TvPJPr8MqrC80LpghKheb+YgYTJvhPC
 l9wD73ReEPbaDFSZje17JH4ALInN11J049YDD8NDnmSai4cRj1Wt7dIlriK8sB2N3aNL
 AkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680725094;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l4ybHK0lZfDPR4eVPVTes6mvN8filGMsCKj+vPBAOkc=;
 b=KsgAv+4aZVeICE3l+WFStdmYzu1eNBViEgu1ay5Bls/EO0ZvD7S1CymbSUsHhKayZ/
 W7g9tc+u9LFJOBbiD7vCTBDNTLj4A9xPMY+oigdUw254sJ+SAl5QcCmu85Bx5zQaZwXW
 YQRlSEANCkOz8e24DjqlgN+pYhLnzAuYpGFT3W5/4ABXPkFNQc6Fqj/mRRaytLs9HomQ
 FlSGKFP7um2U5IfzIP43KoFoJOimcFfQ1KTrphT0T9RziZDDevaaiLP9sd84BrqK5fK7
 eZgPDf1gBFw7xL6X82+zYgX2txSA/T6fbKZ4sX0YwIkRgecpCxMh0C1RuCmpdZ7tmHEG
 wmzw==
X-Gm-Message-State: AAQBX9fxluwcqxQHKcYKJa2Dhv4yxoiBhTgsNX0eMONcdVQhsIAkP1WQ
 uXwDhpNkZQOExv0ekgFG0ss=
X-Google-Smtp-Source: AKy350aif9Lwcm9XVSUrafHAfP1cry8Ie2vf0NydHq4XGIP8Qwgof/0CgfCcQaqIkul9njwPwDUnDA==
X-Received: by 2002:a05:6402:51d4:b0:502:1cf6:f52c with SMTP id
 r20-20020a05640251d400b005021cf6f52cmr4212056edd.4.1680725093943; 
 Wed, 05 Apr 2023 13:04:53 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([37.252.92.225])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a50c281000000b00502b0b0d75csm3655030edf.46.2023.04.05.13.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 13:04:53 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: shuah@kernel.org
Subject: [PATCH v2] selftests: media_tests: Add new subtest to
 video_device_test
Date: Thu,  6 Apr 2023 00:04:50 +0400
Message-Id: <20230405200450.6254-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Ivan Orlov <ivan.orlov0322@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
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

Add new subtest to video_device_test to cover the VIDIOC_G_PRIORITY
and VIDIOC_S_PRIORITY ioctl calls. This test tries to set the priority
associated with the file descriptior via ioctl VIDIOC_S_PRIORITY
command from V4L2 API. After that, the test tries to get the new
priority via VIDIOC_G_PRIORITY ioctl command and compares the result
with the v4l2_priority it set before. At the end, the test restores the
old priority.

This test will increase the code coverage for video_device_test, so
I think it might be useful. Additionally, this patch will refactor the
video_device_test a little bit, according to the new functionality.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
V1 -> V2: Revert the test description change

 .../selftests/media_tests/video_device_test.c | 111 +++++++++++++-----
 1 file changed, 83 insertions(+), 28 deletions(-)

diff --git a/tools/testing/selftests/media_tests/video_device_test.c b/tools/testing/selftests/media_tests/video_device_test.c
index 0f6aef2e2593..2c44e115f2f0 100644
--- a/tools/testing/selftests/media_tests/video_device_test.c
+++ b/tools/testing/selftests/media_tests/video_device_test.c
@@ -37,45 +37,58 @@
 #include <time.h>
 #include <linux/videodev2.h>
 
-int main(int argc, char **argv)
+#define PRIORITY_MAX 4
+
+int priority_test(int fd)
 {
-	int opt;
-	char video_dev[256];
-	int count;
-	struct v4l2_tuner vtuner;
-	struct v4l2_capability vcap;
+	/* This test will try to update the priority associated with a file descriptor */
+
+	enum v4l2_priority old_priority, new_priority, priority_to_compare;
 	int ret;
-	int fd;
+	int result = 0;
 
-	if (argc < 2) {
-		printf("Usage: %s [-d </dev/videoX>]\n", argv[0]);
-		exit(-1);
+	ret = ioctl(fd, VIDIOC_G_PRIORITY, &old_priority);
+	if (ret < 0) {
+		printf("Failed to get priority: %s\n", strerror(errno));
+		return -1;
+	}
+	new_priority = (old_priority + 1) % PRIORITY_MAX;
+	ret = ioctl(fd, VIDIOC_S_PRIORITY, &new_priority);
+	if (ret < 0) {
+		printf("Failed to set priority: %s\n", strerror(errno));
+		return -1;
+	}
+	ret = ioctl(fd, VIDIOC_G_PRIORITY, &priority_to_compare);
+	if (ret < 0) {
+		printf("Failed to get new priority: %s\n", strerror(errno));
+		result = -1;
+		goto cleanup;
+	}
+	if (priority_to_compare != new_priority) {
+		printf("Priority wasn't set - test failed\n");
+		result = -1;
 	}
 
-	/* Process arguments */
-	while ((opt = getopt(argc, argv, "d:")) != -1) {
-		switch (opt) {
-		case 'd':
-			strncpy(video_dev, optarg, sizeof(video_dev) - 1);
-			video_dev[sizeof(video_dev)-1] = '\0';
-			break;
-		default:
-			printf("Usage: %s [-d </dev/videoX>]\n", argv[0]);
-			exit(-1);
-		}
+cleanup:
+	ret = ioctl(fd, VIDIOC_S_PRIORITY, &old_priority);
+	if (ret < 0) {
+		printf("Failed to restore priority: %s\n", strerror(errno));
+		return -1;
 	}
+	return result;
+}
+
+int loop_test(int fd)
+{
+	int count;
+	struct v4l2_tuner vtuner;
+	struct v4l2_capability vcap;
+	int ret;
 
 	/* Generate random number of interations */
 	srand((unsigned int) time(NULL));
 	count = rand();
 
-	/* Open Video device and keep it open */
-	fd = open(video_dev, O_RDWR);
-	if (fd == -1) {
-		printf("Video Device open errno %s\n", strerror(errno));
-		exit(-1);
-	}
-
 	printf("\nNote:\n"
 	       "While test is running, remove the device or unbind\n"
 	       "driver and ensure there are no use after free errors\n"
@@ -98,4 +111,46 @@ int main(int argc, char **argv)
 		sleep(10);
 		count--;
 	}
+	return 0;
+}
+
+int main(int argc, char **argv)
+{
+	int opt;
+	char video_dev[256];
+	int fd;
+	int test_result;
+
+	if (argc < 2) {
+		printf("Usage: %s [-d </dev/videoX>]\n", argv[0]);
+		exit(-1);
+	}
+
+	/* Process arguments */
+	while ((opt = getopt(argc, argv, "d:")) != -1) {
+		switch (opt) {
+		case 'd':
+			strncpy(video_dev, optarg, sizeof(video_dev) - 1);
+			video_dev[sizeof(video_dev)-1] = '\0';
+			break;
+		default:
+			printf("Usage: %s [-d </dev/videoX>]\n", argv[0]);
+			exit(-1);
+		}
+	}
+
+	/* Open Video device and keep it open */
+	fd = open(video_dev, O_RDWR);
+	if (fd == -1) {
+		printf("Video Device open errno %s\n", strerror(errno));
+		exit(-1);
+	}
+
+	test_result = priority_test(fd);
+	if (!test_result)
+		printf("Priority test - PASSED\n");
+	else
+		printf("Priority test - FAILED\n");
+
+	loop_test(fd);
 }
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
