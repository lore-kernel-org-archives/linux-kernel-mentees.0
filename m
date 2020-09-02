Return-Path: <SRS0=1JxM=CL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5F6C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Sep 2020 17:16:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 635E920684
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Sep 2020 17:16:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uPKBAXBN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 635E920684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2A00E80D09;
	Wed,  2 Sep 2020 17:16:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jvi+GcjXrIJE; Wed,  2 Sep 2020 17:16:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 88D5E80D01;
	Wed,  2 Sep 2020 17:16:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73995C0052;
	Wed,  2 Sep 2020 17:16:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6C57C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Sep 2020 17:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B4D8B85EC1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Sep 2020 17:16:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hCa4giYp4Vqz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Sep 2020 17:16:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 87CFF85593
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Sep 2020 17:16:09 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g4so222052wrs.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 02 Sep 2020 10:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4LLYwCw24RfzCKq+wMRj1V4jGhNeafVsoI0HV+QRwuY=;
 b=uPKBAXBNoL0iLAiWUbV3Sbjhv8JvpDSzN9N7O8IymWzAI8YFuqTqcjA00h+hvBCx8c
 s5nZae74aSKp6ajA2VK0yK7oBJYb1xTi9uHPA0y9OS8wwrSB13RhuK0wINNRWzuZa+NB
 Ua296dlnyYAANcmPAw+Bjnaym0TtKPQeGsMhHxc3GZZP+CcTJVuoWMnl1k27f6dyw87l
 1niCmk0pzFxAfpxT1Il+hMTi1HRhLZqnma6UDC1ES+61H/tcyxuiZvA/3DOwU5e5K5Y6
 pRAW7k72QxnwKCPzHtcP0Is3jDkXPi7buN/gZ1R5KIDWNF9VDCIEBRsDLKCu1HMVPlCw
 1Jlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4LLYwCw24RfzCKq+wMRj1V4jGhNeafVsoI0HV+QRwuY=;
 b=SKtotZHoK0Rn1VeC93qpPVLRZJV4X85hrrE5+WaxpPDdktmefqEav12u9BFU2DJy0u
 w/wC893ZC8WYSmtHq0UURAqnfQiJ89XI9c0AzS1R541eUdztJMeLwc0l473OL8Vi7eSD
 EnbW86Uj2KZvW5Gat1vLFYxil6SYpAeCH1qSXjg1KIIN78S69WvspdSv7EhEJJfXc+aa
 cA5huuzvhvhAnSsaOismPgq0XiKlpUzoLJz1QJOZZqfK4/oLHQLCkye25vm9OYqjlbda
 VVgogqrQCq/esGP39KGp9WkYistBkDUuNZu0Om94BK3fuQ8vh+qJtUN9/uv88IWRUtTD
 svpA==
X-Gm-Message-State: AOAM531xdC66daFslD27NwoFVP5CnLwXmxKowuFaH8YiW6CghpqSi/ee
 OE2ef2LdWBH4yl3YDfMvzuY=
X-Google-Smtp-Source: ABdhPJxu766bthkwM9TMHb16LEgohw9EhUweJm4wZ9JfQptKSCgaJarddaZb8fMX3WLsIrR62d5pEg==
X-Received: by 2002:a5d:6343:: with SMTP id b3mr8672661wrw.179.1599066967930; 
 Wed, 02 Sep 2020 10:16:07 -0700 (PDT)
Received: from localhost.localdomain ([185.200.214.168])
 by smtp.gmail.com with ESMTPSA id u66sm397122wmg.44.2020.09.02.10.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 10:16:06 -0700 (PDT)
From: izabela.bakollari@gmail.com
To: nhorman@tuxdriver.com,
	davem@davemloft.net,
	kuba@kernel.org
Date: Wed,  2 Sep 2020 19:16:04 +0200
Message-Id: <20200902171604.109864-1-izabela.bakollari@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200707171515.110818-1-izabela.bakollari@gmail.com>
References: <20200707171515.110818-1-izabela.bakollari@gmail.com>
Cc: netdev@vger.kernel.org, izabela.bakollari@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCHv3 net-next] dropwatch: Support
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
Changes in v3:
- Name the cloned skb "nskb"
- Remove the error log
- Change coding style in some if statements
---
 include/uapi/linux/net_dropmon.h |  3 ++
 net/core/drop_monitor.c          | 80 ++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+)

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
index 8e33cec9fc4e..ae5ed70b6b2a 100644
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
@@ -54,6 +56,8 @@ static bool monitor_hw;
  */
 static DEFINE_MUTEX(net_dm_mutex);
 
