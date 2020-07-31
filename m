Return-Path: <SRS0=tCTQ=BK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CA9C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 04:50:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 564CF2072A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 04:50:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6l58DtE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 564CF2072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2B58D88478;
	Fri, 31 Jul 2020 04:50:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T9RGOV10-tZk; Fri, 31 Jul 2020 04:50:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7E62188455;
	Fri, 31 Jul 2020 04:50:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5DB9EC0050;
	Fri, 31 Jul 2020 04:50:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CBDE7C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 04:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A84A520448
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 04:50:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ufahtqIa0YQU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 04:50:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 7F9152042D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 04:50:21 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id j10so6919409qvo.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 21:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6BmyvzPtmL92uqePz7MKoJvHsqbaPFKy91FuGn4J6aM=;
 b=i6l58DtETKYbDvaDzHN27Ly/UzsYlzhN5HqPyYRcuuC538WNatf1azS+mQWlENzmOr
 R4gZK7IHf0+5a3RRbN4Wtbh9qZE3XLCKXnPDSORWmPC0vrcGXd9is3gDtvIx4YKQvXl7
 zcEnfibUoAmj8hITpXbSwA4b/4p4yYnR6gAlFuFXbYqcYtEtAe/vcoAdADVN065tE7qw
 WXAcNf1L2s/lshu2sxBwrJPi/5vmb1qWKfKCCiwy+SGFIyzqXsqGGggbJjp+v3yVaN/S
 DG4seX2tBXQq2T9HOqI51HDoLJozcYTOv7lGE2BBY7BFO9tr3f3KJ9npT0hWjKubS1nk
 +tyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6BmyvzPtmL92uqePz7MKoJvHsqbaPFKy91FuGn4J6aM=;
 b=V+gAJGu3jaTCvh6XmaD3q54prkRsE2orCa522oVsR1WOHnTjj1H/qb9kBaqQI1QqCq
 8a28efcpeyVw/mNEsQBJoBlaeDk6GZR0v304GJmCfM9KjSx7oeAaG0r61WnngpHoTtJP
 tpC7CQdgCgeAev2VvM458m9GO8lRbe0OSe7Yvv8u8Q266CE5rs05dWHuL0N2dXfmTeYH
 oY1HL2XdTdbC+X40iUNToONWGNhcNYRwJOV+QAUGdQQfBCqyIC1y8cQnB84D6baiYmeb
 CERZSQi/p5wbJg0W9l2TdFhmIrww7JGceunHGJH0ZUl4RsRUUGMdas2HzKFIVZmxvXSq
 +LyA==
X-Gm-Message-State: AOAM530vmizKz88Va2rPqXzRN0TX5HPLaZBD6daO/Tw1pNxJcUUzCB7e
 uvztWB8uXYcrEQGinjNNFw==
X-Google-Smtp-Source: ABdhPJxIG7qiv+i9D/06CElrwmKpCb43C7xccST5RRJeVQmM4efRjwaM+qxfhjnSVDYpdRxh60e3KA==
X-Received: by 2002:a0c:83c4:: with SMTP id k62mr2410066qva.19.1596171020491; 
 Thu, 30 Jul 2020 21:50:20 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net.
 [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id c7sm7801798qta.95.2020.07.30.21.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 21:50:20 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Pravin B Shelar <pshelar@ovn.org>
Date: Fri, 31 Jul 2020 00:48:38 -0400
Message-Id: <20200731044838.213975-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: dev@openvswitch.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Linux-kernel-mentees] [PATCH net] openvswitch: Prevent
	kernel-infoleak in ovs_ct_put_key()
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

ovs_ct_put_key() is potentially copying uninitialized kernel stack memory
into socket buffers, since the compiler may leave a 3-byte hole at the end
of `struct ovs_key_ct_tuple_ipv4` and `struct ovs_key_ct_tuple_ipv6`. Fix
it by initializing `orig` with memset().

Cc: stable@vger.kernel.org
Fixes: 9dd7f8907c37 ("openvswitch: Add original direction conntrack tuple to sw_flow_key.")
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Reference: https://lwn.net/Articles/417989/

