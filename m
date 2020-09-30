Return-Path: <SRS0=42xI=DH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D354C47426
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 05:17:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9FCA2075F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 05:17:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="baEIgc1t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9FCA2075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 35D0585FC3;
	Wed, 30 Sep 2020 05:17:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xZLbzcWd_v1L; Wed, 30 Sep 2020 05:17:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A0FFA85F67;
	Wed, 30 Sep 2020 05:17:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CD53C0889;
	Wed, 30 Sep 2020 05:17:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50475C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 05:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3B2AC87005
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 05:17:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M3086QZSgIKp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 05:17:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7BA3286FFB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 05:17:54 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id m15so302466pls.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 22:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3kFQkly1sTsAvr9NqpCdE/6D85qWzElfytCruQQ6xp0=;
 b=baEIgc1tAUz1CwCztA6ANx5C1M1eacWueIwa4tbHblGGxkmzCqNHjvhO+P/HWeEtiV
 VLIXdvqHNVLsk3fOqxcPATIMh9b7Rr+ctg3rk00Fo9WKt8g/s73sPS5xujg6Cy3573iC
 4hGaJGvw0cVOb9ZTnjXCiV4xIemufkqGd4nJ54J9Pal1W2uhpZWDeW3wx0ul077oR+qw
 gKqOSgTybJLRHockdq/oPVoXNwy/BXfAAWih2bB7Hdjvvrc+VGvzNZZEO5K+yILLYy6P
 0h529DY47EjOiKdvaoS7nXipkDAcxsIVZKNrNyYBb01R7pur9ytj1zZJBGzvsg5hn7EA
 J85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3kFQkly1sTsAvr9NqpCdE/6D85qWzElfytCruQQ6xp0=;
 b=IwtWBdSVF0U3RXAoNmt7HTyQvkZmM/MDxo4Nc8hI8FfQOtaeWkVjOJLh06kQNv+wFw
 KvP65z0vhkxCduZE0MxaMoEFxcrIC4sqfXSIwF/FgfnQY9Y8y7zFJLOKsLbDDGHll5H8
 dhSbp/ShTO5Jj/RUC++63Rrd6b1jyx2tWzhUubsRaCHApU5nVg9e7z38sXSoJZjfam72
 K4bEoCTV7rLIMLrGFNXyqnE55mX7zLY7FQfEh2ddwdv5DqHX5BuQD6BoanrPKee24MLe
 x/jo44rTbfV+1wR8vT5oEmkL9u58RVR0LWuzqEmLOR5UYNkvlcOmKalIs0Rn1Qjg3IEK
 zCpw==
X-Gm-Message-State: AOAM532N/1EQpwTZFjcISos8JYrJ/DubM1qE0HPmlhTmmyMiOjBytNYg
 FvCITqSkeVJN522wuJ/6BBU=
X-Google-Smtp-Source: ABdhPJwSER/8mTDxyPrH6z2kjHv64sIYRdLt4cRdx81XrZFtXXE3LVUl+Eyuk4hLLb+2aEhI8YLkBQ==
X-Received: by 2002:a17:902:c3d2:b029:d2:93f9:1d8a with SMTP id
 j18-20020a170902c3d2b02900d293f91d8amr1105887plj.66.1601443073874; 
 Tue, 29 Sep 2020 22:17:53 -0700 (PDT)
Received: from localhost.localdomain ([49.207.218.220])
 by smtp.gmail.com with ESMTPSA id gm17sm633432pjb.46.2020.09.29.22.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 22:17:53 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: mst@redhat.com, jasowang@redhat.com, davem@davemloft.net, kuba@kernel.org,
 ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
 john.fastabend@gmail.com, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, kpsingh@chromium.org
Date: Wed, 30 Sep 2020 10:47:22 +0530
Message-Id: <20200930051722.389587-3-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200930051722.389587-1-anant.thazhemadam@gmail.com>
References: <20200930051722.389587-1-anant.thazhemadam@gmail.com>
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 2/2] net: reorder members of
	receive_queue in virtio_net for optimization
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

Analysis of the structure receive_queue using pahole gives the
following stats.
	/* size: 1280, cachelines: 20, members: 11 */
        /* sum members: 1220, holes: 1, sum holes: 60 */
        /* paddings: 2, sum paddings: 44 */
        /* forced alignments: 2, forced holes: 1, sum forced holes: 60 */

Reordering the order in which the members of receive_queue are declared
helps in packing byte holes in the middle of receive_queue, and also
allows more members to be fully stored in a cacheline (of size 64bytes)
without overstepping over cachelines unnecessarily.

Analysis using pahole post-reordering of members gives us the following
stats.
	/* size: 1280, cachelines: 20, members: 11 */
        /* padding: 60 */
        /* paddings: 2, sum paddings: 44 */
        /* forced alignments: 2 */

Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
The complete analysis done by pahole can be found below.

