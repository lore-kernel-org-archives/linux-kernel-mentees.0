Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEF6156F46
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 16 May 2024 17:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715881951; cv=none; b=CzQ5IB8B3L4BLhvshoH3SpvjHUQDlDGXwLIygAiiqIHAKerz4VQXYSavGZn2g9e+GlTOEac9Vki7ShAGrcSmGm7tjCGrP/ySlGYyFmvUmhX5+U6210cQd7cxfzsLV/6SX6xHjxTYWaXEEYbUDoVYr2zB01ZY/vLsZWOnAQrGD6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715881951; c=relaxed/simple;
	bh=zOc0bq0Q8lD7wXxEGGsJlN5D1ud+1kdpAHTSlJsG4v8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IWIVc1plzhmu1TKt1KjlUJ226GvOc0QODdGfIJarnbSdW/PJtnQhGy5PObp7FNfvgcTueEdYKsf6ZPeBJdEbuGo5++sr2T3x1UXj5h3GyN8BFqEGfddZBlfJuzAG+KPED29Jlpzd1aOKmHcJlIHs5d58x4eYHrEXq9U9+0rPBrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7Yl+qjd; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7Yl+qjd"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE6F460F9B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 16 May 2024 17:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RuaMXojY6fnb for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 May 2024 17:52:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=yskelg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F78460780
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F78460780
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N7Yl+qjd
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9F78460780
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 16 May 2024 17:52:28 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6f44dc475f4so431007b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 16 May 2024 10:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715881948; x=1716486748; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gDmhWEiMJ5CnV3oGozg5alnQWKxPvnqmiaAt5RGDDRk=;
        b=N7Yl+qjd2VJYxpvNf36dLvMCa94kUdo6nwBmoc7ZK+f366aP+w2lZ2LYblKCcnmB5/
         RLhE1PM944ssETI10MSICNSQy5YrkozgVKSNMrsuIgh5RodAK1/Su6feHFNDxd94RAY+
         oRMEFoka3DDWPzDutK62RjdZSW3g9kLC2lqdGO9tfITP+peLVH7wJhSHcqguyTwTsnW7
         9uRPXcF+ApNFZUhiPiH0IJqy/1XCd5Rtk6U3aeXD3oilGHYjUL18BvqWxfM901Qdg0tU
         rBbQsGXeZNza+Xm5NLoWyKuQ68NeM86mThGiV5lwt+8JqV2lAYMIHWVJ67WtNVU+QGaG
         Kyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715881948; x=1716486748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDmhWEiMJ5CnV3oGozg5alnQWKxPvnqmiaAt5RGDDRk=;
        b=IUJVYaxJvs2WMaJlGJLA+oMReHNLHLAViu1avt9yvgGpclOXsvkcSumYU/mYlVYDQA
         r5gSBIKABbpZxtrQDuDcna7hbvI4V6tZ1HzNCa4/gCIV9sIE8xnDF3dsuCOueHn/1pgN
         FLnWNwnOnXJtjjR/W+6e6NALqkn5ODKWyzicFd+Md61NvRkfSEqKu9G0MBIfX+xqcw/g
         ebCahUF40k/bBdok9UhGQw4O3m938y+bad7GfD1aPIjR1sJxbPqayy7N8wRwm6tLVxGz
         5FZXP+8TVqvfhG4HyVuUuZqaGXnSG3Xwlf8VPlYw5rPxEA6o9vY3+wsExSUYVp8Q4498
         aBkA==
X-Forwarded-Encrypted: i=1; AJvYcCXy5WLmQRqGKATUTXfr46x/ubjXa1JXT619cC/vpaHOzCJ5JV3tNkfoTnOEfdhm6hLE277I08Y1mqRk3JAaRMXOpmn0CRikDz0+//9/DfaRsin35NrAXrteCblS4DIc
X-Gm-Message-State: AOJu0YwzalxM6It1RQwn36yLdlzRVQd0g+nxqW+qSfhbMzTBVKNalu7+
	xA7UYgyhJwsVWGmINzBrFDexeo4rc5BYhitzMuanesTjtyoblMEr
X-Google-Smtp-Source: AGHT+IEqqTKsoVZ8amcaBaR5SBa3obXoMNGF0fq41SqYvXalybmo7t+x8s8FV0XSDLDU1WYqXds51Q==
X-Received: by 2002:a05:6a00:1ad0:b0:6e6:9f47:c18c with SMTP id d2e1a72fcca58-6f4e03858b3mr23691543b3a.33.1715881947854;
        Thu, 16 May 2024 10:52:27 -0700 (PDT)
Received: from paran-QEMU-Virtual-Machine.. ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4f2cdedb7sm9727615b3a.52.2024.05.16.10.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 10:52:27 -0700 (PDT)
From: yskelg@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Austin Kim <austindh.kim@gmail.com>,
	shjy180909@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yunseong Kim <yskelg@gmail.com>
Subject: [PATCH] line6: add midibuf init failure handling in line6_init_midi()
Date: Fri, 17 May 2024 02:47:38 +0900
Message-Id: <20240516174737.415912-1-yskelg@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yunseong Kim <yskelg@gmail.com>

This patch fixes potential memory allocation failures in the
line6_midibuf_init(). If either midibuf_in, midibuf_out allocation
line6_midibuf_init call failed, the allocated memory for line6midi
might have been leaked.

This patch introduces an error handling label and uses goto to jump there
in case of allocation failures. A kfree call is added to release any
partially allocated memory before returning the error code.

Signed-off-by: Yunseong Kim <yskelg@gmail.com>
---
 sound/usb/line6/midi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/usb/line6/midi.c b/sound/usb/line6/midi.c
index 0838632c788e..abcf58f46673 100644
--- a/sound/usb/line6/midi.c
+++ b/sound/usb/line6/midi.c
@@ -283,13 +283,18 @@ int line6_init_midi(struct usb_line6 *line6)
 
 	err = line6_midibuf_init(&line6midi->midibuf_in, MIDI_BUFFER_SIZE, 0);
 	if (err < 0)
-		return err;
+		goto error;
 
 	err = line6_midibuf_init(&line6midi->midibuf_out, MIDI_BUFFER_SIZE, 1);
 	if (err < 0)
-		return err;
+		goto error;
 
 	line6->line6midi = line6midi;
 	return 0;
+
+error:
+	kfree(line6midi);
+	return err;
+
 }
 EXPORT_SYMBOL_GPL(line6_init_midi);
-- 
2.34.1

