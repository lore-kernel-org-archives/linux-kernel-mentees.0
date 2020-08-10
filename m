Return-Path: <SRS0=Vbn0=BU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7617C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 05:07:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AA312075D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 05:07:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxHPO6Ru"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AA312075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E92262048E;
	Mon, 10 Aug 2020 05:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ra0nPptFx5V; Mon, 10 Aug 2020 05:07:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1750D2037E;
	Mon, 10 Aug 2020 05:07:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F12F9C013C;
	Mon, 10 Aug 2020 05:07:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DAE26C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 05:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D109787EE8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 05:07:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6r-Q5stWAH0A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 05:07:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AACCB87ECD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 05:07:49 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id x12so5914834qtp.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 09 Aug 2020 22:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aPHXTL52nZ8TnYruo+TUHBbc33RfRH/y9aR6NOzaRVo=;
 b=UxHPO6Ru8IFAHFgMeMWp54jGqzTiCihLYmV0zJhgBUaAyfmPsEx2LJAwXw2fLA0KG5
 D6OBIvkJn0g+qtixsVSWnsCjzrD17UtQ2vDuWxkusNN8VNYdgH97X2zs0vSgRxY+vWw3
 tMSsgwW2UHXCGWh/Puol387O+IctIO//VkkPqRZO3JICdKshwUwWUnmnANxLqsyLekQl
 gsknh7pR3vmTc8F3jfQ9r6mVvmf23C+Y5fCPZpE1CshJsxvNrp7uScL24EwAEc7WWBFI
 yePF2V597Y8LZKSPYmP+DUJIFgT+djJL7a+ax7YwAIu6SUfPHDI05nrBN57WQE4Wgw8h
 KNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aPHXTL52nZ8TnYruo+TUHBbc33RfRH/y9aR6NOzaRVo=;
 b=kz1XnVeUPuzC9/9u3so0EYDv1BiLxxzDiCFQQ0BIaCZCAAlxTCRX/udm2klAh2thEj
 dDbx/NtCadNmR/jl4WX96sIOnrWapZ09CDSlsJg9CVSHEbLehmOm8TGhCmoUZdNehw90
 cuSrZrxoVC0tAnTh/bhDgBoqkOBqZerbnRWAAFumD4960cOyW4WwK4b0Oknv0S9oosMo
 kUmnpwC2ExG6BXzPK4obGExhIlufIR+ey03q1GbRI+s2Vj6SS78WWh9oyga6nwIuJkhd
 Ar8kLGkqpem1s6E/ST/aUVAZvu9Ht1BYPPW506Efygh8xwVBSnuC+DYOXhFCDkK1rZ/o
 NAdQ==
X-Gm-Message-State: AOAM531W1a5pgsom1kTpVgIdM5dUrgN/pWYhIufe/Fh595+yfnNkpnro
 qGObSkHajKz0h+UQ+weslw==
X-Google-Smtp-Source: ABdhPJxeZ9jmhF6jSAkll2vnf9FoWW3KrIT9DdSlTQiwoFC7RC0e4phvSPS3a0ljAS4WeWvC0RiN9A==
X-Received: by 2002:ac8:1382:: with SMTP id h2mr25882364qtj.228.1597036068667; 
 Sun, 09 Aug 2020 22:07:48 -0700 (PDT)
Received: from localhost.localdomain
 (146-115-88-66.s3894.c3-0.sbo-ubr1.sbo.ma.cable.rcncustomer.com.
 [146.115.88.66])
 by smtp.gmail.com with ESMTPSA id w20sm13125325qki.108.2020.08.09.22.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2020 22:07:48 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Mon, 10 Aug 2020 01:05:32 -0400
Message-Id: <20200810050532.640075-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 Hans Verkuil <hans.verkuil@cisco.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] v4l2-tpg: Fix global-out-of-bounds
	read in precalculate_color()
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

precalculate_color() is reading out of `sin` since `tpg->hue` is not being
properly checked. Fix it. `cos` is safe, as long as `tpg->hue` is higher
than or equal to -192.

Fixes: 63881df94d3e ("[media] vivid: add the Test Pattern Generator")
Reported-and-tested-by: syzbot+02d9172bf4c43104cd70@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=db50123c788e2cc5a9d90de569c398b66293ee48
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
index 50f1e0b28b25..52205fe096f7 100644
--- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
+++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
@@ -930,6 +930,9 @@ static void precalculate_color(struct tpg_data *tpg, int k)
 		/* Implement these operations */
 		int tmp_cb, tmp_cr;
 
+		if (tpg->hue < -128 || tpg->hue > 128)
+			return;
+
 		/* First convert to YCbCr */
 
 		color_to_ycbcr(tpg, r, g, b, &y, &cb, &cr);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