Before the change:
	struct receive_queue {
		struct virtqueue *         vq;                   /*     0     8 */
		struct napi_struct napi __attribute__((__aligned__(8))); /*     8   392 */

		/* XXX last struct has 4 bytes of padding */

		/* --- cacheline 6 boundary (384 bytes) was 16 bytes ago --- */
		struct bpf_prog *          xdp_prog;             /*   400     8 */
		struct virtnet_rq_stats stats;                   /*   408    64 */
		/* --- cacheline 7 boundary (448 bytes) was 24 bytes ago --- */
		struct page *              pages;                /*   472     8 */
		struct ewma_pkt_len mrg_avg_pkt_len;             /*   480     8 */
		struct page_frag   alloc_frag;                   /*   488    16 */
		struct scatterlist sg[19];                       /*   504   608 */
		/* --- cacheline 17 boundary (1088 bytes) was 24 bytes ago --- */
		unsigned int               min_buf_len;          /*  1112     4 */
		char                       name[40];             /*  1116    40 */

		/* XXX 60 bytes hole, try to pack */

		/* --- cacheline 19 boundary (1216 bytes) --- */
		struct xdp_rxq_info xdp_rxq __attribute__((__aligned__(64))); /*  1216    64 */

		/* XXX last struct has 40 bytes of padding */

		/* size: 1280, cachelines: 20, members: 11 */
		/* sum members: 1220, holes: 1, sum holes: 60 */
		/* paddings: 2, sum paddings: 44 */
		/* forced alignments: 2, forced holes: 1, sum forced holes: 60 */
	} __attribute__((__aligned__(64)));

After the change:
	struct receive_queue {
		struct virtqueue *         vq;                   /*     0     8 */
		struct napi_struct napi __attribute__((__aligned__(8))); /*     8   392 */

		/* XXX last struct has 4 bytes of padding */

		/* --- cacheline 6 boundary (384 bytes) was 16 bytes ago --- */
		char                       name[40];             /*   400    40 */
		struct bpf_prog *          xdp_prog;             /*   440     8 */
		/* --- cacheline 7 boundary (448 bytes) --- */
		struct virtnet_rq_stats stats;                   /*   448    64 */
		/* --- cacheline 8 boundary (512 bytes) --- */
		struct scatterlist sg[19];                       /*   512   608 */
		/* --- cacheline 17 boundary (1088 bytes) was 32 bytes ago --- */
		struct page_frag   alloc_frag;                   /*  1120    16 */
		struct page *              pages;                /*  1136     8 */
		struct ewma_pkt_len mrg_avg_pkt_len;             /*  1144     8 */
		/* --- cacheline 18 boundary (1152 bytes) --- */
		struct xdp_rxq_info xdp_rxq __attribute__((__aligned__(64))); /*  1152    64 */

		/* XXX last struct has 40 bytes of padding */

		/* --- cacheline 19 boundary (1216 bytes) --- */
		unsigned int               min_buf_len;          /*  1216     4 */

		/* size: 1280, cachelines: 20, members: 11 */
		/* padding: 60 */
		/* paddings: 2, sum paddings: 44 */
		/* forced alignments: 2 */
	} __attribute__((__aligned__(64)));

It can be observed that the holes have been eliminated. 
Also, more members of virtnet_info are accomodated within a cacheline (instead of 
unnecessarily crossing over the cacheline boundary).
There is a padding of 60 performed at the end since the min_buf_len is only of 
size 4, and xdp_rxq is of size 64. If declared anywhere else other than at the 
end, a 60 bytes hole would open up again.

 drivers/net/virtio_net.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index f7bd85001cf0..b52db0b4879a 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -137,29 +137,29 @@ struct receive_queue {
 
 	struct napi_struct napi;
 
+	/* Name of this receive queue: input.$index */
+	char name[40];
+
 	struct bpf_prog __rcu *xdp_prog;
 
 	struct virtnet_rq_stats stats;
 
+	/* RX: fragments + linear part + virtio header */
+	struct scatterlist sg[MAX_SKB_FRAGS + 2];
+
+	/* Page frag for packet buffer allocation. */
+	struct page_frag alloc_frag;
+
 	/* Chain pages by the private ptr. */
 	struct page *pages;
 
 	/* Average packet length for mergeable receive buffers. */
 	struct ewma_pkt_len mrg_avg_pkt_len;
 
-	/* Page frag for packet buffer allocation. */
-	struct page_frag alloc_frag;
-
-	/* RX: fragments + linear part + virtio header */
-	struct scatterlist sg[MAX_SKB_FRAGS + 2];
+	struct xdp_rxq_info xdp_rxq;
 
 	/* Min single buffer size for mergeable buffers case. */
 	unsigned int min_buf_len;
-
-	/* Name of this receive queue: input.$index */
-	char name[40];
-
-	struct xdp_rxq_info xdp_rxq;
 };
 
 /* Control VQ buffers: protected by the rtnl lock */
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
