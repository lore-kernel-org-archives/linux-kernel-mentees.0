Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A17EC433F1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 05:37:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E98720792
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 05:37:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t+NKvYab"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E98720792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D4EB422268;
	Tue, 28 Jul 2020 05:37:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3HyQGO67vv1s; Tue, 28 Jul 2020 05:37:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BC571226CA;
	Tue, 28 Jul 2020 05:37:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97DC8C0050;
	Tue, 28 Jul 2020 05:37:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0A16C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 05:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8FB5E86946
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 05:37:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T9sRdc3d_Nw9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 05:37:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D7B6086942
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 05:37:22 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id v22so8147809qtq.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 22:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z7EWQYD7wy6xCJAzFJ7nXjY1PCd7b/cbV/q3G3Duy1U=;
 b=t+NKvYabQIvU/bHs2WsL/A56+4mEPwZyGuCuo2EDSpO7Cn1xgAdMW091HIp4X0cdeW
 VIEiRb/BQ0nAhKJWIXHOgMgBTfOL8Zicv+XDvRfD/8C51MHVvRk7q+aGL64IwS9GACQI
 jc7rFwTNzHcpyifukhI3hDWXpXauBuu86JnCdLxEtAOnyWJA7o7wfomtIQ10EM8Fs3xM
 RUUmBSHz0Ula/jnvdWOo9zuYXWfiPdfuOgmok3hEfzfKUlDSG1FGt9QPeuEcwNPE+9YU
 AX1ZbamMYUepk0RXfjSV8iocfUKnvwl3HWPIF4eAWN8L7q9jT3jtBC9HNOOYVWTJfdIP
 abcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z7EWQYD7wy6xCJAzFJ7nXjY1PCd7b/cbV/q3G3Duy1U=;
 b=WfvKpQIezudaTMkOjvC4QDmv/A/lMBE29VhW9pOI4dIwAVeGma5Ky2H1Xos0PlluRV
 R35A2OP6UvpKdIK4lkDUyPo3Qv4Tjfy76eAvLKRlbFsKVokVM/2NN49rqVs8bEWetcA7
 n9BRh03zf4+VUJPicMYOi1XBrgdBM4j5Om6Ar9E4mhJAWyX8NiHDHDl0nnAysKRN5QpM
 s4HrQP7oSaaE+Zz9pdgWW95SchamhZv2XmAGxKGHwVUGie0W92mHdu8bH3wjdKBBtkJk
 QevVfCuX0dVxnP7kC6/brdpX0VUiC7awFpe3jgMRyS11DQMTB1eetzLqG5e14lsbeLgK
 I7kQ==
X-Gm-Message-State: AOAM530p8ALWWDyuRzO4EYrQycD26fQB6aAuJIcKApguWQuVT5LjnnT2
 zzWSeJ83InwQiXVxoKuYMw==
X-Google-Smtp-Source: ABdhPJweN6bn9NhBF9KiMYU9STaREohK2QHtDH4joic0d2gYLwLSMzbMZq23Ys2LH0vazmtYJv5tNw==
X-Received: by 2002:aed:3387:: with SMTP id v7mr24245834qtd.318.1595914641882; 
 Mon, 27 Jul 2020 22:37:21 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net.
 [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id u42sm20985975qtu.48.2020.07.27.22.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 22:37:21 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Song Liu <songliubraving@fb.com>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>
Date: Tue, 28 Jul 2020 01:36:04 -0400
Message-Id: <20200728053604.404631-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200728022859.381819-1-yepeilin.cs@gmail.com>
References: <20200728022859.381819-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: Martin KaFai Lau <kafai@fb.com>, linux-kernel@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>, Arnd Bergmann <arnd@arndb.de>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 linux-kernel-mentees@lists.linuxfoundation.org, netdev@vger.kernel.org,
 Yonghong Song <yhs@fb.com>, KP Singh <kpsingh@chromium.org>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Andrii Nakryiko <andriin@fb.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>
Subject: [Linux-kernel-mentees] [PATCH net v2] xdp: Prevent kernel-infoleak
	in xsk_getsockopt()
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

xsk_getsockopt() is copying uninitialized stack memory to userspace when
`extra_stats` is `false`. Fix it.

Fixes: 8aa5a33578e9 ("xsk: Add new statistics")
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Doing `= {};` is sufficient since currently `struct xdp_statistics` is
defined as follows:

struct xdp_statistics {
	__u64 rx_dropped;
	__u64 rx_invalid_descs;
	__u64 tx_invalid_descs;
	__u64 rx_ring_full;
	__u64 rx_fill_ring_empty_descs;
	__u64 tx_ring_empty_descs;
};

When being copied to the userspace, `stats` will not contain any
uninitialized "holes" between struct fields.

Changes in v2:
    - Remove the "Cc: stable@vger.kernel.org" tag. (Suggested by Song Liu
      <songliubraving@fb.com>)
    - Initialize `stats` by assignment instead of using memset().
      (Suggested by Song Liu <songliubraving@fb.com>)

 net/xdp/xsk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index 26e3bba8c204..b2b533eddebf 100644
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@ -840,7 +840,7 @@ static int xsk_getsockopt(struct socket *sock, int level, int optname,
 	switch (optname) {
 	case XDP_STATISTICS:
 	{
-		struct xdp_statistics stats;
+		struct xdp_statistics stats = {};
 		bool extra_stats = true;
 		size_t stats_size;
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
