Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC97C41513
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Aug 2023 18:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DB4040126;
	Wed,  9 Aug 2023 18:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DB4040126
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CKnfz7Hz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 58_UXnDKXK3l; Wed,  9 Aug 2023 18:55:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B31A24016F;
	Wed,  9 Aug 2023 18:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B31A24016F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84057C0071;
	Wed,  9 Aug 2023 18:55:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47223C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Aug 2023 18:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14C39835F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Aug 2023 18:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14C39835F2
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=CKnfz7Hz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TJPTDZIk15mA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Aug 2023 18:55:20 +0000 (UTC)
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE242821C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Aug 2023 18:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE242821C3
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3a74d759bfcso89735b6e.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Aug 2023 11:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691607320; x=1692212120;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ml4dfY3mLq3SCYyf0vfwwEcWzqsDXJO/lar+p7qztwU=;
 b=CKnfz7HzOaVI1c8Xxr/EcY6QKMHJqQ7cpVvPcskHfjmo+1EB//ZE6mSGoOgQzRL0dm
 Qv3t33bzM31KbPHqwnZdkvyMtbGA7wUTrtHLiU7mkItOoAnl5Y/DaEmES9Wdy6CYGmHO
 GbdAtlOU69nBqzLiIHS08lp6pndIZCacZz+27Tpyn94Yon5/nTvm0M48Apo31BYEFDAw
 58wDsx2Ev1OQLkhzyElbGU/FAo9XNJz+F0vZrkIzNRDw50pLLbetVSmTTuPhcQ0g9SWu
 aV8dUrZj3SNr9ICs03jULfBLMdCfxBVuE4hrEE2XWTscQ55RS4cN3FOmfJieEW/8nrdR
 A8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691607320; x=1692212120;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ml4dfY3mLq3SCYyf0vfwwEcWzqsDXJO/lar+p7qztwU=;
 b=OoDrH9v4y9ubkjo1gcyFBA71jOoJnTN6lcr6RYyoA71ZV6horl3BCIVs/Eimse4sQT
 u6/YfCSV6l4XwUaLa0TnhesSeGboOf3ekaEeTGn1qc/qcEllIbZxWx42vPoa8o87fM1b
 ZLRwldLGUcq5A+NQLYNmvgTMBRdSOU/ZIso83k1l8ofLcwCxdk2BWyRf0HeuX9G1Tcqt
 QFWWh9PxIwsQWRJbl/D/DNo+Q+cadZZfCWp3aX04NZHJ6MIeCO85QXh8eU9DTgv0d4vS
 jj4IMlmzD44uyvoeZlgKU9nMEuYCol9BrKIVOzlGgx52AFJnZdkCe2Y6dMn2gEbKpg/3
 MQJw==
X-Gm-Message-State: AOJu0YxJ/tkzCRDiKYcFs0xGdQwPXHXL9fapeLTzinoGowhiwIgEDDZc
 jcNgi2qkvt4wavED5JGLfkM=
X-Google-Smtp-Source: AGHT+IF8Ar8M60cViD0YQmRBWw1G/nSZaXjCG87bLvLVP19868/xpzbfg4O/RM+YT54RsIDqP900mg==
X-Received: by 2002:a05:6808:1385:b0:3a7:a2f4:9873 with SMTP id
 c5-20020a056808138500b003a7a2f49873mr249905oiw.35.1691607319532; 
 Wed, 09 Aug 2023 11:55:19 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net
 ([2601:204:df00:9cd0:d26e:9bde:5e8b:6cb6])
 by smtp.gmail.com with ESMTPSA id
 on14-20020a17090b1d0e00b002677739860fsm1800919pjb.34.2023.08.09.11.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 11:55:19 -0700 (PDT)
From: Atul Raut <rauji.raut@gmail.com>
To: bcain@quicinc.com
Subject: hexagon: fix warning comparing pointer to 0
Date: Wed,  9 Aug 2023 11:51:48 -0700
Message-Id: <20230809185147.98262-1-rauji.raut@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-hexagon@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Fix the following coccicheck warning:
./arch/hexagon/kernel/traps.c:138:6-7: WARNING comparing pointer to 0

Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
 arch/hexagon/kernel/traps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/hexagon/kernel/traps.c b/arch/hexagon/kernel/traps.c
index 6447763ce5a9..78486eea77d7 100644
--- a/arch/hexagon/kernel/traps.c
+++ b/arch/hexagon/kernel/traps.c
@@ -80,7 +80,7 @@ static void do_show_stack(struct task_struct *task, unsigned long *fp,
 	int kstack_depth_to_print = 24;
 	unsigned long offset, size;
 	const char *name = NULL;
-	unsigned long *newfp;
+	unsigned long *newfp = NULL;
 	unsigned long low, high;
 	char tmpstr[128];
 	char *modname;
@@ -135,7 +135,7 @@ static void do_show_stack(struct task_struct *task, unsigned long *fp,
 		}
 
 		/* Attempt to continue past exception. */
-		if (0 == newfp) {
+		if (!newfp) {
 			struct pt_regs *regs = (struct pt_regs *) (((void *)fp)
 						+ 8);
 
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
