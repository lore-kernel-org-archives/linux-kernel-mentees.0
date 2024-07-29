Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628D178C76
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 17:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722275212; cv=none; b=L9UAQ+4VEGgj9KPr2aMsh8I8Fbju7lhP7XgHp4acl0LOczdaLHJuAsXHrVZ91xWC7Q7i1TNdJMB6PcTtKRkbmRFRlesCN8rIIgzAhGXQfbChNPIBhzJSPSxtsrq+l9/bBhqkWKeL/oK7r7/+EodxTsRhGxU6EIysUorG61iPfuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722275212; c=relaxed/simple;
	bh=NHpWIQMM4KnFG3Grot6gzP7D8MYKTYzIjdAEdp8aiCU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MH3lVS5rSHZ2y3CE12+WhlMsApmCBH1QMItoZhTGDo1B2sUnz+a7fPQAGCGtJf8ZVSnB0/Yk0vaJGz3P1wnPCMsHnc5H9r5YeeI2iddgcBv3QDuI57vMlGZPHRGiFUGfmMFV0Vp+8JN/f/ZSdPLz281FtsEPCnkkJ50rIZFuWUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRlc2aFY; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRlc2aFY"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3D3A404D2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 17:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PeJB7B_xpAHa for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jul 2024 17:46:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1280D403B7
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1280D403B7
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mRlc2aFY
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1280D403B7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 17:46:49 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1fd9e6189d5so24162615ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 10:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722275209; x=1722880009; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iDMRENFOTmb9Quk1ZGoV/8u9O28UUgs55EcrP9/qbI0=;
        b=mRlc2aFYkvTEFr1ynJmzL4NAxNFp2xTYa4wYFLX6+WlZwPN6RKkZbdm4ZAsV9nxUcn
         csebdtS589cvXBCtOD8YDiIct2a73zemF7SU/m2Nl3VKVH9BSguXgeoq7v/ogY8jQn3X
         06er3stGI5mkqpI5+AlyEjbQRUnjO4GMXprJ3rdCB/r1/4V8aneNVB/7H6VOJJ58Mj08
         hH4HDj5R7TeKpa7CvXNIzsRYA4Wrht06aC2ud2j5auxO3vjcGEvza/0NKlIe/fbufEHa
         g06U6AlTSLAXrwn16wgWvpgnHOZKFff52vbv6WjCzP33bP69ry4gl2vw72QdS709kdYf
         RrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722275209; x=1722880009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDMRENFOTmb9Quk1ZGoV/8u9O28UUgs55EcrP9/qbI0=;
        b=dlmHTTuauugwPWztiLTbTttgTzNWDYaNZ4EsK967xX/GGEjkEEBx5LtUDmm8gRcrcH
         QcIfRf7biE0cDhnDXsgbERQIxl06mCURmhRgs8JjYh6J3dmV4Q865dKj4VFiIf6lEn5o
         ZhbQ3TlcTsSOpLbfR3FIYcRIvdErLXXJGUvOZdKVRFFPFjxsgsVSa1YYT9ie6ydGP0FB
         o3q2ShNU/+NJwVTg8BXST4UDMUbMEl9vjOU41CLpS0G2eJbUn7lxAgS/U9+ly6NwV+f0
         mEnTSyK4SvxkTgiTWBKyDF4gQfNuYnWwPpr5ARVgQ3oAqLg6MjaqET0O2Yk4kvW5fQNw
         W7kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh9P2lc4HhTClbGZlX26W77xWmAmtX+05/cxDy0NUllqsP9BNSEojDaWdlhMrOKlB3p/6xWl4SbCDdBjf+r/NPeTapWDUljh/lsIN4xGgt9aRMk42qW00il9miNCzu
X-Gm-Message-State: AOJu0YxePqiqf3gkt74kMicYTQS1K8OHt2ZSTz7eEu5b9E7Y6aNG1xQo
	WmgiAItI5n3T4XN8dR2zaSjn6fTgD4uJJJ9lHdRyCS2NayDvWhq4
X-Google-Smtp-Source: AGHT+IEPbuRb9okWNmz2XKujzM6ZvOBYpgEojc8nnMdhbjBvhCURiHt9M80et6ldWMjh9rgb8Vlw2Q==
X-Received: by 2002:a17:903:2446:b0:1fd:6848:bc2d with SMTP id d9443c01a7336-1ff04810ffcmr65874485ad.20.1722275209046;
        Mon, 29 Jul 2024 10:46:49 -0700 (PDT)
Received: from embed-PC.. ([106.205.109.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7d28d4dsm85991045ad.101.2024.07.29.10.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 10:46:48 -0700 (PDT)
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
Subject: [PATCH] usb: gadget: u_audio: Use C99 syntax for array initializers
Date: Mon, 29 Jul 2024 23:16:39 +0530
Message-Id: <20240729174639.446105-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert array initializers to C99 syntax by adding the '=' after each
designated initializer. This change resolves warnings from smatch
about obsolete array initializers.

drivers/usb/gadget/function/u_audio.c:1117:20:warning: obsolete array initializer, use C99 syntax
drivers/usb/gadget/function/u_audio.c:1124:28:warning: obsolete array initializer, use C99 syntax
drivers/usb/gadget/function/u_audio.c:1131:19:warning: obsolete array initializer, use C99 syntax
drivers/usb/gadget/function/u_audio.c:1138:27:warning: obsolete array initializer, use C99 syntax
drivers/usb/gadget/function/u_audio.c:1145:25:warning: obsolete array initializer, use C99 syntax

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/usb/gadget/function/u_audio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 89af0feb7512..47a1990743d8 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -1114,35 +1114,35 @@ static int u_audio_rate_get(struct snd_kcontrol *kcontrol,
 }
 
 static struct snd_kcontrol_new u_audio_controls[]  = {
-  [UAC_FBACK_CTRL] {
+[UAC_FBACK_CTRL] = {
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
+[UAC_MUTE_CTRL] = {
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

