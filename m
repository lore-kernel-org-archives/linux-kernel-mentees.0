Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5915CC433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Oct 2022 07:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA72160E2A;
	Sat,  1 Oct 2022 07:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA72160E2A
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jj0QTDpg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cNS_iPmYAStM; Sat,  1 Oct 2022 07:02:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E0DFE60AC9;
	Sat,  1 Oct 2022 07:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0DFE60AC9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1EEC7C0033;
	Sat,  1 Oct 2022 07:02:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E630C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Oct 2022 07:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D8D6419AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Oct 2022 07:02:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D8D6419AE
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jj0QTDpg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GI4H597Lbgq6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Oct 2022 07:02:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F790416E9
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F790416E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Oct 2022 07:02:13 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id u69so5878330pgd.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 Oct 2022 00:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=UZi6urliHkT7uuCCwMJIEdfiFKYnQrKuVx0cI+vnDEU=;
 b=jj0QTDpgDeZfGbcn6HGHaPXlP88xl40rG7Pv4j42eH9P9CfKS18A/RSUi7ExdFCu37
 CPbHmiQ23xzPkU2WKU0+1760AmANnC0w052wPTKM0i1n+DQdxeU2G01si0Ql7OaMuWoe
 T9mOR3PK4ShjtJAlj6fzSzqPu+Qe4mrPb124p8mLQZA6L0tbb49F2E1J0C1ZXTx51OyE
 8BjJnaFLFYhwQIoeAIERiZrq6DJ8FcViu0Jor6jnsYh1VkpsByCAYu0WraPm3E60jseB
 emkBG78Wy5SQmcXIlmwaeCxP2KFBDShazS8b5Cgu5Y5oHEM9m9Zq+0SWZFSARrOpcGH7
 qD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=UZi6urliHkT7uuCCwMJIEdfiFKYnQrKuVx0cI+vnDEU=;
 b=Pfi+cjggWmC+1IDOjBCHKp72I0jz6Gbc1IF4xisXhjKeWyI3Ktov5+ZSgk0x/1VxoF
 GHGKZ1KqLDV+GfhUn/jJIGpWCIfkuhWG1kUsRscmAFK1I6xGVwdvV5Wgk/QU3wmnX4i9
 PDHLNArgz1NlL+JUa7AY9i6F7ZLyJRYsvxmFoCPZVwZHE+2YuaqdiMC5un+y+2Ug8ZUD
 ZaGfyZhRprGVnCOS/dlwZIbCvLdMw9n1nLHjeR1H6B81h9CcB73yoI7olAH2fBfeSE6z
 lH4nYBW9BsUVbp/eNFNNtEFcstGY/9IK34naT6okCChRJWB6m6EO8I9Y63HCTeUu+Twh
 VeOA==
X-Gm-Message-State: ACrzQf3X+daxzyNabfQ9M6T7+9a0Mx+n+fHqZqqZX53Ns2v0Bh071wI9
 d4J+ggOM2SlMzZaCX8fvc5I=
X-Google-Smtp-Source: AMsMyM6NekkCQ+SPiH7FgzScGB7FRte1AggwIPEioxwjLKRo72tVf8xBr2hlsYj7VC29MD0zXyl0/A==
X-Received: by 2002:a05:6a00:140d:b0:52a:d561:d991 with SMTP id
 l13-20020a056a00140d00b0052ad561d991mr12604792pfu.46.1664607732558; 
 Sat, 01 Oct 2022 00:02:12 -0700 (PDT)
Received: from localhost.localdomain ([171.78.165.127])
 by smtp.googlemail.com with ESMTPSA id
 9-20020a631349000000b00429b6e6c539sm2764473pgt.61.2022.10.01.00.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 00:02:12 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Subject: [PATCH] fs/ntfs3: Fix slab-out-of-bounds read in ntfs_trim_fs
Date: Sat,  1 Oct 2022 12:30:24 +0530
Message-Id: <20221001070024.1366018-1-abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Cc: syzbot+b892240eac461e488d51@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev,
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

Syzbot reports an out of bound access in ntfs_trim_fs.
The cause of this is using a loop termination condition that compares
window index (iw) with wnd->nbits instead of wnd->nwnd, due to which the
index used for wnd->free_bits exceeds the size of the array allocated.

Fix the loop condition.

Fixes: 3f3b442b5ad2 ("fs/ntfs3: Add bitmap")
Link: https://syzkaller.appspot.com/bug?extid=b892240eac461e488d51
Reported-by: syzbot+b892240eac461e488d51@syzkaller.appspotmail.com
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 fs/ntfs3/bitmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
index 1675c9a69788..629c1ee97268 100644
--- a/fs/ntfs3/bitmap.c
+++ b/fs/ntfs3/bitmap.c
@@ -1424,7 +1424,7 @@ int ntfs_trim_fs(struct ntfs_sb_info *sbi, struct fstrim_range *range)
 
 	down_read_nested(&wnd->rw_lock, BITMAP_MUTEX_CLUSTERS);
 
-	for (; iw < wnd->nbits; iw++, wbit = 0) {
+	for (; iw < wnd->nwnd; iw++, wbit = 0) {
 		CLST lcn_wnd = iw * wbits;
 		struct buffer_head *bh;
 
-- 
2.37.3

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
