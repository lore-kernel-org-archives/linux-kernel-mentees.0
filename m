Return-Path: <SRS0=+2mV=3M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906FFC3F68F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jan 2020 12:05:55 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E5D924655
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jan 2020 12:05:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pkl7+p+1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E5D924655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C7CED869C0;
	Thu, 23 Jan 2020 12:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 80CGxu1L1BQs; Thu, 23 Jan 2020 12:05:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 74432869A9;
	Thu, 23 Jan 2020 12:05:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6047CC18DD;
	Thu, 23 Jan 2020 12:05:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB9B9C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 12:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C982B869A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 12:05:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W4ew7GcbMd-s
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 12:05:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A49B58697E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 12:05:51 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 62so1435472pfu.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 04:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CqY9YB2wAiI/Wp57Yy4bkMwCyRsVGvnd5+giEA8fZSk=;
 b=pkl7+p+1Dr0758k+BCjkzs4ph/iqSiSuLUHgd/o8DCTfZPM1Xa0HUXTPlF7BDRUC4P
 MO4SZ7wblivWzi/UgguYV0RSwHelwC6Zs71MY4RsjjHDBGvvoQhXHyaEgn3xwGmx6Laj
 HSZTs/TaoMqLoG5tkLHtAMM7whbKuvEhl+iIABEFWkuknY9qMLd5eVd9EQQirj5kv3wY
 k0tAGHXKlzbNIHNO8YMEGWfzfvvmwVZ/Q1SNJUOi1DQoOUpWDXQoXDq7DslZcDbhSPZm
 F7dm1bZzKHYKG+rMTiRTxHzo+avb44OE8E1qsbFsN+44v22bINxc/DUSfnS4obhHPd5H
 A2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CqY9YB2wAiI/Wp57Yy4bkMwCyRsVGvnd5+giEA8fZSk=;
 b=QSSDBu57aqO7FGLer+qvLtzqHYsJLrgf27YGBOHPVA8MY7BK0D5mTbYU45yQJusNGg
 2UmSLyfDSRbAoUwg76/ReVxVYYScREtwesH6db+uk8EZRTOy9U8Dst+jF+jfoLvDbpWR
 fBSbvsuRG5A5V7gFCl0XXAgynkEruSMK9tprFamhATbMgeJhbkyvtdosUungboKdVdTu
 6tUDbtP6gBDY4QIt1s5Dbhz7WMNpawm8COKFcOfOCtcPQyq+eRh5zzlbZjefXA8IhWo9
 wEizbJuzDp6OYlxZASd7imy1fYszQ+dVWyNN15szgp0pL+i4gb+oiVzM8gJA57gCiXhP
 2nLg==
X-Gm-Message-State: APjAAAWHyYosQFgVVdnjhCJLGhvqlvhq5oZhMdqpHCNi+Rf8doFxkrIN
 JbSBPHNSgwRAGD6XWnsqMM8=
X-Google-Smtp-Source: APXvYqyyH5J0GupMgirTs+5mSj6AqYDWZ14SFy5qG7Ze2gsIZwMDdoS6reaTPzuQVkr8hVKTy8aekw==
X-Received: by 2002:a63:e954:: with SMTP id q20mr3792032pgj.204.1579781151245; 
 Thu, 23 Jan 2020 04:05:51 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.138])
 by smtp.googlemail.com with ESMTPSA id x18sm2643381pfr.26.2020.01.23.04.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 04:05:50 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <jakub.kicinski@netronome.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
 Andrii Nakryiko <andriin@fb.com>
Date: Thu, 23 Jan 2020 17:34:38 +0530
Message-Id: <20200123120437.26506-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] bpf: devmap: Pass lockdep expression
	to RCU lists
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

head is traversed using hlist_for_each_entry_rcu outside an
RCU read-side critical section but under the protection
of dtab->index_lock.

Hence, add corresponding lockdep expression to silence false-positive
lockdep warnings, and harden RCU lists.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 kernel/bpf/devmap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
index 3d3d61b5985b..b4b6b77f309c 100644
--- a/kernel/bpf/devmap.c
+++ b/kernel/bpf/devmap.c
@@ -293,7 +293,8 @@ struct bpf_dtab_netdev *__dev_map_hash_lookup_elem(struct bpf_map *map, u32 key)
 	struct hlist_head *head = dev_map_index_hash(dtab, key);
 	struct bpf_dtab_netdev *dev;
 
-	hlist_for_each_entry_rcu(dev, head, index_hlist)
+	hlist_for_each_entry_rcu(dev, head, index_hlist,
+				 lockdep_is_held(&dtab->index_lock))
 		if (dev->idx == key)
 			return dev;
 
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
