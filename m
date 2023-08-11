Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76B1C0015E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Aug 2023 06:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5499A41D94;
	Fri, 11 Aug 2023 06:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5499A41D94
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=H5U8a3+c
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i4FWW3XKGfc0; Fri, 11 Aug 2023 06:32:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0350441D92;
	Fri, 11 Aug 2023 06:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0350441D92
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDAF5C0071;
	Fri, 11 Aug 2023 06:32:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC701C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Aug 2023 06:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE2AF82EA4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Aug 2023 06:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE2AF82EA4
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=H5U8a3+c
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p_sLv4MAsGqW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Aug 2023 06:31:57 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8008582DD9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Aug 2023 06:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8008582DD9
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1bbf0f36ce4so12402175ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 23:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691735517; x=1692340317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LQ1M3C8oCeNHlAIM7S9dLfoMmUG2TNrYAIGvX32nZuI=;
 b=H5U8a3+cNKb3odFyPRMiD69LR83CpnTQuL2EE0SUyGd6z8cw9k9TLsGIdB0Fj/rtbI
 b2d1u+H2TVao9P2TDRsTLtZrvRlYq/QP+uVkJCFNeaWZut6Ac/NXxiMo6Yu170zs9NDh
 3Hzqqoy7cA01j3OCEXRIiaP13hczlbWD1iHKlbVpebB0tdgMBW1YfNkJZZQdTzZoTMhK
 rWCG1SMZzvXjHhUklsO5sQSV1QlimIMLQcg9wbokCwpwjI2krIfIYKiwc57pdwKRJ0Kw
 vFPtOpEZdnc7NfSqVskXYGDG3xjw8M6t9LK/Eke84vbsHI00Fldcf2T0jKDXytTK5alZ
 ro8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691735517; x=1692340317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LQ1M3C8oCeNHlAIM7S9dLfoMmUG2TNrYAIGvX32nZuI=;
 b=gJVcsSDpu+BP/foscWIJp206mZE8pAMM6oGQkcV1mgqbgpdcQtao4W8X8issio+e7N
 MLNuYgscdh6wnVSvpUAtFose2WmGmWevMHXihu0IJ+7+yFZcct6iU7kqWFnPeCWte4Zq
 fN/eS5gm9Yyfd/Wewnv3h9JZNgTt/C49yUZ7GrMqD76V341Q9LqJdmRqpbFJBODRiaMf
 HSoyoki7ZyNGa53Ed5z2Od+HzooauDU1OSAOVUm0GFNPYVIra5RlAmMHiaG+YXLwVc6k
 Ztrle6uMje5B9on3U1Onu+R3+Un20C+4YOuKRRX2DnTBrSC9tqP286CEW1pUfZ8Wb4zJ
 8epQ==
X-Gm-Message-State: AOJu0Yynondc3pHwQICIXipNMp4rYlT/LTYWQEsYoSUzc2XOQge3sYyT
 Eefq7O69bGVPodFAg+1rHcU=
X-Google-Smtp-Source: AGHT+IHUA6rWDRY9pKGc706ugGSJVg1oSxlipohGOlhGHLZrkVDH3xKp7OVEKc6nm6fxdrAK0hXj0g==
X-Received: by 2002:a17:902:e549:b0:1bb:8725:f537 with SMTP id
 n9-20020a170902e54900b001bb8725f537mr811040plf.66.1691735516811; 
 Thu, 10 Aug 2023 23:31:56 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net
 ([2601:204:df00:9cd0:1eb3:d724:a7eb:7d6c])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a170902ee0300b001b9fef7f454sm2943580plb.73.2023.08.10.23.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 23:31:56 -0700 (PDT)
From: Atul Raut <rauji.raut@gmail.com>
To: bskeggs@redhat.com,
	kherbst@redhat.com,
	lyude@redhat.com
Subject: drm/nouveau: switch over to vmemdup_user()
Date: Thu, 10 Aug 2023 23:31:11 -0700
Message-Id: <20230811063110.152221-1-rauji.raut@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: nouveau@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org
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

Use vmemdup_user() rather than duplicating its implementation.

This patch fixes the following Coccinelle warning:
./drivers/gpu/drm/nouveau/nouveau_gem.c:630:7-15: WARNING opportunity for vmemdup_user

Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index ab9062e50977..a244b39df213 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -627,15 +627,10 @@ u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
 
 	size *= nmemb;
 
-	mem = kvmalloc(size, GFP_KERNEL);
-	if (!mem)
+	mem = vmemdup_user(userptr, size);
+	if (IS_ERR(mem))
 		return ERR_PTR(-ENOMEM);
 
-	if (copy_from_user(mem, userptr, size)) {
-		u_free(mem);
-		return ERR_PTR(-EFAULT);
-	}
-
 	return mem;
 }
 
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