+static DEFINE_SPINLOCK(interface_lock);
+
 struct net_dm_stats {
 	u64 dropped;
 	struct u64_stats_sync syncp;
@@ -217,6 +221,7 @@ static void trace_drop_common(struct sk_buff *skb, void *location)
 	struct nlattr *nla;
 	int i;
 	struct sk_buff *dskb;
+	struct sk_buff *nskb;
 	struct per_cpu_dm_data *data;
 	unsigned long flags;
 
@@ -255,6 +260,18 @@ static void trace_drop_common(struct sk_buff *skb, void *location)
 
 out:
 	spin_unlock_irqrestore(&data->lock, flags);
+	spin_lock_irqsave(&interface_lock, flags);
+	nskb = skb_clone(skb, GFP_ATOMIC);
+	if (!nskb) {
+		spin_unlock_irqrestore(&interface_lock, flags);
+		return;
+	} else if (interface && interface != nskb->dev) {
+		nskb->dev = interface;
+		spin_unlock_irqrestore(&interface_lock, flags);
+		netif_receive_skb(nskb);
+	} else {
+		spin_unlock_irqrestore(&interface_lock, flags);
+	}
 }
 
 static void trace_kfree_skb_hit(void *ignore, struct sk_buff *skb, void *location)
@@ -1315,6 +1332,51 @@ static int net_dm_cmd_trace(struct sk_buff *skb,
 	return -EOPNOTSUPP;
 }
 
+static int net_dm_interface_start(struct net *net, const char *ifname)
+{
+	struct net_device *nd = dev_get_by_name(net, ifname);
+
+	if (!nd)
+		return -ENODEV;
+
+	interface = nd;
+
+	return 0;
+}
+
+static int net_dm_interface_stop(struct net *net, const char *ifname)
+{
+	dev_put(interface);
+	interface = NULL;
+
+	return 0;
+}
+
+static int net_dm_cmd_ifc_trace(struct sk_buff *skb, struct genl_info *info)
+{
+	struct net *net = sock_net(skb->sk);
+	char ifname[IFNAMSIZ];
+
+	if (net_dm_is_monitoring())
+		return -EBUSY;
+
+	memset(ifname, 0, IFNAMSIZ);
+	nla_strlcpy(ifname, info->attrs[NET_DM_ATTR_IFNAME], IFNAMSIZ - 1);
+
+	switch (info->genlhdr->cmd) {
+	case NET_DM_CMD_START_IFC:
+		if (interface)
+			return -EBUSY;
+		return net_dm_interface_start(net, ifname);
+	case NET_DM_CMD_STOP_IFC:
+		if (!interface)
+			return -ENODEV;
+		return net_dm_interface_stop(net, interface->name);
+	}
+
+	return 0;
+}
+
 static int net_dm_config_fill(struct sk_buff *msg, struct genl_info *info)
 {
 	void *hdr;
@@ -1503,6 +1565,7 @@ static int dropmon_net_event(struct notifier_block *ev_block,
 	struct net_device *dev = netdev_notifier_info_to_dev(ptr);
 	struct dm_hw_stat_delta *new_stat = NULL;
 	struct dm_hw_stat_delta *tmp;
+	unsigned long flags;
 
 	switch (event) {
 	case NETDEV_REGISTER:
@@ -1529,6 +1592,12 @@ static int dropmon_net_event(struct notifier_block *ev_block,
 				}
 			}
 		}
+		spin_lock_irqsave(&interface_lock, flags);
+		if (interface && interface == dev) {
+			dev_put(interface);
+			interface = NULL;
+		}
+		spin_unlock_irqrestore(&interface_lock, flags);
 		mutex_unlock(&net_dm_mutex);
 		break;
 	}
@@ -1543,6 +1612,7 @@ static const struct nla_policy net_dm_nl_policy[NET_DM_ATTR_MAX + 1] = {
 	[NET_DM_ATTR_QUEUE_LEN] = { .type = NLA_U32 },
 	[NET_DM_ATTR_SW_DROPS]	= {. type = NLA_FLAG },
 	[NET_DM_ATTR_HW_DROPS]	= {. type = NLA_FLAG },
+	[NET_DM_ATTR_IFNAME] = {. type = NLA_STRING, .len = IFNAMSIZ },
 };
 
 static const struct genl_ops dropmon_ops[] = {
@@ -1570,6 +1640,16 @@ static const struct genl_ops dropmon_ops[] = {
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
