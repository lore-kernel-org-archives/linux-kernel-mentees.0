Return-Path: <SRS0=QZ3P=DR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86933C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 21:09:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEBB5207C4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 21:09:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzBLA5pY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEBB5207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 975AB86704;
	Sat, 10 Oct 2020 21:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wvm1B6C9AbNo; Sat, 10 Oct 2020 21:09:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1258A870C4;
	Sat, 10 Oct 2020 21:09:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04552C07FF;
	Sat, 10 Oct 2020 21:09:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B83B3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 21:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9A89B871CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 21:09:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T6JDK63cOOGc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 21:09:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 22D5E8718A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 21:09:42 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id n14so9962730pff.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 14:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ec9PVwrrG4wt31+D6ewlM+AL+7A9A3Y/2wI9lVyXaLI=;
 b=jzBLA5pYP9ANRRty0Q2tPknfb4dcy7phjo7KoXG1ZJJFd45CUUNcxRmYFUz1pLnCfV
 6sKUhukAL5MToZ7+aE4myHQkmSGoZ6SJAtpyeMu9Gjqjsa1Cmnk50/yVca6AqKZR3NVx
 e9jY7mL8fjZATbr+aG0jeYpsQFsVFELgN/h8TeSkpSy6yD3J1NisKVwagSNO5i6KTwSF
 7wohsTYBjgoYzb/nr3RJxZKmu7Rgv//KLEa/Z6hJtyQYP0JSQTyNpdYAbkSmQ3Y92X05
 RXju+uBSSWrSsVqxepYTniHCyuQQh9an4He6FPTXn+2/YZ7SZTc7SSEitqJMlSheUwtE
 eQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ec9PVwrrG4wt31+D6ewlM+AL+7A9A3Y/2wI9lVyXaLI=;
 b=MeB1Fz0uJwWIdd5DfHS/zrbOb/3L1S6hOCqyb10ve6oygRafYJ5RajSZCavWjAqzOY
 EfrtSiNrY0386EWA2imShafBNL0IP7nNaSEPS8kG8zrz8YFlXhhq+/mMe0ZeX4Y7MyPT
 JJV6hK3pxqtDsyyoNLBWBaUfiba/iS1GXjwSE14dkWQXp1WuIWCJUgb3dZT2m4br5rw0
 OgxeS/1tjua5+uehmRaoh1qdl/EIniV/2M66sknQuhVwogGaGFevmgsEGYFL+Gvz2YB+
 G8EhhfXivCs5+u9/FyDSM+XEB/NVzv1fk4PYgj+Kjzhg4id3zDFKr2BKwPW5cDKHrtUK
 DuZg==
X-Gm-Message-State: AOAM531TFodwPzrIYmi+uMOJC/UbfVONehfs6ZcNfbpigZbitGh6HP1d
 0vOmFBGjfYLIJr0niSnzPgE=
X-Google-Smtp-Source: ABdhPJz9oa00UL45KYiP8Ed4JXeDj4BGCSkwo3hNV7y7qhN6uBnwfYk7/qq6ElDlcYQi8McRJQDdZw==
X-Received: by 2002:a17:90a:3486:: with SMTP id
 p6mr12198245pjb.23.1602364181401; 
 Sat, 10 Oct 2020 14:09:41 -0700 (PDT)
Received: from localhost.localdomain ([45.118.167.204])
 by smtp.googlemail.com with ESMTPSA id c10sm520701pgl.92.2020.10.10.14.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2020 14:09:40 -0700 (PDT)
From: Anmol Karn <anmol.karan123@gmail.com>
To: davem@davemloft.net,
	kuba@kernel.org
Date: Sun, 11 Oct 2020 02:39:29 +0530
Message-Id: <20201010210929.620244-1-anmol.karan123@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: mkubecek@suse.cz, andrew@lunn.ch, f.fainelli@gmail.com,
 syzbot+9d1389df89299fa368dc@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, dan.carpenter@oracle.com
Subject: [Linux-kernel-mentees] [PATCH net] ethtool: strset: Fix out of
	bound read in strset_parse_request()
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

Flag ``ETHTOOL_A_STRSET_COUNTS_ONLY`` tells the kernel to only return the string 
counts of the sets, but, when req_info->counts_only tries to read the 
tb[ETHTOOL_A_STRSET_COUNTS_ONLY] it gets out of bound. 

- net/ethtool/strset.c
The bug seems to trigger in this line:

req_info->counts_only = tb[ETHTOOL_A_STRSET_COUNTS_ONLY];

Fix it by NULL checking for req_info->counts_only while 
reading from tb[ETHTOOL_A_STRSET_COUNTS_ONLY].

Reported-by: syzbot+9d1389df89299fa368dc@syzkaller.appspotmail.com 
Link: https://syzkaller.appspot.com/bug?id=730deff8fe9954a5e317924d9acff98d9c64a770 
Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
---
When I tried to reduce the index of tb[] by 1, the crash reproducer was not working anymore,
hence it's probably reading from tb[ETHTOOL_A_STRSET_STRINGSETS], but this won't give the 
strset 'count' and hence is not a plausible fix. But checking for the req_info->counts_only 
seems legit.

If I have missed something please let me know, and I will work towards fixing it in next version.

 net/ethtool/strset.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/ethtool/strset.c b/net/ethtool/strset.c
index 82707b662fe4..20a7b36698f3 100644
--- a/net/ethtool/strset.c
+++ b/net/ethtool/strset.c
@@ -174,7 +174,8 @@ static int strset_parse_request(struct ethnl_req_info *req_base,
 	if (ret < 0)
 		return ret;
 
-	req_info->counts_only = tb[ETHTOOL_A_STRSET_COUNTS_ONLY];
+	if (req_info->counts_only)
+		req_info->counts_only = tb[ETHTOOL_A_STRSET_COUNTS_ONLY];
 	nla_for_each_nested(attr, nest, rem) {
 		u32 id;
 
-- 
2.28.0
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
