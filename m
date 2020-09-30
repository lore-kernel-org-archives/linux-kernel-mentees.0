Return-Path: <SRS0=42xI=DH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AB9C4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 05:17:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A047420789
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 05:17:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Px15OB6A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A047420789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2513887005;
	Wed, 30 Sep 2020 05:17:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 52TN4SU-K-xb; Wed, 30 Sep 2020 05:17:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8908E86FFB;
	Wed, 30 Sep 2020 05:17:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76E95C0889;
	Wed, 30 Sep 2020 05:17:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7BC6C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 05:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D72E78610B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 05:17:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MM-rtiXvbs0x
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 05:17:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 23B528638F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 05:17:47 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id l126so365246pfd.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 22:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xsh/NGfm9Lpck5qsH9oUyBKmR7gvigd5uWEhglPw8r8=;
 b=Px15OB6AyCpqk574Y/sAhDwl65KgkjVHiXyo2UacJHbd7BuHGOE39iRoOt7sDy4RFG
 1Lg1BU3JmP8YVXv61BSElcMObnR+IsbgpRYFLDfXAE69M/BsiYE8SbDfk8F13KtxG1kr
 63YzxEThDUKXVTYbJK2oHDc/7rKIYFbTSsnBGp2yhOBL/DgeAmqJCjbgoTb8LvLBTNAs
 h1aecY0uFMrflao6Ze2ELtirur1A5HA82r0rVlINwt8bD2gARTjfQoAAKgLKDNEKtJxS
 Y5bZpRCHrueZ9JdWpKzCOxnvUkhelWsxbwsJKTDRt3gxn3OtkhJnvYLO2ImlrwtKFIyQ
 Dgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xsh/NGfm9Lpck5qsH9oUyBKmR7gvigd5uWEhglPw8r8=;
 b=QYfSUf85sNjAaHVXmKKJyNmiU0a8snu3+DAxxWjsdA1zIEx9MjPjPFybHkAco/Xw7I
 JkXvch9BcS4ni2I7iKZuAN5pjdkLK7W8EJRlgLMD7+O8XE/q0yuh4kjMqi1bkezdOBHo
 wUE8W0DMOCpPfYNill35UF07zfreN0KRP+Y7g1EKSGWhS+8ItHwyERLnM6DcdU2eSCEH
 kyLV9Ic5vj9c0peP4r7rr0s3+MKTIJ96Rd8tDqW2clBQpNIX/muKOYY12MysQC5Mr0kU
 2i8i2zCZWME6cVnZ1qxw0CaK6Y4rDcH5bJ43XWu9X4lm1gK7KCrlItB+Cdh+xQZHteLe
 NJ+g==
X-Gm-Message-State: AOAM530iS8WZw8f7Ma3DexVyayipZ8Uow4X09sk95sMF09mQgIkaTo5/
 I8ZC3RBsozI3+rELim+xftw=
X-Google-Smtp-Source: ABdhPJx0xFgLfzUTp3/ALdDLXFuszMeOe1qKRKcrIVOdbQCBvl/uWe/uAJ6y++a70pyVFGgMJMF8Kg==
X-Received: by 2002:a63:2063:: with SMTP id r35mr856885pgm.320.1601443066501; 
 Tue, 29 Sep 2020 22:17:46 -0700 (PDT)
Received: from localhost.localdomain ([49.207.218.220])
 by smtp.gmail.com with ESMTPSA id gm17sm633432pjb.46.2020.09.29.22.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 22:17:45 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: mst@redhat.com, jasowang@redhat.com, davem@davemloft.net, kuba@kernel.org,
 ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
 john.fastabend@gmail.com
Date: Wed, 30 Sep 2020 10:47:21 +0530
Message-Id: <20200930051722.389587-2-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200930051722.389587-1-anant.thazhemadam@gmail.com>
References: <20200930051722.389587-1-anant.thazhemadam@gmail.com>
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/2] net: reorder members of
	virtnet_info for optimization
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

Analysis of the structure virtnet_info using pahole gives the
following stats.
	/* size: 256, cachelines: 4, members: 25 */
	/* sum members: 245, holes: 3, sum holes: 11 */
	/* paddings: 1, sum paddings: 4 */

Reordering the order in which the members of virtnet_info are declared
helps in packing byte holes in the middle of virtnet_info, reduce the
size required by the structure by 8 bytes, and also allows members to be
stored without overstepping the boundaries of a cacheline (for a
cacheline of size 64bytes) unnecessarily.

