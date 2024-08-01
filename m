Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726941487E9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  1 Aug 2024 19:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722538944; cv=none; b=jz7eug/Gt7M/MDU8ppbz+ShraNjXxdUgMA26XhAxrGx2MK0ifnwB0wpcO1Z4/okug6eU99qmOLSp+8MssqgqGYGigDEHlk8C13QXqZB4xEIytAaXPxjGqboUAbil5g7NnOdvd+r8ryMrTovLvqUoobBUFeUWaSbTCw5VI4d8B+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722538944; c=relaxed/simple;
	bh=JBYcDTXUAZ7GtFBzcyrKR/jFyrcvkCzGC4wrJZMnvQk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UsGyzT9+A8PPy2CLxdKdfwzkuWTxnjiYFYuYs5ryLUDQ21qTz2MyqCwK2/MzIxrg8Sljk/YDL6zOMxJnAuv469P7fg/JGll/hcvxeRZjerYK4tihHGIkMrMTehE9nJmCyDuacVvrGvYtVH0VlDVug+M4o941VK9TBA7zxLAfGi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPk6dHy6; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPk6dHy6"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01DA74081E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  1 Aug 2024 19:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGxmmFcanQ1g for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Aug 2024 19:02:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 113AF407C6
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 113AF407C6
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VPk6dHy6
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 113AF407C6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  1 Aug 2024 19:02:21 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1fd9e70b592so52287285ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 01 Aug 2024 12:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722538941; x=1723143741; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=djnV/nh6PubGFMg/Dfw7gNGcoLDjNtVsYJrXgxDiDzU=;
        b=VPk6dHy6s7K/2uPmBF4gka0Bv+kDX8koouAQkZRATzENlVKexdODvB5RrkEYKZN70D
         mU2+Vb3OG60rPKFmOaGdtJ0OikSXLNmwIEQ6YTzdJLbmDmKqny1d4WSTd6P+A9v9C/M4
         1uKqVUH1V7RBWWzGXmga/IQynDuJck1eeyCXdDUqUkyV66+AfVJB1l3tYlTx1h08Ao+I
         seviakWHYjakrR90oj07bUeLLW8VVOxNbdPvqtFqzfEuemggHhVIBI8qZe6osWhXPHqb
         sJfCEWl00IA1ibwWv6O6bqlrVUwHIBZ+JppP8R+7ta3qwRbeC1v4kdS8jniCldjs82gO
         z9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722538941; x=1723143741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djnV/nh6PubGFMg/Dfw7gNGcoLDjNtVsYJrXgxDiDzU=;
        b=Q9u2ZmiOJwCbOXNugnsORLfUchWe7Eg0fVlKnbHaMnwc8Tf4B00q6hayxYZRXcOG5T
         cm+ZaxWbcpRHU8b1r6a0bjwK13WM+6eghDAN0j/iuKXjwXMkLtJbXQvNbAvScz8d0I3Z
         vUT/yEbv4kWPB4MBrhX3T8FtxMz3tftZ/619pLmxChN0IeHE7XBxnJuvIwHLWpoq/QCJ
         TcDIIZ1hNZ96cm+gcKDVSBYa0U7rdJj82MfBwEqDIqg6MYALCAIjocoL31SZ+IiM8wbF
         KYILlisERPX4TXp8e1WuGa4uAj3Y9+8h5WHKIgQlvTp4v7KHbCdVxkro6GDg5qm+s59p
         UhcA==
X-Forwarded-Encrypted: i=1; AJvYcCVs41WxAtz/tIa0psvpn6fJOyJXRZo5ltGAv0RzzmF/1QcjXSMMhUF5mhsQIuHLo5nDJ0cttsBkdyxs+effK6kMlZAMm0zwUeusfRQCDZ7F1SV99Ap0/CzoapH7tvkc
X-Gm-Message-State: AOJu0YwPcZ7jt5q4Me/1peWkZeVd0RbgNoTRjgSWueFyZD/k89Z4tFL0
	7s0pmqFGw6q224CnglOvV6IB4//a75MPIdoT555FnDkh2vBKjlrY
