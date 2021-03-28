Return-Path: <SRS0=QUeb=I2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD8CC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 28 Mar 2021 12:06:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B143C61953
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 28 Mar 2021 12:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B143C61953
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79519403DC;
	Sun, 28 Mar 2021 12:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K5xHnZkWcLQc; Sun, 28 Mar 2021 12:05:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A8AF403DA;
	Sun, 28 Mar 2021 12:05:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4A7F4C000C;
	Sun, 28 Mar 2021 12:05:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39907C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 Mar 2021 12:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20B9483B36
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 Mar 2021 12:05:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ESCMLKNpe573
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 Mar 2021 12:05:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FA2D83B34
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 Mar 2021 12:05:57 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id h3so8022987pfr.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 Mar 2021 05:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bh7FpP7ll2rb0ew3xIuqAoIB0GKlnqepEv7+KeRSy+0=;
 b=aDxFeDSRpHfeC0QquDjRtHbg47SsLq1G3W9Egd6ch/sBvaDCQzTSxBMdTxJfmoDFjn
 YFfMGJL6f+noevkRJAsTXyjCFNcS0LSXF1DPLqVB6cXVrbRvSzz6+a7hZnlOgdkMZ8iJ
 uyJigQGqY+pMvbiULBOpJ9KWJSeYnrR48mUsxoMoQ7R18AhfcuScFIojUKHofITBu/XW
 PYcsN0xCt4iabu/p/EBsAxf2Bp4LQgexzD6cJ0qVqthnR28nOKMWrenZ7oO7aE10Y8BA
 lOJKk5LX8CrhxMgbw7qDSpJD/hc/Z+zr1JEjUyBCKw9KUTVl0Yy2qMVgULV1h5bACHJn
 khbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bh7FpP7ll2rb0ew3xIuqAoIB0GKlnqepEv7+KeRSy+0=;
 b=QAZ4ErXBacdjHX45futiQzhXbceWpMuQvaNiqq6nRmTOMfcTuMFLI0kXWjEK83pOw9
 JOGlvHBl5DnvLt9qk/QXD15Xt2Puzkp13IZornM8ufy5cofaomeYq/zUoVmSiyqUGz9f
 bD2jh5EcHB6iWezqiTMDkp15oQXp77fTnOxQq6QdQqBP4QuGOKBbEL15FFwm7m+Twfr8
 C3VMLITnRG4IcytSIjuBo34X0sgH78ZIaC4ccsQtxotHX73+IHauBdBAjPoPxVxR+Can
 41De9b7JyinsFpZ7sw+Adzhmq4Dbcu9CfmKg5jTHK/9QAn85smtLuWkRaSL+ulG8DB+Z
 E02g==
X-Gm-Message-State: AOAM533EP+fkDUQ5xD4cFw9aA1a3sWLcB5mWSG8ZbKmyAIMS2n5MhtgV
 u01FQIrArfwRhHpbOiIXxpE=
X-Google-Smtp-Source: ABdhPJw75mA8YVf01PjO5ZIpfSaDgVtNIzdzcXlrnhwXj/Anvfw/E318D2ivs7Os+0erTAXcgD90Mg==
X-Received: by 2002:a65:538f:: with SMTP id x15mr20180856pgq.429.1616933156973; 
 Sun, 28 Mar 2021 05:05:56 -0700 (PDT)
Received: from localhost.localdomain ([136.185.95.200])
 by smtp.gmail.com with ESMTPSA id y12sm14483328pfq.118.2021.03.28.05.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 05:05:56 -0700 (PDT)
From: Atul Gopinathan <atulgopinathan@gmail.com>
To: davem@davemloft.net
Subject: [PATCH bpf-next] bpf: tcp: Remove comma which is causing build error
Date: Sun, 28 Mar 2021 17:35:15 +0530
Message-Id: <20210328120515.113895-1-atulgopinathan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: songliubraving@fb.com, daniel@iogearbox.net, yoshfuji@linux-ipv6.org,
 netdev@vger.kernel.org, dsahern@kernel.org, john.fastabend@gmail.com,
 ast@kernel.org, andrii@kernel.org, Atul Gopinathan <atulgopinathan@gmail.com>,
 syzbot+0b74d8ec3bf0cc4e4209@syzkaller.appspotmail.com, yhs@fb.com,
 kpsingh@kernel.org, kuba@kernel.org, bpf@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, kafai@fb.com,
 linux-kernel@vger.kernel.org
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

Currently, building the bpf-next source with the CONFIG_BPF_SYSCALL
enabled is causing a compilation error:

"net/ipv4/bpf_tcp_ca.c:209:28: error: expected identifier or '(' before
',' token"

Fix this by removing an unnecessary comma.

Reported-by: syzbot+0b74d8ec3bf0cc4e4209@syzkaller.appspotmail.com
Fixes: e78aea8b2170 ("bpf: tcp: Put some tcp cong functions in allowlist for bpf-tcp-cc")
Signed-off-by: Atul Gopinathan <atulgopinathan@gmail.com>
---
 net/ipv4/bpf_tcp_ca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/bpf_tcp_ca.c b/net/ipv4/bpf_tcp_ca.c
index 40520b77a307..12777d444d0f 100644
--- a/net/ipv4/bpf_tcp_ca.c
+++ b/net/ipv4/bpf_tcp_ca.c
@@ -202,15 +202,15 @@ BTF_ID(func, dctcp_cwnd_undo)
 BTF_ID(func, dctcp_state)
 #endif
 #if IS_BUILTIN(CONFIG_TCP_CONG_BBR)
 BTF_ID(func, bbr_init)
 BTF_ID(func, bbr_main)
 BTF_ID(func, bbr_sndbuf_expand)
 BTF_ID(func, bbr_undo_cwnd)
-BTF_ID(func, bbr_cwnd_even),
+BTF_ID(func, bbr_cwnd_even)
 BTF_ID(func, bbr_ssthresh)
 BTF_ID(func, bbr_min_tso_segs)
 BTF_ID(func, bbr_set_state)
 #endif
 BTF_SET_END(bpf_tcp_ca_kfunc_ids)
 
 static bool bpf_tcp_ca_check_kfunc_call(u32 kfunc_btf_id)
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