Analysis using pahole post-reordering of members gives the following
stats.
	/* size: 248, cachelines: 4, members: 25 */
        /* padding: 3 */
        /* paddings: 1, sum paddings: 4 */
        /* last cacheline: 56 bytes */

Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
The complete analysis done by pahole can be found below.
Before the change:
		struct virtnet_info {
		struct virtio_device *     vdev;                 /*     0     8 */
		struct virtqueue *         cvq;                  /*     8     8 */
		struct net_device *        dev;                  /*    16     8 */
		struct send_queue *        sq;                   /*    24     8 */
		struct receive_queue *     rq;                   /*    32     8 */
		unsigned int               status;               /*    40     4 */
		u16                        max_queue_pairs;      /*    44     2 */
		u16                        curr_queue_pairs;     /*    46     2 */
		u16                        xdp_queue_pairs;      /*    48     2 */
		bool                       big_packets;          /*    50     1 */
		bool                       mergeable_rx_bufs;    /*    51     1 */
		bool                       has_cvq;              /*    52     1 */
		bool                       any_header_sg;        /*    53     1 */
		u8                         hdr_len;              /*    54     1 */

		/* XXX 1 byte hole, try to pack */

		struct delayed_work refill;                      /*    56    88 */

		/* XXX last struct has 4 bytes of padding */

		/* --- cacheline 2 boundary (128 bytes) was 16 bytes ago --- */
		struct work_struct config_work;                  /*   144    32 */
		bool                       affinity_hint_set;    /*   176     1 */

		/* XXX 7 bytes hole, try to pack */

		struct hlist_node  node;                         /*   184    16 */
		/* --- cacheline 3 boundary (192 bytes) was 8 bytes ago --- */
		struct hlist_node  node_dead;                    /*   200    16 */
		struct control_buf *       ctrl;                 /*   216     8 */
		u8                         duplex;               /*   224     1 */

		/* XXX 3 bytes hole, try to pack */

		u32                        speed;                /*   228     4 */
		long unsigned int          guest_offloads;       /*   232     8 */
		long unsigned int          guest_offloads_capable; /*   240     8 */
		struct failover *          failover;             /*   248     8 */

		/* size: 256, cachelines: 4, members: 25 */
		/* sum members: 245, holes: 3, sum holes: 11 */
		/* paddings: 1, sum paddings: 4 */
	};

After the Change:
	struct virtnet_info {
		struct virtio_device *     vdev;                 /*     0     8 */
		struct virtqueue *         cvq;                  /*     8     8 */
		struct net_device *        dev;                  /*    16     8 */
		struct send_queue *        sq;                   /*    24     8 */
		struct receive_queue *     rq;                   /*    32     8 */
		unsigned int               status;               /*    40     4 */
		u16                        max_queue_pairs;      /*    44     2 */
		u16                        curr_queue_pairs;     /*    46     2 */
		u16                        xdp_queue_pairs;      /*    48     2 */
		bool                       big_packets;          /*    50     1 */
		bool                       mergeable_rx_bufs;    /*    51     1 */
		bool                       has_cvq;              /*    52     1 */
		bool                       any_header_sg;        /*    53     1 */
		bool                       affinity_hint_set;    /*    54     1 */
		u8                         hdr_len;              /*    55     1 */
		struct control_buf *       ctrl;                 /*    56     8 */
		/* --- cacheline 1 boundary (64 bytes) --- */
		struct work_struct config_work;                  /*    64    32 */
		struct hlist_node  node;                         /*    96    16 */
		struct hlist_node  node_dead;                    /*   112    16 */
		/* --- cacheline 2 boundary (128 bytes) --- */
		long unsigned int          guest_offloads;       /*   128     8 */
		long unsigned int          guest_offloads_capable; /*   136     8 */
		struct failover *          failover;             /*   144     8 */
		struct delayed_work refill;                      /*   152    88 */

		/* XXX last struct has 4 bytes of padding */

		/* --- cacheline 3 boundary (192 bytes) was 48 bytes ago --- */
		u32                        speed;                /*   240     4 */
		u8                         duplex;               /*   244     1 */

		/* size: 248, cachelines: 4, members: 25 */
		/* padding: 3 */
		/* paddings: 1, sum paddings: 4 */
		/* last cacheline: 56 bytes */
	};

It can be seen that the size has reduced by 8 bytes, and the holes have been eliminated
as well. Also, more members of virtnet_info are accomodated within one cacheline 
(without unnecessarily crossing over the cacheline boundary).


 drivers/net/virtio_net.c | 42 ++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 263b005981bd..32747f1980ae 100644
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
@@ -202,33 +202,33 @@ struct virtnet_info {
 	/* Host can handle any s/g split between our header and packet data */
 	bool any_header_sg;
 
+	/* Does the affinity hint is set for virtqueues? */
+	bool affinity_hint_set;
+
 	/* Packet virtio header size */
 	u8 hdr_len;
 
-	/* Work struct for refilling if we run low on memory. */
-	struct delayed_work refill;
+	struct control_buf *ctrl;
 
 	/* Work struct for config space updates */
 	struct work_struct config_work;
 
-	/* Does the affinity hint is set for virtqueues? */
-	bool affinity_hint_set;
-
 	/* CPU hotplug instances for online & dead */
 	struct hlist_node node;
 	struct hlist_node node_dead;
 
-	struct control_buf *ctrl;
-
-	/* Ethtool settings */
-	u8 duplex;
-	u32 speed;
-
 	unsigned long guest_offloads;
 	unsigned long guest_offloads_capable;
 
 	/* failover when STANDBY feature enabled */
 	struct failover *failover;
+
+	/* Work struct for refilling if we run low on memory. */
+	struct delayed_work refill;
+
+	/* Ethtool settings */
+	u32 speed;
+	u8 duplex;
 };
 
 struct padded_vnet_hdr {
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
