Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A50C4167D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Nov 2023 15:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB21885442;
	Fri,  3 Nov 2023 15:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB21885442
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NGQh770F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7cmpwR0jtu2a; Fri,  3 Nov 2023 15:50:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CCEBF8543A;
	Fri,  3 Nov 2023 15:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCEBF8543A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2F30C0039;
	Fri,  3 Nov 2023 15:50:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACFECC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 15:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86E75433A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 15:50:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86E75433A8
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NGQh770F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K8IDGbz8Bg-3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 15:50:29 +0000 (UTC)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C699431DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 15:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C699431DE
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5b96c2cfe24so133686a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 03 Nov 2023 08:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699026628; x=1699631428;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UzPpHStW8fd1Sa/XvvRvmDs3ZUV3eU14pMhnuEaZyXo=;
 b=NGQh770FsjQwk0euz9j+8cgy3ShA4M77odilI4ZBw8kFOLoEEGzKcfUQmKpVIKZFsT
 33/v/yzRBEr4/m66HCrtWxYJiHHtB3/DGi7FVQ2ctRlxj7MId0j1c14J81HKcW94O7x8
 6KqxQWjl7LZJiA17gqwOwm+jeuBPzt/+smAeTzMcWjQTyHHQYD4qAVTUkgrRNPcOphz+
 tJZMOb+JXeuibHz6y3YS14NX2lxmG2lpJWpv9hi9pdnbJnKpTIrEWukjT1PdpdsVSbW8
 Gjy8kQgQn3a/PPsT1MN7iMia5VGbZWPp0Z80IdpqPA5NK/Dmf1BnMu82eBREOSmZRpzP
 9jSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699026628; x=1699631428;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UzPpHStW8fd1Sa/XvvRvmDs3ZUV3eU14pMhnuEaZyXo=;
 b=nD+ySHwAD8h3tgqQbiUmjE8dNNgXgJDp9qsw6DUw1hjCKSvdJOvOJivHysz06m5CDG
 2zh5A0sfF1k44ekqC7v7T06b0weR1odnktd/ilA2fKIdPGRKc+vY9aU/ZlCTxFD3VAcd
 MlnAIb/JjDw3PNiJ9w0iWcS/SLt4hU7+58ueR3TDZdfRdpJWSK1ChNqHNSRcWBHC6rCP
 hV4oCqaVVaurywSuF9KOFDGXCDeMfNVKS6QZsXAQ+1pk7EZl4BjJMzOMErHWsIFkT1W9
 O5z05w1D1hq0x/QJeZhSbBQk2VqnmyrrbQuMqNvR9YKCjM7XtO6C2LvJudQTRkBuA7k5
 GBQw==
X-Gm-Message-State: AOJu0YzeeB4j4BUohiUY1P6pSSWshBJYbZDBfZOAKyuGqINvw+prc6Am
 JZ15I8ZiMlZs9StLqQOZdm4=
X-Google-Smtp-Source: AGHT+IF1P3WyRtABQCc7gbOnKw/OsbBmL5Ob0nkdHmczkHloZMZMVQhl0Mb+oTGSIJdMVU+1lpfLXQ==
X-Received: by 2002:a17:90a:7064:b0:27d:32d8:5f23 with SMTP id
 f91-20020a17090a706400b0027d32d85f23mr21154782pjk.2.1699026628449; 
 Fri, 03 Nov 2023 08:50:28 -0700 (PDT)
Received: from abhinav.. ([103.75.161.210]) by smtp.gmail.com with ESMTPSA id
 v3-20020a17090ad58300b00274922d4b38sm1469858pju.27.2023.11.03.08.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 08:50:28 -0700 (PDT)
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drivers: gpu: Fix warning using plain integer as NULL
Date: Fri,  3 Nov 2023 21:20:13 +0530
Message-Id: <20231103155013.332367-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: Abhinav Singh <singhabhinav9051571833@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
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

sparse static analysis tools generate a warning with this message
"Using plain integer as NULL pointer". In this case this warning is
being shown because we are trying to intialize a pointer to NULL using
integer value 0.

Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
---
 drivers/gpu/drm/radeon/clearstate_evergreen.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/clearstate_evergreen.h b/drivers/gpu/drm/radeon/clearstate_evergreen.h
index 63a1ffbb3ced..3b645558f133 100644
--- a/drivers/gpu/drm/radeon/clearstate_evergreen.h
+++ b/drivers/gpu/drm/radeon/clearstate_evergreen.h
@@ -1049,7 +1049,7 @@ static const struct cs_extent_def SECT_CONTEXT_defs[] =
     {SECT_CONTEXT_def_5, 0x0000a29e, 5 },
     {SECT_CONTEXT_def_6, 0x0000a2a5, 56 },
     {SECT_CONTEXT_def_7, 0x0000a2de, 290 },
-    { 0, 0, 0 }
+    { NULL, 0, 0 }
 };
 static const u32 SECT_CLEAR_def_1[] =
 {
@@ -1060,7 +1060,7 @@ static const u32 SECT_CLEAR_def_1[] =
 static const struct cs_extent_def SECT_CLEAR_defs[] =
 {
     {SECT_CLEAR_def_1, 0x0000ffc0, 3 },
-    { 0, 0, 0 }
+    { NULL, 0, 0 }
 };
 static const u32 SECT_CTRLCONST_def_1[] =
 {
@@ -1070,11 +1070,11 @@ static const u32 SECT_CTRLCONST_def_1[] =
 static const struct cs_extent_def SECT_CTRLCONST_defs[] =
 {
     {SECT_CTRLCONST_def_1, 0x0000f3fc, 2 },
-    { 0, 0, 0 }
+    { NULL, 0, 0 }
 };
 static const struct cs_section_def evergreen_cs_data[] = {
     { SECT_CONTEXT_defs, SECT_CONTEXT },
     { SECT_CLEAR_defs, SECT_CLEAR },
     { SECT_CTRLCONST_defs, SECT_CTRLCONST },
-    { 0, SECT_NONE }
+    { NULL, SECT_NONE }
 };
--
2.39.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
