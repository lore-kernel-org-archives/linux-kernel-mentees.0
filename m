Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D24C04A6A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Aug 2023 14:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42C8A40140;
	Sun, 13 Aug 2023 14:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42C8A40140
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bitAK+HS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lkl2B12EyeDJ; Sun, 13 Aug 2023 14:12:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3A84C400C7;
	Sun, 13 Aug 2023 14:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A84C400C7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1459BC0072;
	Sun, 13 Aug 2023 14:12:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D091C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 14:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E7EB60BE8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 14:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E7EB60BE8
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bitAK+HS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4IUzMHKOAiMw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 14:12:13 +0000 (UTC)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9ED8960B2B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 14:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ED8960B2B
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-686ea67195dso2343721b3a.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 07:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691935933; x=1692540733;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=manx55rXTBvaqxGz9G2eNlyGDJ5fD2gP+HFfKEjL4GU=;
 b=bitAK+HSSOXWRE4iF+rMlqah7ETrsE6uR3wghz9wsQSQ/EOGv9l35XkZuvMf6UGAns
 DB9JFmzhv589h6bWiW4qwEb2Exy3JkhIJQn6apJ6xRYuKMQR1k2RW7ZeV8PChT9WjnNp
 CXcoKdHM6qqlz3c+o4//hhn5sOaDb3n3B7KjFxE0tGje0V20kMDnS77F5f1/86m3/NOc
 rzni6RgzlBHdcHEOTFqibCDdmg5g7yJkbIlJleEPC3brIvlOHsqevknZuQV8iBjY2XTG
 4d56VHip7cwQxxuoUEhYqIBOX34zoIw679bTmI5PsVI9P0Zqrr04Mw/+S4+kuPFOPmuP
 XbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691935933; x=1692540733;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=manx55rXTBvaqxGz9G2eNlyGDJ5fD2gP+HFfKEjL4GU=;
 b=SNRjDrrBg+2g72W/pJgM7CcekTdGEFk3o3N6CgLX38EZ6OmoQr0jwsoJL8pTWwVdBK
 q/2UD2j2dQn49Aylq5Eca3ArRTAYqXB5tcmhDMpyMhrDGPQJORr9ffRHP6kkPzloL0Rb
 fhs7RolkW9dN6nUISiC6zmovfV7GfDuBZZ/hpWu4LJbptp6CAnflbhqM5c72mwPGEiKO
 Jmp/B8RW8aplW1sraoUq+YmuR7OpjiUdFuj8tnZeDDAVnerkBQHw0Z+JxxqYY1TAj7xN
 8L3neoftyJoXXKywZH9Kgj3Byf4TI53Lf/x0uRIkn9W2XcG8kZv0r5QKJi8oMFvVilFw
 9KeQ==
X-Gm-Message-State: AOJu0Yz2K3jzGG9259ytZDTp9mMhO14bn5H4TlW1IiCCqigQJVNTSBve
 81dQaQ7ogu5GGWVo2m22oEY=
X-Google-Smtp-Source: AGHT+IEP9tRi8H6+FA02DYYEt3B73lTRYOFjQ4Vk/kD67vg/+ol7wC/NDcGgH/2MA/Q6VTx1cH1Dgg==
X-Received: by 2002:a05:6a20:1606:b0:13e:6447:ce45 with SMTP id
 l6-20020a056a20160600b0013e6447ce45mr7520681pzj.43.1691935932865; 
 Sun, 13 Aug 2023 07:12:12 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:1022:f538:d00a:1992:423:e24e])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a62b405000000b00687494a59bfsm6269649pfn.61.2023.08.13.07.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Aug 2023 07:12:12 -0700 (PDT)
From: coolrrsh@gmail.com
To: broonie@kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] spi: spi-mpc512x-psc: Fix an unsigned comparison that can
 never be negative 
Date: Sun, 13 Aug 2023 19:42:07 +0530
Message-Id: <20230813141207.150336-1-coolrrsh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

From: Rajeshwar R Shinde <coolrrsh@gmail.com>

In struct mpc512x_psc_spi, the variable 'irq' is declared as an unsigned int.
The comparison of variable 'irq'  with signed int operand is incorrect. Also,
the return value from the call to platform_get_irq(pdev,0) is int and it is 
assigned to an unsigned int variable 'irq', thus redeclaring the type of 
variable 'irq' to signed int.

This fixes warning such as:
drivers/spi/spi-mpc512x-psc.c:493:5-13: 
WARNING: Unsigned expression compared with zero: mps -> irq < 0

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>

---
v1->v2
changed the commit message

---
 drivers/spi/spi-mpc512x-psc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mpc512x-psc.c b/drivers/spi/spi-mpc512x-psc.c
index 99aeef28a..5cecca1be 100644
--- a/drivers/spi/spi-mpc512x-psc.c
+++ b/drivers/spi/spi-mpc512x-psc.c
@@ -53,7 +53,7 @@ struct mpc512x_psc_spi {
 	int type;
 	void __iomem *psc;
 	struct mpc512x_psc_fifo __iomem *fifo;
-	unsigned int irq;
+	int irq;
 	u8 bits_per_word;
 	u32 mclk_rate;
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
