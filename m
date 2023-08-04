Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2AFC001DE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Aug 2023 04:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63FA483F00;
	Fri,  4 Aug 2023 04:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63FA483F00
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bL66U/DO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MDcDXvtT-ygT; Fri,  4 Aug 2023 04:20:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id ED40083C76;
	Fri,  4 Aug 2023 04:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED40083C76
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BFA49C0071;
	Fri,  4 Aug 2023 04:20:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F818C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 04:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52BC860B97
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 04:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52BC860B97
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bL66U/DO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TihpQQ8Qb3Yr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 04:20:33 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCE9F60AE2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 04:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCE9F60AE2
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1bc3d94d40fso14186875ad.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 03 Aug 2023 21:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691122832; x=1691727632;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ad/FcpxuBxv4GmuGDEXaoeeXnYfsgrYDuuE2WEQNHRE=;
 b=bL66U/DOtQaMlkD6sBFqEgc+4rwJfGyOoZFfRpyIs7K6E/mitQbRMaUqRJEr2Ef5Op
 ML/bR6hvKP4gm14zEtE1WrWNRhxsBKAxGjfA8IKBOZumhPgbUbRLlNVv/aYNXU2fuJ8q
 QBLtL3zNtrjweO9gj3uC/wpUxzNyco3gUX2QId/ys1lerkeQeGxiq2jc1EZITpJvCLvb
 BUfy7idpXGubaBwOmGrnEu79oKBdPeEVIGLlctu8tOwBcXcryT6u1QV2LOfc53uT5FMn
 nsswK8kgGSdQhDaaYbVH27m5NCl9rARgp0NMVUKsT62Zknj8QSybJYdEDKIWTTW3LZkB
 yixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691122832; x=1691727632;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ad/FcpxuBxv4GmuGDEXaoeeXnYfsgrYDuuE2WEQNHRE=;
 b=aaWpqsMPYpVAPecGgzZBwlB+6Y1QJdE7c3qJ+ji8M/mABFD3KO3HHTkltbU1Q2qnWi
 pd1moLbEv7d8tU7LNZNT3yHXk5kTVvm6cokGjvO5q895xYXAbMit3J4TeONLJwmCRa91
 SZWDh5LrRqeW7QeRq6Nt1WQdHzH8GVJHFY4m/UDewqTpVBUlyYW64/lNguAXO9MNpJq3
 gXOsUePfZSRt20shLS1BbzpOih054YnBtm7pQfAulUwp7zR/G4rDECnaAB68orm4bQLD
 X3RNwCg2RGtw3Nnv8LTNWU3FfSIUmZ8Qp38QpUBp+EBh/XSuust6onfpKkSiv1jGeI5n
 mX0w==
X-Gm-Message-State: AOJu0YxB5YI6wTulVLkGUuRT0woDuohHPOx4agyE0ZrtNxKTiEQ0KwHt
 fz1lMPzvAaw5Wxctq+K5s4k=
X-Google-Smtp-Source: AGHT+IFKYdeKLX/DB9LH66FpCPX82AzIXspBG7VI2BVAVdUvDRKyvsUkbmKiOOpQfAWyYH4sGXycsw==
X-Received: by 2002:a17:902:d34c:b0:1b6:c229:c350 with SMTP id
 l12-20020a170902d34c00b001b6c229c350mr698292plk.18.1691122832084; 
 Thu, 03 Aug 2023 21:20:32 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net
 ([2601:204:df00:9cd0:9428:7df2:aef6:7a3e])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001b866472e8dsm636235plg.241.2023.08.03.21.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 21:20:31 -0700 (PDT)
From: Atul Raut <rauji.raut@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] ipc:msg: replace one-element array with flexible-array
 member
Date: Thu,  3 Aug 2023 21:19:49 -0700
Message-Id: <20230804041949.5724-1-rauji.raut@gmail.com>
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

One-element arrays are obsolete, and flexible
array members have taken their place. So, in
struct compat_msgbuf, replace the one-element
array with a flexible-array member.

This fixes warnings such as:
./ipc/msg.c:981:6-11: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
 ipc/msg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ipc/msg.c b/ipc/msg.c
index fd08b3cb36d7..ee6af4fe52bf 100644
--- a/ipc/msg.c
+++ b/ipc/msg.c
@@ -978,7 +978,7 @@ SYSCALL_DEFINE4(msgsnd, int, msqid, struct msgbuf __user *, msgp, size_t, msgsz,
 
 struct compat_msgbuf {
 	compat_long_t mtype;
-	char mtext[1];
+	char mtext[];
 };
 
 long compat_ksys_msgsnd(int msqid, compat_uptr_t msgp,
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
