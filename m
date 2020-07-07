Return-Path: <SRS0=keMi=AS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215F9C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 17:15:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB0B2206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 17:15:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OoD5s6Eq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB0B2206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 957F825028;
	Tue,  7 Jul 2020 17:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6PlieqkfJRGE; Tue,  7 Jul 2020 17:15:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 758EA22FC6;
	Tue,  7 Jul 2020 17:15:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B4C1C07FF;
	Tue,  7 Jul 2020 17:15:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35741C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 17:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2470E88256
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 17:15:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bowRs1qcMJqp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 17:15:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 38DAE88251
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 17:15:19 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r12so45962583wrj.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Jul 2020 10:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=zPaFNN0CwRIrxgMT/Hx12rk1w2uEgsV43cWtsFNawmA=;
 b=OoD5s6EqQZLxfIp3I7A669VifnUn9Ibnc7LYMSzZ0tIPUiA9Tp+buHQWel8bB9NGk2
 EGangoBXq+izJzkRL1SnU8OAXuEDSdrGvKiTIwg3pdycFDevybGoENDig+Lin5AzfxWn
 rV61Zirbp/gFLfE4XdvxvCOlOODfeXWxT96BQOHVqZkX/J+llXtaJhvzMN3duDyx1vmF
 UtnFxZDDLSvOdsxVgUzYyobE4n4F/ZgGwV+CqNdRYZAjF1GmtCkfutynvWYnuKPjn1wm
 ymW3Rw/ZTEaVMH6waJzp/4nd8HMM7k76LkNaYVpT4umj4p1Z6H3JkI3G8/Hg1SfAn7v2
 IxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zPaFNN0CwRIrxgMT/Hx12rk1w2uEgsV43cWtsFNawmA=;
 b=Uawx9mIAMaVJ3IRZ7B8KjN88X9fqdNgPkeK5ZbVwdzFtntEBcPQ7xyHpuDk1q/weRj
 PTHP9V4+ibwmH8cKdEO4cv+BHjMUk6zGldWeES+QXgsClcMr3Dl81fPmYk/A4Mvbearm
 r7bPal0sw/MEqagycd7UloUBe8KR+B4YSshQkxMeTRcy3o5+ameBb/gvo5lkGBDuBlQ/
 r2z4rVq+UUgekX11tf1+ye4cTIQUm8pEImIkhxy3tz9ebYXVJHJ9JbN9Xg2/cIWqrX0R
 FdC4LsPA1s/BMz/n+nQzv6ymdc6nsNrdy2sA16TP02ZObgTVpE5xr7cPanQNmiUfN7IF
 4TpA==
X-Gm-Message-State: AOAM531u4SPk3/paSr1FiWK8Jv1yYTbIGj7VAleKGKGxN3AloE4RjhNA
 QO6sWMzWeduj7wC21TEKehE=
X-Google-Smtp-Source: ABdhPJwhTIoqPYMMiP4fvG9oZ1gOVUngiaKMsqX034M6n5Y/X7x48Jlyu5WLxXmWUrCOj1WsUBIg7A==
X-Received: by 2002:a5d:6683:: with SMTP id l3mr7880261wru.288.1594142117582; 
 Tue, 07 Jul 2020 10:15:17 -0700 (PDT)
Received: from localhost.localdomain ([185.200.214.168])
 by smtp.gmail.com with ESMTPSA id d132sm1872742wmd.35.2020.07.07.10.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 10:15:16 -0700 (PDT)
From: izabela.bakollari@gmail.com
To: nhorman@tuxdriver.com,
	davem@davemloft.net,
	kuba@kernel.org
Date: Tue,  7 Jul 2020 19:15:15 +0200
Message-Id: <20200707171515.110818-1-izabela.bakollari@gmail.com>
X-Mailer: git-send-email 2.18.4
Cc: netdev@vger.kernel.org, izabela.bakollari@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH net-next] dropwatch: Support
	monitoring of dropped frames
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: Izabela Bakollari <izabela.bakollari@gmail.com>

Dropwatch is a utility that monitors dropped frames by having userspace
record them over the dropwatch protocol over a file. This augument
allows live monitoring of dropped frames using tools like tcpdump.

With this feature, dropwatch allows two additional commands (start and
stop interface) which allows the assignment of a net_device to the
dropwatch protocol. When assinged, dropwatch will clone dropped frames,
and receive them on the assigned interface, allowing tools like tcpdump
to monitor for them.

With this feature, create a dummy ethernet interface (ip link add dev
dummy0 type dummy), assign it to the dropwatch kernel subsystem, by using
these new commands, and then monitor dropped frames in real time by
running tcpdump -i dummy0.

Signed-off-by: Izabela Bakollari <izabela.bakollari@gmail.com>
---
 include/uapi/linux/net_dropmon.h |  3 ++
 net/core/drop_monitor.c          | 79 +++++++++++++++++++++++++++++++-
 2 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/net_dropmon.h b/include/uapi/linux/net_dropmon.h
index 67e31f329190..e8e861e03a8a 100644
--- a/include/uapi/linux/net_dropmon.h
+++ b/include/uapi/linux/net_dropmon.h
@@ -58,6 +58,8 @@ enum {
 	NET_DM_CMD_CONFIG_NEW,
 	NET_DM_CMD_STATS_GET,
 	NET_DM_CMD_STATS_NEW,
+	NET_DM_CMD_START_IFC,
+	NET_DM_CMD_STOP_IFC,
 	_NET_DM_CMD_MAX,
 };
 