X-Google-Smtp-Source: AGHT+IEjMrueUu0XqT4d5boPbHPBN1hOPXmC681/dUOcxNKgXeGi5+oYbUYMUI/7ToNqPAWYqRl5LQ==
X-Received: by 2002:a17:903:41c9:b0:1fd:70f7:220d with SMTP id d9443c01a7336-1ff57421fd0mr14048625ad.40.1722538940516;
        Thu, 01 Aug 2024 12:02:20 -0700 (PDT)
Received: from embed-PC.. ([106.205.109.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59176ba2sm2213215ad.209.2024.08.01.12.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 12:02:20 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: gregkh@linuxfoundation.org
Cc: skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	rbmarliere@gmail.com,
	christophe.jaillet@wanadoo.fr,
	Chris.Wulff@biamp.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: gadget: u_audio: Use C99 syntax for array initializers
Date: Fri,  2 Aug 2024 00:32:09 +0530
Message-Id: <20240801190209.500373-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert array initializers to C99 syntax by adding the '=' after
each designated initializer.

Fix the following smatch warnings:

drivers/usb/gadget/function/u_audio.c:1117:20:
warning: obsolete array initializer, use C99 syntax
drivers/usb/gadget/function/u_audio.c:1124:28:
warning: obsolete array initializer, use C99 syntax
drivers/usb/gadget/function/u_audio.c:1131:19:
warning: obsolete array initializer, use C99 syntax
drivers/usb/gadget/function/u_audio.c:1138:27:
warning: obsolete array initializer, use C99 syntax
drivers/usb/gadget/function/u_audio.c:1145:25:
warning: obsolete array initializer, use C99 syntax

Also, fix two checkpatch.pl warnings:

WARNING: please, no spaces at the start of a line
+  [UAC_FBACK_CTRL] = {$

WARNING: please, no spaces at the start of a line
+  [UAC_MUTE_CTRL] = {$

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
Changes in v2:
- Wrapped commit log to 75 columns
- Fix checkpatch.pl warnings

 drivers/usb/gadget/function/u_audio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 89af0feb7512..0b3b8adf00c0 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -1114,35 +1114,35 @@ static int u_audio_rate_get(struct snd_kcontrol *kcontrol,
 }

 static struct snd_kcontrol_new u_audio_controls[]  = {
-  [UAC_FBACK_CTRL] {
+	[UAC_FBACK_CTRL] = {
     .iface =        SNDRV_CTL_ELEM_IFACE_PCM,
     .name =         "Capture Pitch 1000000",
     .info =         u_audio_pitch_info,
     .get =          u_audio_pitch_get,
     .put =          u_audio_pitch_put,
   },
-	[UAC_P_PITCH_CTRL] {
+	[UAC_P_PITCH_CTRL] = {
 		.iface =        SNDRV_CTL_ELEM_IFACE_PCM,
 		.name =         "Playback Pitch 1000000",
 		.info =         u_audio_pitch_info,
 		.get =          u_audio_pitch_get,
 		.put =          u_audio_pitch_put,
 	},
-  [UAC_MUTE_CTRL] {
+	[UAC_MUTE_CTRL] = {
 		.iface =	SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name =		"", /* will be filled later */
 		.info =		u_audio_mute_info,
 		.get =		u_audio_mute_get,
 		.put =		u_audio_mute_put,
 	},
-	[UAC_VOLUME_CTRL] {
+	[UAC_VOLUME_CTRL] = {
 		.iface =	SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name =		"", /* will be filled later */
 		.info =		u_audio_volume_info,
 		.get =		u_audio_volume_get,
 		.put =		u_audio_volume_put,
 	},
-	[UAC_RATE_CTRL] {
+	[UAC_RATE_CTRL] = {
 		.iface =	SNDRV_CTL_ELEM_IFACE_PCM,
 		.name =		"", /* will be filled later */
 		.access =	SNDRV_CTL_ELEM_ACCESS_READ | SNDRV_CTL_ELEM_ACCESS_VOLATILE,
--
2.34.1

