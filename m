Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FF1C77B7C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 May 2023 14:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D083F417DE;
	Fri,  5 May 2023 14:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D083F417DE
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bpKZtv/a
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YYt8_r2IRrgV; Fri,  5 May 2023 14:05:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8F2E741776;
	Fri,  5 May 2023 14:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F2E741776
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73B5AC0037;
	Fri,  5 May 2023 14:05:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69DE6C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 May 2023 14:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 428CD41794
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 May 2023 14:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 428CD41794
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T4ZwBKquaelX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 May 2023 14:05:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4849F41776
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4849F41776
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 May 2023 14:05:22 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1aae46e62e9so12905075ad.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 May 2023 07:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683295521; x=1685887521;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OzqCiS98IPcP1NO5D+IvEvMY4nJyl5P4wSObXpEuRpY=;
 b=bpKZtv/aAeervyGxt6hJ5jf921aCdGeuIvYwOlAd5vCAslhLMj/MEyeq4nHFL+hwf9
 ED3nywlxa2GqmtJzVdCCYkYFfTQbyYjyxi/X9ZTfV1I4Mo+9EfMKpZLpOs7mHh8zzymm
 Q2Ice9GsQhX4EXznSnL/NXKYywcPAn3hdgyRRyZO+VqbL4EZlAfjb7h0ssg/btxrvc2A
 Mnv54OYE3rQvoO7aMyIpUPQYpcXADGL5DM4hprWSse9L/pne+jutyCr0VaSw2wbf6k0B
 Ru+lG+TUTLDw7dQGZq+Mb6/IqYfmAnxjGLZzrBOlGedyIYwT/gJML71z2a0BzOWmTAB2
 ytdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683295521; x=1685887521;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OzqCiS98IPcP1NO5D+IvEvMY4nJyl5P4wSObXpEuRpY=;
 b=OrE9YIBhkMS0PdvrBvtqxT43RPOPSxNXPu8I2FLAtpcgQ3HUo5F9y9fs5kEAYD3ZEV
 jrrvmBu9QJXTr1HocJ23ZSqCAO+obum0cjVuwNmdt0uQhwyMNr6vSAF2g5vCt4sMnlW8
 NPRIddytq8lU7ekan4IaVuJztb+zAhmjlbwzaZJlwntIKw9hlrJgL7RJxuYALgsazKz6
 e8W50x5P1da61tLVtaj3+WUueNCVw/+aT08FOicYGxpII4tkCRA95r7uLiJGPoI2t0IR
 iGvqYG6r2jbyAy0qkAaElXBI9lOtd1ON01AYmAhNjjFRQ4s1CX11HrI7Mffd3oQBY1gA
 a47w==
X-Gm-Message-State: AC+VfDzj/EFdtKsiZX7vZPUivKy/gjgIuRV/oInoIdpru2nd8AAomIVP
 Cxj9O6tICQqZlkgypEQ4HDk=
X-Google-Smtp-Source: ACHHUZ7gbOnhc9STpFgcE/bQM1D6CfRmVBGNlFt05nMCk6igeMsP4gD6F5LqP/inTAFAJLNeLb2hpw==
X-Received: by 2002:a17:902:f391:b0:1a1:dd2a:fe6c with SMTP id
 f17-20020a170902f39100b001a1dd2afe6cmr1275756ple.53.1683295521501; 
 Fri, 05 May 2023 07:05:21 -0700 (PDT)
Received: from ubuntu22-virtual-machine.localdomain ([211.218.36.103])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a170902740500b001ab09f5ca61sm1822217pll.55.2023.05.05.07.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 07:05:21 -0700 (PDT)
Date: Fri, 5 May 2023 23:05:16 +0900
From: Wonguk Lee <wonguk.lee1023@gmail.com>
To: shaggy@kernel.org
Subject: [PATCH v2] fs: jfs: (trivial) Fix typo in dbInitTree function
Message-ID: <ZFUNHFUr/IhyvTn9@ubuntu22-virtual-machine.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
Cc: jfs-discussion@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

While trying to fix the jfs UBSAN problem reported in syzkaller,
(https://syzkaller.appspot.com/bug?id=01abadbd6ae6a08b1f1987aa61554c6b3ac19ff2)

I found the typo in the comment of dbInitTree function and fix it.

Signed-off-by: Wonguk Lee <wonguk.lee1023@gmail.com>
---
Changes in v2:
  - Add the patch description and change the name in the Signed-off-by

 fs/jfs/jfs_dmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index a3eb1e826947..d8a03d3026cc 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -3851,7 +3851,7 @@ static int dbInitTree(struct dmaptree * dtp)
 	l2max = le32_to_cpu(dtp->l2nleafs) + dtp->budmin;
 
 	/*
-	 * configure the leaf levevl into binary buddy system
+	 * configure the leaf level into binary buddy system
 	 *
 	 * Try to combine buddies starting with a buddy size of 1
 	 * (i.e. two leaves). At a buddy size of 1 two buddy leaves
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