$ pahole -C "ovs_key_ct_tuple_ipv4" net/openvswitch/conntrack.o
struct ovs_key_ct_tuple_ipv4 {
	__be32                     ipv4_src;             /*     0     4 */
	__be32                     ipv4_dst;             /*     4     4 */
	__be16                     src_port;             /*     8     2 */
	__be16                     dst_port;             /*    10     2 */
	__u8                       ipv4_proto;           /*    12     1 */

	/* size: 16, cachelines: 1, members: 5 */
	/* padding: 3 */
	/* last cacheline: 16 bytes */
};
$ pahole -C "ovs_key_ct_tuple_ipv6" net/openvswitch/conntrack.o
struct ovs_key_ct_tuple_ipv6 {
	__be32                     ipv6_src[4];          /*     0    16 */
	__be32                     ipv6_dst[4];          /*    16    16 */
	__be16                     src_port;             /*    32     2 */
	__be16                     dst_port;             /*    34     2 */
	__u8                       ipv6_proto;           /*    36     1 */

	/* size: 40, cachelines: 1, members: 5 */
	/* padding: 3 */
	/* last cacheline: 40 bytes */
};

 net/openvswitch/conntrack.c | 38 +++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/net/openvswitch/conntrack.c b/net/openvswitch/conntrack.c
index 4340f25fe390..98d393e70de3 100644
--- a/net/openvswitch/conntrack.c
+++ b/net/openvswitch/conntrack.c
@@ -276,10 +276,6 @@ void ovs_ct_fill_key(const struct sk_buff *skb, struct sw_flow_key *key)
 	ovs_ct_update_key(skb, NULL, key, false, false);
 }
 
-#define IN6_ADDR_INITIALIZER(ADDR) \
-	{ (ADDR).s6_addr32[0], (ADDR).s6_addr32[1], \
-	  (ADDR).s6_addr32[2], (ADDR).s6_addr32[3] }
-
 int ovs_ct_put_key(const struct sw_flow_key *swkey,
 		   const struct sw_flow_key *output, struct sk_buff *skb)
 {
@@ -301,24 +297,30 @@ int ovs_ct_put_key(const struct sw_flow_key *swkey,
 
 	if (swkey->ct_orig_proto) {
 		if (swkey->eth.type == htons(ETH_P_IP)) {
-			struct ovs_key_ct_tuple_ipv4 orig = {
-				output->ipv4.ct_orig.src,
-				output->ipv4.ct_orig.dst,
-				output->ct.orig_tp.src,
-				output->ct.orig_tp.dst,
-				output->ct_orig_proto,
-			};
+			struct ovs_key_ct_tuple_ipv4 orig;
+
+			memset(&orig, 0, sizeof(orig));
+			orig.ipv4_src = output->ipv4.ct_orig.src;
+			orig.ipv4_dst = output->ipv4.ct_orig.dst;
+			orig.src_port = output->ct.orig_tp.src;
+			orig.dst_port = output->ct.orig_tp.dst;
+			orig.ipv4_proto = output->ct_orig_proto;
+
 			if (nla_put(skb, OVS_KEY_ATTR_CT_ORIG_TUPLE_IPV4,
 				    sizeof(orig), &orig))
 				return -EMSGSIZE;
 		} else if (swkey->eth.type == htons(ETH_P_IPV6)) {
-			struct ovs_key_ct_tuple_ipv6 orig = {
-				IN6_ADDR_INITIALIZER(output->ipv6.ct_orig.src),
-				IN6_ADDR_INITIALIZER(output->ipv6.ct_orig.dst),
-				output->ct.orig_tp.src,
-				output->ct.orig_tp.dst,
-				output->ct_orig_proto,
-			};
+			struct ovs_key_ct_tuple_ipv6 orig;
+
+			memset(&orig, 0, sizeof(orig));
+			memcpy(orig.ipv6_src, output->ipv6.ct_orig.src.s6_addr32,
+			       sizeof(orig.ipv6_src));
+			memcpy(orig.ipv6_dst, output->ipv6.ct_orig.dst.s6_addr32,
+			       sizeof(orig.ipv6_dst));
+			orig.src_port = output->ct.orig_tp.src;
+			orig.dst_port = output->ct.orig_tp.dst;
+			orig.ipv6_proto = output->ct_orig_proto;
+
 			if (nla_put(skb, OVS_KEY_ATTR_CT_ORIG_TUPLE_IPV6,
 				    sizeof(orig), &orig))
 				return -EMSGSIZE;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
