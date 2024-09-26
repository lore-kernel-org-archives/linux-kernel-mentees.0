Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D6B13777E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Sep 2024 15:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727365884; cv=none; b=P1IsK+EloI4OxZUvBoI4iaZ+j7XI5JHEoL5h7t6SKWNWTxGS6VBeJ7OP7KSUFrx1TayahgqKFms4Az8Lr9llBUm5USKHT48LL1XHc4ALZNq8/ygW7LTM9uVkVcH4jEpWCAX/xmwybX1TRmjSEtyg2EPfIU2sVSbk1eqdHCgh5d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727365884; c=relaxed/simple;
	bh=6Mu+YMPvlbBaORVQ0gZ41JhwRZDq6iMkN6MOQwDkgT4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KzMs/nfiIAtaD3n5jm6HccwSFwZRw2OYDJjr7w17MdTgfSN6sR+xxQmqBx7TXC4s1igFiUD9f3wexIZ8inDit5o1IfU/StRuW+dGGbd2vCqHFgWHHDyH7UilZwbbPhRta5MNzZzZ8ZPrUw+ToqAl8sSlDWbp5qz+6+kGjZH6tas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+DVe2ET; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+DVe2ET"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8585D606B9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Sep 2024 15:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DtzlNmnjfLkT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Sep 2024 15:51:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BD394606B6
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD394606B6
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F+DVe2ET
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BD394606B6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Sep 2024 15:51:21 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-718816be6cbso1017489b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Sep 2024 08:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727365881; x=1727970681; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=549jvhNUSwmwk8eXbBGBDthSFtsG88x9HMrxQ9/pgi0=;
        b=F+DVe2ETPKhUIs53a1uzJDQi6ovdCO4JvMuilYPJj5EjztV+voLJxmCVns5qtAbUeV
         WronYG0YjGPUt1Gib3DhOc4ykXqHexBTq+MDMd+nh4yaEZDVJoqrHrbSQEYRqUySemle
         3+fvjtq+RxTXUOSNQTD2FgwforxsWlMmpVHGQUFvTcfS5XERTDPynHU/mcF5ac5oknnB
         nz+y+gKVT9TbBQxD7y9CmbcGN3iyr5gwjA9hGiYv1mezaU4GwABb7ovSEkWSSLvB4bSc
         ER8WilvT2j9kchRQjh62GoGMv1r2OsGirE3yRw+XL7/PmoN/4GsbZj9JXuLhptoA+TlG
         RSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727365881; x=1727970681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=549jvhNUSwmwk8eXbBGBDthSFtsG88x9HMrxQ9/pgi0=;
        b=OBQ+hw/oiqAYDIZ/H1QX4W5FPtjk3gmIzJ9dnKTjvXvZsSAkvRT/7BwZ+5Sr6aNvKB
         2gmVK9o5PCaYdUiOxHxvJNfY18OsNb4pdGVzdkGP86arjJPopiZXhnmgnel6XlRsjD+R
         9eOIjzZQ5WRl9ttrPVQxeeLbgDk/lZl/23FzjrYyhYtXzLUHEiP2PlfccV3im575vLv0
         8q93/q3HmI4wFtEdmrS/G+g3OD63YXcxcPWs/TbmmBH4HoM6fITHRBTN+O6zAZCg9qPb
         G4EpZEncUjnadzjDvoT20ewWMlLJngo9+QygJrdX93DAuhHNzO7RWlfIiGyXFwnP23GK
         TDzw==
X-Forwarded-Encrypted: i=1; AJvYcCUiWrr9nBY0u85jT0ZckUYqb39IbEZ1J38khg1u6qBzUP7YOPGMB5jft97n/Ap+q99FtYGlYCEL7J36oGYJ7YG8a/FU6w==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy8PSggrRnL25MnV2LJymimG7Snvf197i62tgrfhdHncp7+9EBL
	tWhIweiouGRFAMvwCycuN1yVUEmj58sj6ZBCpWyPeoIhlplDIjhR
X-Google-Smtp-Source: AGHT+IFQFvdF/l8IwPlfBuA1Jc6fzNmrDCqYkEtP4KOoCVi+D3ALqMOzJ4eFY/jsBtanCC4Lpipwtg==
X-Received: by 2002:a05:6a00:2383:b0:714:1e28:da95 with SMTP id d2e1a72fcca58-71b25f45aabmr335398b3a.7.1727365880634;
        Thu, 26 Sep 2024 08:51:20 -0700 (PDT)
Received: from embed-PC.. ([2401:4900:1cb4:e707:a7e0:2397:b605:4104])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db5eb40bsm51249a12.69.2024.09.26.08.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 08:51:20 -0700 (PDT)
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
Subject: [PATCH] ALSA: hda/realtek: Add a quirk for HP Pavilion 15z-ec200
Date: Thu, 26 Sep 2024 21:21:12 +0530
Message-Id: <20240926155112.8079-1-abhishektamboli9@gmail.com>
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
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 4ca66234e561..94125a977f08 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10315,6 +10315,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8786, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8787, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8788, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x88DD, "HP Pavilion 15z-ec200", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87d3, "HP Laptop 15-gw0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
-- 
2.34.1

