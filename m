Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2B4C77B73
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 May 2023 01:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4EA9840C6;
	Fri,  5 May 2023 01:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4EA9840C6
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=TLSSFHC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mCai0Uf242wa; Fri,  5 May 2023 01:20:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7AE76840A3;
	Fri,  5 May 2023 01:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AE76840A3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4EDA5C0037;
	Fri,  5 May 2023 01:20:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2607C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 May 2023 01:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B63D6840C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 May 2023 01:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B63D6840C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SFpCV0Rjtvvw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 May 2023 01:20:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61E45840A3
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61E45840A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 May 2023 01:20:46 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1ab1b79d3a7so8063735ad.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 04 May 2023 18:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683249646; x=1685841646;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n0soDqfw6362dujeUcWQ5P8Z55oslCidLxBQzR0OR5g=;
 b=TLSSFHC4/+nutVQAyNGbslhe+OJicKevchFGzKKnPrPaEfAyWKbRoCWUQpa5EQ66ne
 bqNZSrNW2gAehb2mQ2S7SPgZlmUHfFWi/2BJJ/FpooJkI5W0P9B7ie1Jmb5EiR1adFP9
 fmBJ2wX8WqQbEcjpvHUC9vHWhUxq5rTS71ElPpG0MDX1UPbbvA12TIzhQJ22nCHXCfiM
 yd+HiOoZmBJlrQrU7u5YY6LcOuOuvXBONvCvnrNM75nyEmdZH/tNrH6sw784WL+7RGl6
 +DOlWwqnD6CH9YI7z21986z3IEgzAtaAeZUBJK+Gzmdib4kx69yX/IlXYDuJEZHyKQAq
 q6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683249646; x=1685841646;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n0soDqfw6362dujeUcWQ5P8Z55oslCidLxBQzR0OR5g=;
 b=lY1STwEHP/n5MficcONZR8KgSH16i0Ja/BnWdzEdA5I1+L61Dl7cdTRqiBZyHW+d6/
 v6keuRzbEMEUJ5vswZJAiO+1BVwdsV0TnQsjosQ++ZdGUBebeR7KUyOAJuGjMyQ9HQT8
 Izz9KdKeC1EdvGY3Y+WyBO+pxKwY1f97kRoOwPKFgOg2g3X5LAbFiJXB21PHpngXO3xr
 y1HrDwQFO6y06RPwfQtpV7gfI59h63tp86Tez+28iZEicy8ZkIbz2UkdP2C/qxTffkjF
 0H3zhi+RK6hKEZ6qq6v5sZFazYz6JIINC8/mo6XstHd0PFs5mxPjTstbDmPcldkLR7mv
 tzxQ==
X-Gm-Message-State: AC+VfDwxYlpNRwOjq3D45NgBsCrDvz0x2vHaYgLeWFoLI4BFYmImgBcy
 KsXnY7Q65LF40fMlAUIcBoY=
X-Google-Smtp-Source: ACHHUZ54hVNW8sc377s1AqcIhpKRNyKHeEd7ZYAA/6ulwj5hPj250Z/L+wAXPAyP+D0TL6KYMpGZwA==
X-Received: by 2002:a17:902:8c90:b0:1a9:3fab:3ebe with SMTP id
 t16-20020a1709028c9000b001a93fab3ebemr4578727plo.10.1683249645579; 
 Thu, 04 May 2023 18:20:45 -0700 (PDT)
Received: from ubuntu22-virtual-machine.localdomain ([211.218.36.103])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a170902d4c400b00199193e5ea1sm241636plg.61.2023.05.04.18.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:20:45 -0700 (PDT)
Date: Fri, 5 May 2023 10:20:41 +0900
From: "wonguk.lee" <wonguk.lee1023@gmail.com>
To: shaggy@kernel.org
Subject: [PATCH] fs: jfs: (trivial) Fix typo in dbInitTree function
Message-ID: <ZFRZ6UwxnrxLf6ZX@ubuntu22-virtual-machine.localdomain>
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

Signed-off-by: wonguk.lee <wonguk.lee1023@gmail.com>
---
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
