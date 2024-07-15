Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2FF4C8F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jul 2024 02:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721009208; cv=none; b=jhCHcDXrVJ0jZuhB9nFZVug/ydJVVGJhsgaAw2TWGT+36hLlYAB6AZkwK02DtedVF63aDIM7pUWPGDbk/TonGsv4MU+9GRm43i+CNRsD3+MkN+ozJTAg+Py8GzWCSZPQ+JHkccXxuJv8fbI+J0oBkrueGeE4FOHiDQJ3vZ2sGvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721009208; c=relaxed/simple;
	bh=x7vpIAZnmMp42pJsHPWboy7B+F2KkwRLCmm+h+qDv60=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fnvg9kEpppa6CtLTYwlnutzNGvkZTXIYEV6arQx0iKP9uD46ID4BREiDSHkOkwZ9/0mQGzooFM5ak/d7PG3LRf7bi8HGWl13TqL4EJEYJhE0dOesYLst5mrVZZmtGHWdZJiM00GdmANjHTsbJi9zRpP8qHxMPJbdNYTgGdmst0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJOHrCSZ; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJOHrCSZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80F5D6063E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jul 2024 02:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z4rOPJFJkZHs for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jul 2024 02:06:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A312460644
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A312460644
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gJOHrCSZ
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A312460644
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jul 2024 02:06:45 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7611b6a617cso2233466a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 14 Jul 2024 19:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721009205; x=1721614005; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FT3xT6TOmSY7sFiQnSnrJGX8mNO+K8BiXdhqST/uuWs=;
        b=gJOHrCSZTBWRiq2ZGtkYtOiWU2oUP3qVP6xP7BoCv/Z+gCSXb1p0Ca2r/FV4sHQL/t
         t40sE2J+ejiobs+I4HKQx6IxIc1qUJUuJAr5OdvK+YArFweKyI11BlET39MIu2cDhGjC
         +7ieG+uPga1/YHLwg8RsW1yjt0pGhLCTIJrXD/ETzjdX/6jXEkoWIIZv3cdoELPZ2Tw6
         p35TF6Hd6NzoPH/M6sl5/hmcymg18cILmRbL6Jd0UcWETeK8tTIVe1NB/OuF0zLDka/e
         5Q9BDoFrUXcYGEyeihwkUMUY8WnOkH5QFDU/IYfQMqpq+jmfXGEHweTQIi6IHeS3nJqm
         rXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721009205; x=1721614005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FT3xT6TOmSY7sFiQnSnrJGX8mNO+K8BiXdhqST/uuWs=;
        b=bITI8w853wNDzwIxzqXax+9eoL9WlkTIl1C4Jt6bcxudT492kJyK7YzhhcUu7cKRyq
         lRPDagagHA/hHjN0RQ7Od4wyx/WTo9h4OdYOpaSPM1SYsKRKY7g+U875vG/vXHIsX14L
         LKjQ6jLfDL8394F9QknwA2OHFHyDizeylAZ5J5QI4iRH7+bTUObO9AxviYRt5T+O00/y
         P/ck07LoV3vZkcDdSHPNWUE6gpAmpK3NYwx4+rnIajUVwtz28gkTX8Uj2CgU1+nuT0AY
         iziL8D/jEtLiew/HLUmV6uvivhlGqF6yRwCRUbjSHvJoZRQjZkHeuP2w+MtvCPFWtEp6
         UqFg==
X-Forwarded-Encrypted: i=1; AJvYcCX8jYRNTxMK/lIpgFd0PqkIxUrIegBcYLeqctApCTUUCa5OiaJWJYSV3fhhSCZ9prpv7WBIkq8emCzGDPf9M6uVhZe4PdVHOnlQj39UAsVa2RJ7xpqySFpASyKVCazE
X-Gm-Message-State: AOJu0YzeyLQSBkNU8WgnZLDwELtRI55mDRfxt70bWPspDFHCQcMPSRmV
	EzBOFgcv/eH2FpmCh9fpz77ya45kkWIFluLG6CJFAYFg6hSryzIq
X-Google-Smtp-Source: AGHT+IG2ztbx61XE3BW9qucN0c7VQTXpTloWyv04BLVHESTxauojVdBkZLqongwr3D4sNTKcCiEx+Q==
X-Received: by 2002:a05:6a21:3393:b0:1c2:8d22:c6a6 with SMTP id adf61e73a8af0-1c2982158c3mr18450799637.8.1721009204746;
        Sun, 14 Jul 2024 19:06:44 -0700 (PDT)
Received: from embed-PC.. ([122.183.46.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc270f0sm29267445ad.131.2024.07.14.19.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 19:06:44 -0700 (PDT)
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
Date: Mon, 15 Jul 2024 07:36:34 +0530
Message-Id: <20240715020634.876011-1-abhishektamboli9@gmail.com>
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