@@ -93,6 +95,7 @@ enum net_dm_attr {
 	NET_DM_ATTR_SW_DROPS,			/* flag */
 	NET_DM_ATTR_HW_DROPS,			/* flag */
 	NET_DM_ATTR_FLOW_ACTION_COOKIE,		/* binary */
+	NET_DM_ATTR_IFNAME,			/* string */
 
 	__NET_DM_ATTR_MAX,
 	NET_DM_ATTR_MAX = __NET_DM_ATTR_MAX - 1
diff --git a/net/core/drop_monitor.c b/net/core/drop_monitor.c
index 8e33cec9fc4e..8049bff05abd 100644
--- a/net/core/drop_monitor.c
+++ b/net/core/drop_monitor.c
@@ -30,6 +30,7 @@
 #include <net/genetlink.h>
 #include <net/netevent.h>
 #include <net/flow_offload.h>
+#include <net/sock.h>
 
 #include <trace/events/skb.h>
 #include <trace/events/napi.h>
@@ -46,6 +47,7 @@
  */
 static int trace_state = TRACE_OFF;
 static bool monitor_hw;
+struct net_device *interface;
 
 /* net_dm_mutex
  *
@@ -220,9 +222,8 @@ static void trace_drop_common(struct sk_buff *skb, void *location)
 	struct per_cpu_dm_data *data;
 	unsigned long flags;
 
-	local_irq_save(flags);
+	spin_lock_irqsave(&data->lock, flags);
 	data = this_cpu_ptr(&dm_cpu_data);
-	spin_lock(&data->lock);
 	dskb = data->skb;
 
 	if (!dskb)
@@ -255,6 +256,12 @@ static void trace_drop_common(struct sk_buff *skb, void *location)
 
 out:
 	spin_unlock_irqrestore(&data->lock, flags);
+
+	if (interface && interface != skb->dev) {
+		skb = skb_clone(skb, GFP_ATOMIC);
+		skb->dev = interface;
+		netif_receive_skb(skb);
+	}
 }
 
 static void trace_kfree_skb_hit(void *ignore, struct sk_buff *skb, void *location)
@@ -1315,6 +1322,63 @@ static int net_dm_cmd_trace(struct sk_buff *skb,
 	return -EOPNOTSUPP;
 }
 
+static int net_dm_interface_start(struct net *net, const char *ifname)
+{
+	struct net_device *nd;
+
+	nd = dev_get_by_name(net, ifname);
+
+	if (nd) {
+		interface = nd;
+		dev_hold(interface);
+	} else {
+		return -ENODEV;
+	}
+	return 0;
+}
+
+static int net_dm_interface_stop(struct net *net, const char *ifname)
+{
+	struct net_device *nd;
+
+	nd = dev_get_by_name(net, ifname);
+
+	if (nd) {
+		interface = nd;
+		dev_put(interface);
+	} else {
+		return -ENODEV;
+	}
+	return 0;
+}
+
+static int net_dm_cmd_ifc_trace(struct sk_buff *skb, struct genl_info *info)
+{
+	struct net *net = sock_net(skb->sk);
+	char ifname[IFNAMSIZ];
+	int rc;
+
+	memset(ifname, 0, IFNAMSIZ);
+	nla_strlcpy(ifname, info->attrs[NET_DM_ATTR_IFNAME], IFNAMSIZ - 1);
+
+	switch (info->genlhdr->cmd) {
+	case NET_DM_CMD_START_IFC:
+		rc = net_dm_interface_start(net, ifname);
+		if (rc)
+			return rc;
+		break;
+	case NET_DM_CMD_STOP_IFC:
+		if (interface) {
+			rc = net_dm_interface_stop(net, interface->ifname);
+			return rc;
+		} else {
+			return -ENODEV;
+		}
+	}
+
+	return 0;
+}
+
 static int net_dm_config_fill(struct sk_buff *msg, struct genl_info *info)
 {
 	void *hdr;
@@ -1543,6 +1607,7 @@ static const struct nla_policy net_dm_nl_policy[NET_DM_ATTR_MAX + 1] = {
 	[NET_DM_ATTR_QUEUE_LEN] = { .type = NLA_U32 },
 	[NET_DM_ATTR_SW_DROPS]	= {. type = NLA_FLAG },
 	[NET_DM_ATTR_HW_DROPS]	= {. type = NLA_FLAG },
+	[NET_DM_ATTR_IFNAME] = {. type = NLA_STRING, .len = IFNAMSIZ },
 };
 
 static const struct genl_ops dropmon_ops[] = {
@@ -1570,6 +1635,16 @@ static const struct genl_ops dropmon_ops[] = {
 		.cmd = NET_DM_CMD_STATS_GET,
 		.doit = net_dm_cmd_stats_get,
 	},
+	{
+		.cmd = NET_DM_CMD_START_IFC,
+		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
+		.doit = net_dm_cmd_ifc_trace,
+	},
+	{
+		.cmd = NET_DM_CMD_STOP_IFC,
+		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
+		.doit = net_dm_cmd_ifc_trace,
+	},
 };
 
 static int net_dm_nl_pre_doit(const struct genl_ops *ops,
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
