Return-Path: <SRS0=DCdj=KV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_RED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2736BC47088
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 26 May 2021 21:41:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9C94613F0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 26 May 2021 21:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9C94613F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 794664011A;
	Wed, 26 May 2021 21:41:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SLIi0Gi4MFoQ; Wed, 26 May 2021 21:41:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7F7B400C5;
	Wed, 26 May 2021 21:41:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 80B0BC000D;
	Wed, 26 May 2021 21:41:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA427C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 May 2021 21:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A10296074F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 May 2021 21:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4zR-2vVHCkVC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 May 2021 21:41:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F3E660733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 May 2021 21:41:27 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id lg14so4743126ejb.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 May 2021 14:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:cc:to:from:date:subject;
 bh=GTyT/UWK9g7SyIVH5438XPolj+EJOu/gs9KQnFzYp+A=;
 b=TmJtONa7j2IREFR4XyzQbS3OESNtTcEVqXpEdBx+UbzAEUzFH/CarZTC8uYhQJnVdt
 LI+oh5OC5sOMH3u0Fc7z1tSR6Ma1CONDkjj/ydQIZJZmhg9VqUT2Eg60o2PbEs6OhVDK
 GAUGv5m+8phMJ5+qxe15sbCMF5FFbGcsitxtkMKNRQgGkZO2Q/82Og+Vv6HZq0t6sLNi
 0HTLURVJAT6ilhz84rLPL9eZi1c4pFWvS53gA6T7drQ3VZ/ACHmZ/93KS+kTQ8l5zQQj
 lANFgUsVRbu/SawOXrhy/K2nNU6+kDgb7mF0ihKFHPW2w2mxTE1KtEeN6kkcx5fYTJ0X
 0PFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:cc:to:from:date:subject;
 bh=GTyT/UWK9g7SyIVH5438XPolj+EJOu/gs9KQnFzYp+A=;
 b=aSWbkG4e8Vi0BYtp9Hv7yPSibhjWSwXVEHsqqeVylB+dQ1Sm9ZiBx6oqST7Bh7qnjP
 O9WassnRmgQVnhVE46M5KP4v/fTfAFYZgZhmkploIqEIZd910LGlS8cK0rjsATkt6Iyh
 I1rGIMOTLFxAbtZOPhpdElIwI+uc7DjjrFimmIZUuc8S+EFNPHQGdFaN/Je94EoOI6Gq
 sYfKMrhHZutJvCOr4pNjKlOAp6NugnTVL79mliYQeJPJKAaFvCnA1CloISuNnW8dcBQN
 L7cxd5zIAz+qxImwPY69BbNwV1XFWhSuDIPEv39GU+8NDCoJ25sPnNqAsv3NybbSqMSb
 2Scg==
X-Gm-Message-State: AOAM533laRL2BC4sKH2pSJyvFE4FN9fOfuza8qg3+jtRCaCBca22sxpZ
 3pLpn6hdhAu+aGpI9KnaZbD/Af9l1yQ=
X-Google-Smtp-Source: ABdhPJzl1tmkHh+Xv0u8TriGgV1AZeqDw/ek19e1O1If3f2qDidZQPFox3ByOSTYHS4kZx5EKlho8A==
X-Received: by 2002:a17:906:9155:: with SMTP id
 y21mr351620ejw.148.1622065285543; 
 Wed, 26 May 2021 14:41:25 -0700 (PDT)
Received: from localhost ([185.199.80.151])
 by smtp.gmail.com with ESMTPSA id g19sm121763ejw.79.2021.05.26.14.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 14:41:25 -0700 (PDT)
Message-ID: <60aec085.1c69fb81.972cc.0bfb@mx.google.com>
To: gregkh@linuxfoundation.org
From: Kurt Manucredo <fuzzybritches0@gmail.com>
Date: Wed, 26 May 2021 23:40:27 +0200
Subject: [PATCH] bpf: core: fix shift-out-of-bounds in ___bpf_prog_run
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Fix shift-out-of-bounds in ___bpf_prog_run().

UBSAN: shift-out-of-bounds in kernel/bpf/core.c:1414:2
shift exponent 248 is too large for 32-bit type 'unsigned int'
https://syzkaller.appspot.com/bug?id=edb51be4c9a320186328893287bb30d5eed09231

Reported-by: syzbot+bed360704c521841c85d@syzkaller.appspotmail.com
Signed-off-by: Kurt Manucredo <fuzzybritches0@gmail.com>
---
 kernel/bpf/core.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 5e31ee9f7512..35cba247c531 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -1411,11 +1411,38 @@ static u64 ___bpf_prog_run(u64 *regs, const struct bpf_insn *insn)
 	ALU(SUB,  -)
 	ALU(AND,  &)
 	ALU(OR,   |)
-	ALU(LSH, <<)
-	ALU(RSH, >>)
 	ALU(XOR,  ^)
 	ALU(MUL,  *)
 #undef ALU
+#define ALU(OPCODE, OP)		\
+	ALU64_##OPCODE##_X:		\
+		if (SRC >= 64)		\
+			DST = 0;	\
+		else			\
+			DST = DST OP SRC;	\
+		CONT;			\
+	ALU_##OPCODE##_X:		\
+		if (SRC >= 32)		\
+			DST = 0;	\
+		else			\
+			DST = (u32) DST OP (u32) SRC;	\
+		CONT;			\
+	ALU64_##OPCODE##_K:		\
+		if (IMM >= 64)		\
+			DST = 0;	\
+		else			\
+			DST = DST OP IMM;	\
+		CONT;			\
+	ALU_##OPCODE##_K:		\
+		if (IMM >= 32)		\
+			DST = 0;	\
+		else			\
+			DST = (u32) DST OP (u32) IMM;	\
+		CONT;
+
+	ALU(LSH, <<)
+	ALU(RSH, >>)
+#undef ALU
 	ALU_NEG:
 		DST = (u32) -DST;
 		CONT;
-- 
2.30.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
