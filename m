Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA05EC6FD1D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Apr 2023 09:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6130E4016D;
	Sat,  1 Apr 2023 09:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6130E4016D
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hM9QVU/g
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FT6G0TdfgrFg; Sat,  1 Apr 2023 09:22:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 15C8440108;
	Sat,  1 Apr 2023 09:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15C8440108
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFDFEC0037;
	Sat,  1 Apr 2023 09:22:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B20F9C002F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Apr 2023 09:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75A6760A98
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Apr 2023 09:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75A6760A98
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hM9QVU/g
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5uKlfKgzp9Br
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Apr 2023 09:22:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D5C560A8B
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D5C560A8B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Apr 2023 09:22:13 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id eg48so98891970edb.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 Apr 2023 02:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680340932; x=1682932932;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2JAXjEh00e4SLFvJwSAfkOz5lCcAQOFO7gXGReDig9g=;
 b=hM9QVU/gTNXHt0T6rSic4JFPX3dZwj6smNRVN2+KTkGBsqpaZPzKm4yL+ANnu2JyP6
 hRXf2XQLgeHC0XPhpRDuSCB5AvLvlGNZCBqBUCQoBGE0xcEm2Vg1vAJfqwJGiYcl/6ph
 eThu1cHNsNkKLdVlx9fbi6j16b2lFluox1vj0UOyH8OUDFpOar3UUdt+FVTfsM3CWgoy
 ui02UUMxFPCXPP+uXKbue4PkbRt3MoKmH9t/YuNp0qgKfgnUzZM5mIeNsbFPR2Qo3VGJ
 CcSevXERu+fnqgAYb1kTXM6jsOQgcr6T0HfMiA1+LuxviP184wDZqUeubUzAzuk95/aD
 YsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680340932; x=1682932932;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2JAXjEh00e4SLFvJwSAfkOz5lCcAQOFO7gXGReDig9g=;
 b=BUTImcFv966SWspRc5vvUnouTbte7MHuV+qXXDFpw2/ILgIlJINYn0qeo26tgdvpD/
 EaVX1Mv/Y/nwhP20qIRPaOr7DY8NcFzbIul3EiDT4IkwPOGTMhCIvu/57yO6o1FEZ6Bm
 i6X6ibr303Zb54NqKfLKgOyIUVA4ttK8/piP4tzqPayOqL+jw9Rr8jSn1PQUqN2ZsHVm
 6JzeFPfIFMpaTCMtPhrPgWjREhwfK8dzP+K9e+pvN30FS9mjjSatMKXjnqBhJgiyfLK1
 QIeGgNJhJUnslEXIvQlOA8efOy3wxwDIdwjfRxzXb/DbCrrTbiCW+H1mo9H/ALNOmAbp
 yJqA==
X-Gm-Message-State: AAQBX9f81ZbUvXio+vlINQFA6eq9uZ0qKkoUGkTobRjfp5o0pqXey27J
 +c8zqLmSMds5czpxFeS4bMFrzlJYZtd6BA==
X-Google-Smtp-Source: AKy350ZC7Jp6bb0KKIDt6HVyCcf/E6RKfx79MtDfHO/qgKIZXf2ZLQRw9+yzj75P/WOHpopxMG1T5Q==
X-Received: by 2002:a05:6402:524e:b0:502:465:28e0 with SMTP id
 t14-20020a056402524e00b00502046528e0mr8967686edd.0.1680340931961; 
 Sat, 01 Apr 2023 02:22:11 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([37.252.81.51])
 by smtp.gmail.com with ESMTPSA id
 t28-20020a50ab5c000000b005024faae65esm1885147edc.10.2023.04.01.02.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Apr 2023 02:22:11 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: skhan@linuxfoundation.org
Subject: [PATCH] selftests: media_tests: Add new subtest to video_device_test
Date: Sat,  1 Apr 2023 13:22:07 +0400
Message-Id: <20230401092207.16667-1-ivan.orlov0322@gmail.com>
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
 .../selftests/media_tests/video_device_test.c | 131 +++++++++++++-----
 1 file changed, 93 insertions(+), 38 deletions(-)

diff --git a/tools/testing/selftests/media_tests/video_device_test.c b/tools/testing/selftests/media_tests/video_device_test.c
index 0f6aef2e2593..5e6f65ad2ca3 100644
--- a/tools/testing/selftests/media_tests/video_device_test.c
+++ b/tools/testing/selftests/media_tests/video_device_test.c
@@ -13,18 +13,9 @@
  * in the Kselftest run. This test should be run when hardware and driver
  * that makes use of V4L2 API is present.
  *
- * This test opens user specified Video Device and calls video ioctls in a
- * loop once every 10 seconds.
- *
  * Usage:
  *	sudo ./video_device_test -d /dev/videoX
- *
- *	While test is running, remove the device or unbind the driver and
- *	ensure there are no use after free errors and other Oops in the
- *	dmesg.
- *	When possible, enable KaSan kernel config option for use-after-free
- *	error detection.
-*/
+ */
 
 #include <stdio.h>
 #include <unistd.h>
@@ -37,45 +28,67 @@
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
+	/*
+	 * This test opens user specified Video Device and calls video ioctls in a
+	 * loop once every 10 seconds.
+	 * While test is running, remove the device or unbind the driver and
+	 * ensure there are no use after free errors and other Oops in the
+	 * dmesg.
+	 * When possible, enable KaSan kernel config option for use-after-free
+	 * error detection.
+	 */
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
