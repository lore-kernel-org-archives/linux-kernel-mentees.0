Return-Path: <SRS0=i4Xv=ZA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C367CFC6194
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 Nov 2019 07:12:37 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95F202087E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 Nov 2019 07:12:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NByuecrC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95F202087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 42AE7D4A;
	Fri,  8 Nov 2019 07:12:37 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BA9C8B9E
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  8 Nov 2019 07:12:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 75ADF710
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  8 Nov 2019 07:12:35 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id s10so3495433plp.2
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 07 Nov 2019 23:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7pnccXbop4M/TCVxdmdegnw4UV0QugzjizOP7//XPiY=;
	b=NByuecrCmCrFgGs6mIkgnq4iarpP5qncB87GnL7I3GcovS3v1IBVoqA2Yy7ORwzkhs
	ta8cEg7fSW4JL5IFbyu5rk718GXlIx6dtsYWoBYxERRPm/kMJTAaXgyPFanJKrpwTokn
	ZAx2FEZHpeVxEhIp4l7JvvyKMbRNruQ2Q2fJ09Q7EQyiIEtijbNduqKqAPoepbOFlwNk
	3VuZ2UqQI7rOp4tScP0f8DJT2ed3UJARl/pwT4f3Rz5VbtiPAAUMAzKJNm2y6LDYtJ50
	gScF2Dt6l0/jYnGGWY71rSaaM3AWDLXn1c1ab1RffG9Btwcm/bd2ctoNvMg/mFQoD6Cd
	ZR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7pnccXbop4M/TCVxdmdegnw4UV0QugzjizOP7//XPiY=;
	b=ZkyPEnsp5lyDtjjrDXqy/VOuZ1x8VtYYlrcIOqCGRODomydr0oKkCa+nwZRX7f3HoB
	+Z+8uC0q4z1KWmu2yyB8GHkqt/NDlHXPDOwDSnZD0t6L/X+pNCP8Q30CmWuqvPtGHOSH
	Wll2SVRtE3Is3ezy+xaFAFFYQKjLFFYNxfOz0OjTZRnD6vDdv/dfqoym6mXR1bOclkvk
	/+sj1eGYJzfSDt2vDs2qqOz0RSVtpnWvjaDXxSf1HlNYMY9sJoh06tLGQRtNP+7O/VIK
	ndi1kMLhP/uoJG4DhQdvaRM8enRenm8h02twwQVp+KenGgH9BS7nVN+BzlBIl2yRItYg
	wRww==
X-Gm-Message-State: APjAAAXm+qKOlfc+8AU8+Ed3Ns61XjizF1+G4dzzNnUeNLlLnWzSzxHs
	i3j3K8N/b0si8dIyM0jrWHU=
X-Google-Smtp-Source: APXvYqz9Gz799muI0Y7f8lnCgC6/XB/wMCBNiSMH8YAppsXF+ZasEk3ky+tVx+W0+3iswWV+vcGD1w==
X-Received: by 2002:a17:90a:1089:: with SMTP id
	c9mr11587095pja.8.1573197154850; 
	Thu, 07 Nov 2019 23:12:34 -0800 (PST)
Received: from localhost.localdomain ([106.216.170.180])
	by smtp.gmail.com with ESMTPSA id
	b128sm645578pfg.58.2019.11.07.23.12.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 23:12:34 -0800 (PST)
From: Vandana BN <bnvandana@gmail.com>
To: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Date: Fri,  8 Nov 2019 12:42:27 +0530
Message-Id: <20191108071227.10982-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Linux-kernel-mentees] [PATCH] v4l2-ctl:Add Support for Touch
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

Add support to verify V4L2_TCH_FMT_TU16 format touch inputs.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp |  4 ++++
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp    | 29 +++++++++++++++++++++++++++
 utils/v4l2-ctl/v4l2-ctl.h             |  1 +
 3 files changed, 34 insertions(+)

diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 184bfd64..191a18c5 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -595,6 +595,10 @@ static void print_concise_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt,
 	if (v4l_type_is_meta(buf.g_type()) && buf.g_bytesused(0) &&
 	    !(buf.g_flags() & V4L2_BUF_FLAG_ERROR))
 		print_meta_buffer(f, buf, fmt, q);
+
+	if ((capabilities & V4L2_CAP_TOUCH) && buf.g_bytesused(0) &&
+	    !(buf.g_flags() & V4L2_BUF_FLAG_ERROR))
+		print_touch_buffer(f, buf, fmt, q);
 }
 
 static void stream_buf_caps(cv4l_fd &fd, unsigned buftype)
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
index 3a29251a..99945248 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -358,3 +358,32 @@ void vidcap_list(cv4l_fd &fd)
 		}
 	}
 }
+
+#define VIVID_TCH_HEIGHT        24
+#define VIVID_TCH_WIDTH         14
+
+struct vivid_touch_buf {
+        __u16     buf[VIVID_TCH_WIDTH * VIVID_TCH_HEIGHT];
+	int test_pattern;
+};
+
+void print_touch_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
+{
+        struct vivid_touch_buf *vbuf;
+        int i=0;
+
+        switch (fmt.g_pixelformat()) {
+        case V4L2_TCH_FMT_TU16:
+                vbuf = (vivid_touch_buf *)q.g_dataptr(buf.g_index(), 0);
+		fprintf(f, "Test Pattern: %d\n",vbuf->test_pattern);
+                fprintf(f, "TU16: ");
+		for (i = 0; i < (VIVID_TCH_HEIGHT*VIVID_TCH_WIDTH); i++) {
+			if (vbuf->buf[i])
+			fprintf(f, "x: %d y: %d Pressure Value: %d\n",
+				i % VIVID_TCH_WIDTH,
+				i / VIVID_TCH_WIDTH,
+				vbuf->buf[i]);
+		}
+                break;
+	}
+}
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index b0f65e9b..b31be7f5 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -373,6 +373,7 @@ int vidcap_get_and_update_fmt(cv4l_fd &_fd, struct v4l2_format &vfmt);
 void vidcap_set(cv4l_fd &fd);
 void vidcap_get(cv4l_fd &fd);
 void vidcap_list(cv4l_fd &fd);
+void print_touch_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q);
 
 // v4l2-ctl-vidout.cpp
 void vidout_usage(void);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
