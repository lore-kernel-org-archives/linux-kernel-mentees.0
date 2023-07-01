Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C238C001B0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Jul 2023 14:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8437240A75;
	Sat,  1 Jul 2023 14:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8437240A75
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Ks+QnT+f
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4YoZYu22qDrt; Sat,  1 Jul 2023 14:06:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6F3F040003;
	Sat,  1 Jul 2023 14:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F3F040003
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 422B2C0071;
	Sat,  1 Jul 2023 14:06:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45CF7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Jul 2023 14:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C31F4168D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Jul 2023 14:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C31F4168D
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Ks+QnT+f
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mnXJVEESc4DW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Jul 2023 14:06:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9335441606
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9335441606
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Jul 2023 14:06:14 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fb9ae4cef6so4677618e87.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 Jul 2023 07:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688220372; x=1690812372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r/GvNDtCln3mttOJGf/TOdwCpXEhlkTWnrJx4RvWdwM=;
 b=Ks+QnT+fLgC0REedKsq6ZYblXr0OPOIYcR3pxSB4RldP8BK+6Ao6RFi62cO4CzInVQ
 cF/wFA4tt56MB5ejw27Tcg5x4Em+0EPBcZnDPGRmOg4apbbLXi/SkJh07g3dPNTNntxD
 yOKhawX9C+aNnFdy9BZDAGfOUQYIyD977YCVbJyTMKJSN7Wb3R09OqeSICnsqt3nchhG
 IAi+sH/2Krg04SpnuF8Hc07yXhol7tRdinOv8BtxHfZBaBEODDY/yxCU8s6TWTM42t4r
 /T8vXz0THeG/90v7SEynhu9a8J9BfObVMP0CTm3N8rDFGFI519AGaZEeFyvCR7rYyAyh
 0VsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688220372; x=1690812372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r/GvNDtCln3mttOJGf/TOdwCpXEhlkTWnrJx4RvWdwM=;
 b=emVZBnIw48WBPik656nDWBwD1sbli8AVeHn8omZd0n6kZx/mDB2iUVtoxyhNxa3f0T
 /N0xvix5HgC5mN9yIwOfWhzrafOWFNOHDMERFv/D9hLqLIA9neFc2af4UAYHofgwDoJj
 AiSwWql2XcnUgreBg8tdEayxLnbhvKYZdw/74jjL27O5Ppu5Ad3G+l5HpUiqZj9Pr//C
 93eB6WPQioPQVxTKIHD2LRUe5DuTq9vj7LO8KJGPlrwE1X8wZ9cBO5mJuh29OKBsLCGG
 vNSKwESu10DmPXjq3BVZf5/BLbdTxbYji1mzpfbACEKpIzaykPv3fenEdFSq1Be5PYXM
 18yg==
X-Gm-Message-State: ABy/qLb3sAan0Dg6qyqqAgDazb99S1KMenLWRQhB7O4PV1wZOvZQsICI
 8V20GpM9D5ig+3hhv2CRkuQ=
X-Google-Smtp-Source: APBJJlFR96QDw3TIO2gO0LlFDT9R6vIjC9Z0ojQV9hS+B6DNsisw0F85A1+B+HGvx1G6ukQSMJileA==
X-Received: by 2002:a05:6512:34c9:b0:4fb:820a:f87f with SMTP id
 w9-20020a05651234c900b004fb820af87fmr3870098lfr.10.1688220372178; 
 Sat, 01 Jul 2023 07:06:12 -0700 (PDT)
Received: from localhost.localdomain ([77.222.24.81])
 by smtp.gmail.com with ESMTPSA id
 q2-20020ac25a02000000b004f122a378d4sm3426174lfn.163.2023.07.01.07.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 07:06:11 -0700 (PDT)
From: Andrew Kanner <andrew.kanner@gmail.com>
To: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] fs/jfs: fix KASAN double-free warnings after failed
 jfs_remount()
Date: Sat,  1 Jul 2023 17:05:41 +0300
Message-Id: <20230701140542.2252-1-andrew.kanner@gmail.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20221201124628.603505-1-liushixin2@huawei.com>
References: <20221201124628.603505-1-liushixin2@huawei.com>
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

+Tested-by: Andrew Kanner <andrew.kanner@gmail.com>
for https://lore.kernel.org/all/20221201124628.603505-1-liushixin2@huawei.com/T/

The next change complements the patch from Liu Shixin (see above).
Two patches for fs/jfs/jfs_{imap,dmap}.c fix syzkaller issues:
Link: https://syzkaller.appspot.com/bug?extid=9f06ddd18bf059dff2ad
Link: https://syzkaller.appspot.com/bug?extid=6a93efb725385bc4b2e9
Link: https://syzkaller.appspot.com/bug?extid=90a11e6b1e810785c6ff
Link: https://syzkaller.appspot.com/bug?extid=47366a6b503c7edf6bbb
And Similar bugs from the other branches:
Link: https://syzkaller.appspot.com/bug?extid=cfff8c52c283dd09bf27
Link: https://syzkaller.appspot.com/bug?extid=e8f9034a130a66a2b351
Link: https://syzkaller.appspot.com/bug?extid=5c604c1cc148275ab8a6
Link: https://syzkaller.appspot.com/bug?extid=ea731a6641531af62f80
Link: https://syzkaller.appspot.com/bug?extid=b212249c28280daa4576

Andrew Kanner (1):
  fs/jfs: prevent double-free in dbUnmount() after failed jfs_remount()

 fs/jfs/jfs_dmap.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.39.3

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
