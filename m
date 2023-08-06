Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C4AC001DE
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  6 Aug 2023 08:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7BC8404BF;
	Sun,  6 Aug 2023 08:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7BC8404BF
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Sid+cRv5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eynUGmkz3eA9; Sun,  6 Aug 2023 08:37:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id AB3C240322;
	Sun,  6 Aug 2023 08:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB3C240322
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 874D5C0072;
	Sun,  6 Aug 2023 08:37:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D502C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 08:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA67E4021C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 08:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA67E4021C
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Sid+cRv5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8aByA633ihUr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 08:37:43 +0000 (UTC)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C062400DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 08:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C062400DD
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-68783004143so2422296b3a.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 06 Aug 2023 01:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691311062; x=1691915862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hrXeSpeuC2gzyt9qidPdox3/pGaSYVOC+06MEHE1kmY=;
 b=Sid+cRv5QSaZv2yiPAGIe4aA5sfxdLEKyJut3NxHgecR9aFIIFK0ScTSoNpm6xHJ2J
 jU8wFmClv/+9QVIg8gGimu6fyiJ3CVCuBtZiJkUqymQf+NC741HMSOREmjjHjNnHqz+7
 JTOUg+HqY4AXScDeuaapY6Gmp8naFY2kVnSlHmicjmTRAm8BlnOcgBGm0aBi8Bt6ZzCY
 8nfRAKO1IvAa3PHpqFOBqO/IQi0klSo8Q4JRdu2s8eG3cuPtnewgRAGMnV8DVqRNJY8K
 soCWgtwEe9Bx0yBefOP25VzZQUUUy9dOy/ZbQEaTlGZQv4nIX5bfYwFBlo8l/A9KBqLL
 +WJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691311062; x=1691915862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hrXeSpeuC2gzyt9qidPdox3/pGaSYVOC+06MEHE1kmY=;
 b=R//2Z+7+SX3Pf6dyOZfudqJxt6WlB57ABnJp7dzFnZqoFKCnDCTz821Nz4VSXDLx/w
 8ao5TFUPRlZHlvXAPrX5bswbWSl2jVilDzY9+5AkpCLRCjzqiVA2Z5v6a3QRX14ZffED
 mnkMBj+lAGAGqPhtg+i32yTJ+zNBTQbqLPKXfrjaO6mOLOeEbVUEyzc+mr2Y7ErUY3Xg
 gvdqrVN1mHSTuVx3/cfs0l7ofRjh7Q+Upm07BfdPjHIi0qQBEK0uCF5eJu/H44ZlBWge
 K73UzuNiiZV4ioq9uHkBwGbt+y0dBUUCXz1Lv1wd103YURhKaRTYjF9R+gzBqqNCYJ+N
 kQqg==
X-Gm-Message-State: AOJu0YyIJ4WSk5BBk1QuYPYwuwFCQiRSjN1yHwLpLY7tv7cq5dsgMB4F
 8h2gbOGpKyRNxyiNQLjWvnQ=
X-Google-Smtp-Source: AGHT+IGM4oSRmmUW0Z++Auu5+buRXa+u6jRhZiPyievtJTnhUDlx+820nSRqttFP5I8MNcofc3+ZoQ==
X-Received: by 2002:a17:90b:224e:b0:267:f9c4:c0a8 with SMTP id
 hk14-20020a17090b224e00b00267f9c4c0a8mr5031102pjb.4.1691311062614; 
 Sun, 06 Aug 2023 01:37:42 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:40c2:1028:5dc5:7c0a:52e1:6b87:38ef])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a17090a64c400b0026307fa0442sm6580403pjm.49.2023.08.06.01.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Aug 2023 01:37:42 -0700 (PDT)
From: coolrrsh@gmail.com
To: broonie@kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] spi: spi-mpc52xx-psc: Fix an unsigned comparison that can
 never be negative 
Date: Sun,  6 Aug 2023 14:07:34 +0530
Message-Id: <20230806083734.7685-2-coolrrsh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230806083734.7685-1-coolrrsh@gmail.com>
References: <20230806083734.7685-1-coolrrsh@gmail.com>
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

In struct mpc52xx_psc_spi, the variable 'irq' is declared as an unsigned int.
The comparison of variable 'irq'  with signed int operand is incorrect. Also,
the return value from the call to platform_get_irq(pdev,0) is int and it is 
assigned to an unsigned int variable 'irq', thus redeclaring the type of
variable 'irq' to signed int.

This fixes warning such as:
drivers/spi/spi-mpc52xx-psc.c:332:5-13:
WARNING: Unsigned expression compared with zero: mps -> irq < 0

---
 drivers/spi/spi-mpc52xx-psc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mpc52xx-psc.c b/drivers/spi/spi-mpc52xx-psc.c
index 9a1a080fb..795c08594 100644
--- a/drivers/spi/spi-mpc52xx-psc.c
+++ b/drivers/spi/spi-mpc52xx-psc.c
@@ -29,7 +29,7 @@ struct mpc52xx_psc_spi {
 	/* driver internal data */
 	struct mpc52xx_psc __iomem *psc;
 	struct mpc52xx_psc_fifo __iomem *fifo;
-	unsigned int irq;
+	int irq;
 	u8 bits_per_word;
 
 	struct completion done;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
