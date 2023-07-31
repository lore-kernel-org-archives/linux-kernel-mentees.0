Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB2FC001DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Jul 2023 02:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D50C61026;
	Mon, 31 Jul 2023 02:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D50C61026
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hdJPCLFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VlPu_mX0lvKZ; Mon, 31 Jul 2023 02:26:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 034BC60B79;
	Mon, 31 Jul 2023 02:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 034BC60B79
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2ADAC0071;
	Mon, 31 Jul 2023 02:26:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6DDA5C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 02:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34CB0400E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 02:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34CB0400E7
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=hdJPCLFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5H2x3I8SVHB2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 02:26:12 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F4F9400D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 02:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F4F9400D0
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1bba04b9df3so32201825ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 19:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690770372; x=1691375172;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+5+YDtWOqzo4ntCd+ygrleNLdsHAxAxplxj1dQXMQFU=;
 b=hdJPCLFD6ReyKmnF/ug9HWb5kg1E28UUAXXmv8egdv9xxQkThiVfhuSHBKmF7GcLJD
 lhpwd2oUOws2qM2/rEbDiRyFv1IucwhwfzTIt4/O/SKIWXY9mQYhw99Q0h2PsOnEAWU4
 hFZTS8t2EorHlPm3R+hQ1pPRGYQdl1+11bA0mTG0HyVq7mUAgFCyvyjQncueSRbQyduw
 hwC5rj21ZjjZKYNu/aSYwhMGHzxNos8+BBmczhTwhqCcoXxelfG9vkziu5n4rag4hO0R
 ndzen1kWIQCX3T7uJid61z356RElByaco+/nuR/bD61S6nE/+6GWbazNeTOZvYYIO0Ok
 tcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690770372; x=1691375172;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+5+YDtWOqzo4ntCd+ygrleNLdsHAxAxplxj1dQXMQFU=;
 b=NcQfEOYh9/IMvMT3vurHr2XXW8Y5pBh6ADD0eMjbg5lkRRvBJmf/vTHlQvumPySS1A
 5gk+XR65n26+Fn4Y7Lyg0gd10D/z/kwgS2Q9uowvEjw45LSYHjUDB38GQOZmrjRDeEp9
 lE7a4TDw/AuGswirChcoh4DjdeTg6Vh/ZIZ2dCSte0omGnYnOenaW2/aZ0w+mpNI5tvJ
 2gjr0TFzw2lzJSODSqWMFJjbVvwHtEVt3LPh7zGqVag8sakbMPDgSdUyZFp1zXvF6sfL
 ATUfx4foyq6fDd/opc/taU43g9BvChvdV3JE8nwCvVvS9Hjpy9w5hAwoaC54YGu0VnAL
 FQKA==
X-Gm-Message-State: ABy/qLbE2nsHC6RG+J2oQvfqpPudTVuRZv2DPGNrMatexCdZVNPTS7+f
 8S5oq7GGimRRmMQNHZjCT4c=
X-Google-Smtp-Source: APBJJlF+vu+opgQ1dCnvS8yu4mP20sj7AQijKvtoK4+KiXtKJ9FGp/UBhR3wdrI/NYwby8rzAkp0Og==
X-Received: by 2002:a17:902:ea0d:b0:1b8:6cac:ffe8 with SMTP id
 s13-20020a170902ea0d00b001b86cacffe8mr9713516plg.51.1690770371714; 
 Sun, 30 Jul 2023 19:26:11 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net
 ([2601:204:df00:9cd0:f50b:8f24:acc4:e5c])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a170902740600b001b03842ab78sm7233993pll.89.2023.07.30.19.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jul 2023 19:26:11 -0700 (PDT)
From: Atul Raut <rauji.raut@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ipc:msg: Replace zero-length arrays with DECLARE_FLEX_ARRAY()
 helper
Date: Sun, 30 Jul 2023 19:25:57 -0700
Message-Id: <20230731022557.25598-1-rauji.raut@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Replacing zero-length arrays with C99 flexible-array members
because they are deprecated.
Use the new DECLARE_FLEX_ARRAY() auxiliary macro instead of defining
a zero-length array.

This fixes warnings such as:
./ipc/msg.c:981:6-11: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
 ipc/msg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ipc/msg.c b/ipc/msg.c
index fd08b3cb36d7..300c126faf2d 100644
--- a/ipc/msg.c
+++ b/ipc/msg.c
@@ -978,7 +978,7 @@ SYSCALL_DEFINE4(msgsnd, int, msqid, struct msgbuf __user *, msgp, size_t, msgsz,
 
 struct compat_msgbuf {
 	compat_long_t mtype;
-	char mtext[1];
+	DECLARE_FLEX_ARRAY(char, mtext);
 };
 
 long compat_ksys_msgsnd(int msqid, compat_uptr_t msgp,
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
