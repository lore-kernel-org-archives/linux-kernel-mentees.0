Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBFB13D53F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 13 Oct 2024 14:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728829523; cv=none; b=ffry0xy1in6Hi5dWOmJAXHZb1yAH9GzpFxjywGbi5qeASVJrpNG17A5JNKMIG1wBe6uBaPvdNZkqo1u6qo5lpTF9XkBU41lT7BrBypsVD9TM90hjJXS2pjVe5ljcBvj17xCc1VjQeQHMfYBKsXiKx53fnnxbQ87ghCcWVtpC8fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728829523; c=relaxed/simple;
	bh=jMPj2QKOfEDbQLxjjZXHfPkOYmbyJE9CFwFNUtvx/KM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NyFkTRfiECepRMtKKP2C0PKkeYHfDpoqBqUCXpQRtOaRpsWsic1V7zcPBT5wbvvfr6CRX18xyscCP7kM5zDA+SkjWGYu9mSh+5PgZyENGQL95VGRki8lc0msgk/pJ5xWud2nOfIc3S+QraS91kgjvwFwmPR4/Aq8jC/ynvWR7LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgQk9skO; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgQk9skO"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80096400E2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 13 Oct 2024 14:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTNVGViTiSSz for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Oct 2024 14:25:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C1C64000B
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C1C64000B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WgQk9skO
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9C1C64000B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 13 Oct 2024 14:25:20 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20cceb8d8b4so4560005ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 13 Oct 2024 07:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728829520; x=1729434320; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5qBaw6WcetARAK786CwFtGAjmur6yWCok1z7OMhs38g=;
        b=WgQk9skOPxCIheQj4ahpdv8+Tz9jHW5IGfBUGcwLs78D2s5+t3wueiPHWgSGQLhYFm
         tcUdQs0QnnlEBp0f/yRYaRo98j7jhaLZB+1/1TanR4kW2JeGYgRGU4/6i/ewyapDBGQ5
         4gh1Zm5KqrshPbVeBZj7855whom0JvWcDRYNoVUb34aAdRkrdlD6yTrZO0ZqMNyrfEZ5
         il8kFhg63Qz5oai9QfdoGh2kFHRfrFJfJKOe6fhQMtB5ZnwCZG1LkaKG8s4B03h+jrY2
         tzginzyyQpDn9sCDZtTqpqa6WhZ2eXzRKfE8Wid3GAzc6N9E+lIU+U73GnEZ1GchyLCn
         XbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728829520; x=1729434320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qBaw6WcetARAK786CwFtGAjmur6yWCok1z7OMhs38g=;
        b=RjizuBwzYXl2CM0wom6PvcOZchnPGwETHAoqjoej2WvflKOkx7XhgfZy3+ZQx1UP3w
         wf1INGVaT/SaRBqoI464HLvm+O5Jw22o+1ylj3TzJ2N6xFLy2Mv1m+a5PfqcXHRoZU06
         Nru6OhjcyNOdsd4AwO9ytJon1ZFIqrk2Pu4QcAccYJs1TXVdsHfnKFzF1ek26cNcW6z7
         WlInWYtnKFKx6E3WGe4wJf2aPMa6UqThtpNAd2HQrs1xcT6PrXnwaI2rJJ4ql1e6Mdqt
         P7Q6WlqYBcOCpIqV+VRgYOCuAM3xvCs7WAwvuWDxCsyMyZ7v/qykTTXE43+zQ5657PVU
         OzPw==
X-Forwarded-Encrypted: i=1; AJvYcCWfyIKmMZsoYXnP96o8CmzbQKDV68gA2IRFrwJMvaWmOb5u/pgC4ZeRdNKzhqvRNBvlskbPC6IsH/yyN92sT5nKS0BA2A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzeCBcrl8s7FzC4Dct7tEB9dSbzOFhr8h63sB/G7cOMSMi7q0jA
	SYqRhx0YemxoyMd1a8VKyIorwmqFxrmQxLzAMXuah0tAxKAi0y65
X-Google-Smtp-Source: AGHT+IE8oOFbATlhJ4vqkaMSGeyjZrtaqiRX69LpT6qy6t2Tpr3Icc6I4joA6l0T8gsW+SLawQvoEg==
X-Received: by 2002:a17:902:f686:b0:20c:68af:a4e3 with SMTP id d9443c01a7336-20ca03d67dfmr136140215ad.22.1728829519569;
        Sun, 13 Oct 2024 07:25:19 -0700 (PDT)
Received: from embed-PC.. ([2401:4900:1c26:6cc5:3690:fda3:d7c5:f949])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c0eb44dsm50244985ad.148.2024.10.13.07.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 07:25:19 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Frank.Li@nxp.com,
	m.grzeschik@pengutronix.de,
	dan.scally@ideasonboard.com,
	andrzej.p@collabora.com,
	quic_jjohnson@quicinc.com,
	shuzhenwang@google.com,
	arakesh@google.com,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: uvc: Remove extra semicolon from the macro
Date: Sun, 13 Oct 2024 19:55:11 +0530
Message-Id: <20241013142511.9946-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the extra semicolon after the
do {} while (0) in UVC_COPY_DESCRIPTOR macro.

Fix the following checkpatch.pl warning

WARNING: do {} while (0) macros should not be semicolon terminated
+#define UVC_COPY_DESCRIPTOR(mem, dst, desc) \
+	do { \
+		memcpy(mem, desc, (desc)->bLength); \
+		*(dst)++ = mem; \
+		mem += (desc)->bLength; \
+	} while (0);

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/usb/gadget/function/f_uvc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 40187b7112e7..edf0355d712c 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -465,7 +465,7 @@ uvc_register_video(struct uvc_device *uvc)
 		memcpy(mem, desc, (desc)->bLength); \
 		*(dst)++ = mem; \
 		mem += (desc)->bLength; \
-	} while (0);
+	} while (0)

 #define UVC_COPY_DESCRIPTORS(mem, dst, src) \
 	do { \
--
2.34.1

