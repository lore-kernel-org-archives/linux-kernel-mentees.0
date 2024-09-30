Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0057B1CFA9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 30 Sep 2024 14:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727707991; cv=none; b=MFFKhHLHk+KU0TC1wBZSuZUD6IedrYTfAuuZa5rVe5iKZqEuqLnd/QEAwIFxRmCGMt+ay5sbPULMXleRSlbjmQRqeRBl6uekrVivH3Fnj7lLHd5ugNGD3Uzl9nXoh+s+FY2a/fHQgjqvSwtu3SEFFSdP8P8LFaz15xUBu0CebYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727707991; c=relaxed/simple;
	bh=IEZyqI9p1dpM5X1TBW/EbjmZcituc+iGg9sknYVX4co=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BNk8nO7YI+BHb8N09H41JVgrKJjgpqydf/iZV/6nuwl2q9ZvBffUt2lLwnnQBr/73CygGiOQosPhXEwYGXU5Bj+Qm8T2TefZu7zy5TQa6O7e1QANfQHQQ7pR1tlnf/3t90XLjEmmFylobYoT05NVemGPXxmBATKR1wPhMgVYkKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6LkXdno; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6LkXdno"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A404540614
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 30 Sep 2024 14:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38nFrizfsJGo for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Sep 2024 14:53:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C93B8405F2
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C93B8405F2
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d6LkXdno
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C93B8405F2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 30 Sep 2024 14:53:08 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2e0a950e2f2so3445621a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 30 Sep 2024 07:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727707988; x=1728312788; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yzZUrPo7VwF9JRFW0jXLatknVBb1CHVP9jTUv/xcRtc=;
        b=d6LkXdnoxs0gTAuNYiGr7j2wQOCzOLB5An0kJ3MJkUh5XCAXNziX3aXxyYe96kd3fN
         Sl41y0lkrgvMXGMCKxV0cN5Mkn2YUEznPVwnBVtZepeNS1dDxhC19vyC045VX8PzDuk1
         laOC4bi97SkXwazormpoL/smX/imtWic6GP6YzIayDKOa4zbs1Y84s8nirLUh4cH7bCL
         GHdInYCi8Im+G+D1IeCO+z3KoXWi5U9wAlgr7yzUIX9R4maz0cRbYHUBabNdGH2Vmz79
         tFmaNCTzIbe5hi9uWnnwreesctRHUno/UNuUsHm0kEQJ+Fdp20M3ddjEGSSAktBcRrp7
         98tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727707988; x=1728312788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yzZUrPo7VwF9JRFW0jXLatknVBb1CHVP9jTUv/xcRtc=;
        b=McS2KU50MF2Rxz1Rylx4/DjWOuIVxUZoENKFzGzomWDmdt3ovNkKUKAhgpdNVsvbC/
         AG1njE4n+IDcOP8lnivGjnUjDPa8GmjdKNfmjsHqVqd7TAxElIxm3cDb0QKS+LNqgcn2
         V7VEW+st7RcKltyXFyIhe6MnArvZO3T5IIyxafdQCuI0CsYVn4NKs/BoLUkv6IDG26ey
         AEmgoD0tgTdw2IXyPIcqstiWk+tRX3ErljygGtICUdVgcaV1m69lXNA5EP2OAvtyiKV2
         tIk9uTXlu+voiOq60XOzYNAgQlfm6rhMNqUBAfuuBSoXutQDzkTWdJyufKk3s01PwdbQ
         5CcA==
X-Forwarded-Encrypted: i=1; AJvYcCW2NLztX7mRm2yU0KXKG4lo2uLIyVC4jG0hd5I6RcFToA42RkppCBv8AWfjBRFLyVF+6BgbKosPW8LttknRUR6Qi8t3Mw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyslmaJgbmpgANyYq3kDC4AGZNKUq++DfcotjmAemeBBsL4sGpX
	MQIhGF04wHOYP9b73sK8WA+WPrtDgdAUuuAvpXxyH5rImjnRUfPS
X-Google-Smtp-Source: AGHT+IE76nvgMp3ss1EgYURcxr6slKLUutk2wg0KfFLhK9sMF9tqejGLNevkpTYdm/YhLLGA3ILB8w==
X-Received: by 2002:a17:90a:9a83:b0:2e0:7e46:5ecb with SMTP id 98e67ed59e1d1-2e0b8e97ee9mr14496868a91.31.1727707987968;
        Mon, 30 Sep 2024 07:53:07 -0700 (PDT)
Received: from embed-PC.. ([2401:4900:1c26:3294:a303:135d:2d56:fd2e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0b6ca63f9sm7966808a91.33.2024.09.30.07.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 07:53:07 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	simont@opensource.cirrus.com,
	josh@joshuagrisham.com,
	foss@athaariq.my.id,
	rf@opensource.cirrus.com,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek: Add a quirk for HP Pavilion 15z-ec200
Date: Mon, 30 Sep 2024 20:23:00 +0530
Message-Id: <20240930145300.4604-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the quirk for HP Pavilion Gaming laptop 15z-ec200 for
enabling the mute led. The fix apply the ALC285_FIXUP_HP_MUTE_LED
quirk for this model.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=219303

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
Changes in v2:
- Add the quirk entry in PCI SSID sort order.
- Use lower letters for hex numbers.
[v1]: https://lore.kernel.org/all/20240926155112.8079-1-abhishektamboli9@gmail.com/

 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 4ca66234e561..b8e33e4a0baa 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10349,6 +10349,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8896, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8898, "HP EliteBook 845 G8 Notebook PC", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x103c, 0x88d0, "HP Pavilion 15-eh1xxx (mainboard 88D0)", ALC287_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x88dd, "HP Pavilion 15z-ec200", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8902, "HP OMEN 16", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x890e, "HP 255 G8 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8919, "HP Pavilion Aero Laptop 13-be0xxx", ALC287_FIXUP_HP_GPIO_LED),
--
2.34.1

