Return-Path: <SRS0=1JxM=CL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F261FC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Sep 2020 20:35:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C186C20767
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Sep 2020 20:35:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UkXei5RI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C186C20767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9704620521;
	Wed,  2 Sep 2020 20:35:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sKl0grmHmnHq; Wed,  2 Sep 2020 20:35:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 970BE2043B;
	Wed,  2 Sep 2020 20:35:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B010C07FF;
	Wed,  2 Sep 2020 20:35:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A74FAC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Sep 2020 20:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8F1EA86AE8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Sep 2020 20:35:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h4TPp7CtAFrn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Sep 2020 20:35:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5BB0886AD2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Sep 2020 20:35:05 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id l9so680306wme.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 02 Sep 2020 13:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HIxWngPr+sR5zV2PQU9/b6GK/O7pBr4xcIJNAOB++EE=;
 b=UkXei5RIwuT7P869JaZz0aPmRfdwyZgc3exQJoyGoQbcS2BRfO1aHWcpBPlHHZSbvB
 CcXd9M61OaTXzV9/55jABkdzV2S6SSuuNmlKLn8ctTNz4+Nah/6hqdfdbgWhBOSFkOp2
 POPbt0ODgeqNnG/gEvoceMpkHONf30EbnT89fj68grdnI9EpkIDsdM4cDn2jRFxoBcJM
 5M8ZZP4x3uHgnKrN5+JYtzUmQpW/WesWlY2hXHE79FzF6ujQenDhWn2LL4MTk8jlEib2
 OiG0nkfOLXk/ypJOItTd3cF6ZxYXm4ndTo3QGaHlInYyNkaJlR9AieT7ZwSmemqnmmZ5
 3V9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HIxWngPr+sR5zV2PQU9/b6GK/O7pBr4xcIJNAOB++EE=;
 b=ARmxsUPuP9DGTM2VB2BkMR5t8VHI4gLZloPkmydqPzMG/a8HBe+6F6nbIIstBj2uDe
 CL4G6iO3D/D0EAD5l2gGp/o/Djr6SIUV3LVYfJB16z1HQqzRQpQGgtJPuUCSCRUl8DB0
 QnvNDbNgMVXOp8Vn7zUktfW0i+E2u5jcIyukqpXL20Xsrg+cICl+g3ttaoJOn4bE4kKu
 VZXW+W9uQ/wF4jkU2CYuoFHpzn1MNpwmCOnH7c4DGiQsCnC1YVOHKSYSTpZJHpxqIX0Q
 PHW7nPZbb40560Tgb4+K09tPnhozDdoSmL4Zc3GwhQfG3EErvJcA+aTSt/rDHZINQy3o
 9P6Q==
X-Gm-Message-State: AOAM531bYoI3ToULEE0W5pA5qJaRZtlCY4wEWje/s8Pgors/P5blZXfr
 f/60XOWgRGN1bYc+xlosOZ2WnSE2neo=
X-Google-Smtp-Source: ABdhPJxVc66FmTb2h7qoW8xOK78Hvnc2OJIxFP0wblEH8E56zZE45GVoHbq53auIN5dCgQa+3DCadg==
X-Received: by 2002:a1c:988d:: with SMTP id a135mr2318472wme.8.1599078903279; 
 Wed, 02 Sep 2020 13:35:03 -0700 (PDT)
Received: from [192.168.8.147] ([37.171.70.17])
 by smtp.gmail.com with ESMTPSA id b76sm1034586wme.45.2020.09.02.13.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 13:35:02 -0700 (PDT)
To: izabela.bakollari@gmail.com, nhorman@tuxdriver.com, davem@davemloft.net,
 kuba@kernel.org
References: <20200707171515.110818-1-izabela.bakollari@gmail.com>
 <20200902171604.109864-1-izabela.bakollari@gmail.com>
From: Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <0b27311f-6836-45e8-6bb3-d741d37d135b@gmail.com>
Date: Wed, 2 Sep 2020 22:35:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200902171604.109864-1-izabela.bakollari@gmail.com>
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCHv3 net-next] dropwatch: Support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>



On 9/2/20 10:16 AM, izabela.bakollari@gmail.com wrote:
> From: Izabela Bakollari <izabela.bakollari@gmail.com>
> 
> Dropwatch is a utility that monitors dropped frames by having userspace
> record them over the dropwatch protocol over a file. This augument
> allows live monitoring of dropped frames using tools like tcpdump.
> 
> With this feature, dropwatch allows two additional commands (start and
> stop interface) which allows the assignment of a net_device to the
> dropwatch protocol. When assinged, dropwatch will clone dropped frames,
> and receive them on the assigned interface, allowing tools like tcpdump
> to monitor for them.
> 
> With this feature, create a dummy ethernet interface (ip link add dev
> dummy0 type dummy), assign it to the dropwatch kernel subsystem, by using
> these new commands, and then monitor dropped frames in real time by
> running tcpdump -i dummy0.
> 
> Signed-off-by: Izabela Bakollari <izabela.bakollari@gmail.com>
> ---
> Changes in v3:
> - Name the cloned skb "nskb"
> - Remove the error log
> - Change coding style in some if statements
> ---
>  include/uapi/linux/net_dropmon.h |  3 ++
>  net/core/drop_monitor.c          | 80 ++++++++++++++++++++++++++++++++
>  2 files changed, 83 insertions(+)
> 
> diff --git a/include/uapi/linux/net_dropmon.h b/include/uapi/linux/net_dropmon.h
> index 67e31f329190..e8e861e03a8a 100644
> --- a/include/uapi/linux/net_dropmon.h
> +++ b/include/uapi/linux/net_dropmon.h
> @@ -58,6 +58,8 @@ enum {
>  	NET_DM_CMD_CONFIG_NEW,
>  	NET_DM_CMD_STATS_GET,
>  	NET_DM_CMD_STATS_NEW,
> +	NET_DM_CMD_START_IFC,
> +	NET_DM_CMD_STOP_IFC,
>  	_NET_DM_CMD_MAX,
>  };
>  
> @@ -93,6 +95,7 @@ enum net_dm_attr {
>  	NET_DM_ATTR_SW_DROPS,			/* flag */
>  	NET_DM_ATTR_HW_DROPS,			/* flag */
>  	NET_DM_ATTR_FLOW_ACTION_COOKIE,		/* binary */
> +	NET_DM_ATTR_IFNAME,			/* string */
>  
>  	__NET_DM_ATTR_MAX,
>  	NET_DM_ATTR_MAX = __NET_DM_ATTR_MAX - 1
> diff --git a/net/core/drop_monitor.c b/net/core/drop_monitor.c
> index 8e33cec9fc4e..ae5ed70b6b2a 100644
> --- a/net/core/drop_monitor.c
> +++ b/net/core/drop_monitor.c
> @@ -30,6 +30,7 @@
>  #include <net/genetlink.h>
>  #include <net/netevent.h>
>  #include <net/flow_offload.h>
> +#include <net/sock.h>
>  
>  #include <trace/events/skb.h>
>  #include <trace/events/napi.h>
> @@ -46,6 +47,7 @@
>   */
>  static int trace_state = TRACE_OFF;
>  static bool monitor_hw;
> +struct net_device *interface;
>  
>  /* net_dm_mutex
>   *
> @@ -54,6 +56,8 @@ static bool monitor_hw;
>   */
>  static DEFINE_MUTEX(net_dm_mutex);
>  
> +static DEFINE_SPINLOCK(interface_lock);
> +
>  struct net_dm_stats {
>  	u64 dropped;
>  	struct u64_stats_sync syncp;
> @@ -217,6 +221,7 @@ static void trace_drop_common(struct sk_buff *skb, void *location)
>  	struct nlattr *nla;
>  	int i;
>  	struct sk_buff *dskb;
> +	struct sk_buff *nskb;
>  	struct per_cpu_dm_data *data;
>  	unsigned long flags;
>  
> @@ -255,6 +260,18 @@ static void trace_drop_common(struct sk_buff *skb, void *location)
>  
>  out:
>  	spin_unlock_irqrestore(&data->lock, flags);
> +	spin_lock_irqsave(&interface_lock, flags);
> +	nskb = skb_clone(skb, GFP_ATOMIC);

1) Why calling skb_clone() if @interface is NULL ?


> +	if (!nskb) {
> +		spin_unlock_irqrestore(&interface_lock, flags);
> +		return;
> +	} else if (interface && interface != nskb->dev) {

2) Since there is no check about @interface being a dummy device,
it seems possible for a malicious user to set up another virtual
device (like bonding) so that the "interface != nskb->dev"  test
wont be able to detect a loop.

We could therefore have an infinite loop.


> +		nskb->dev = interface;
> +		spin_unlock_irqrestore(&interface_lock, flags);
> +		netif_receive_skb(nskb);



> +	} else {

 3)  nskb seems to be leaked here ? See point 1)

> +		spin_unlock_irqrestore(&interface_lock, flags);
> +	}
>  }
>  
>  static void trace_kfree_skb_hit(void *ignore, struct sk_buff *skb, void *location)
> @@ -1315,6 +1332,51 @@ static int net_dm_cmd_trace(struct sk_buff *skb,
>  	return -EOPNOTSUPP;
>  }
>  
> +static int net_dm_interface_start(struct net *net, const char *ifname)
> +{
> +	struct net_device *nd = dev_get_by_name(net, ifname);
> +
> +	if (!nd)
> +		return -ENODEV;
> +
> +	interface = nd;
> +
> +	return 0;
> +}
> +
> +static int net_dm_interface_stop(struct net *net, const char *ifname)
> +{
> +	dev_put(interface);
> +	interface = NULL;
> +
> +	return 0;
> +}
> +
> +static int net_dm_cmd_ifc_trace(struct sk_buff *skb, struct genl_info *info)
> +{
> +	struct net *net = sock_net(skb->sk);
> +	char ifname[IFNAMSIZ];
> +
> +	if (net_dm_is_monitoring())
> +		return -EBUSY;
> +
> +	memset(ifname, 0, IFNAMSIZ);
> +	nla_strlcpy(ifname, info->attrs[NET_DM_ATTR_IFNAME], IFNAMSIZ - 1);

4) info->attrs[NET_DM_ATTR_IFNAME] could be NULL at this point.

> +
> +	switch (info->genlhdr->cmd) {
> +	case NET_DM_CMD_START_IFC:

5) interface_lock is not held, this seems racy.

> +		if (interface)
> +			return -EBUSY;
> +		return net_dm_interface_start(net, ifname);
> +	case NET_DM_CMD_STOP_IFC:

6) interface_lock is not held, this seems racy.
> +		if (!interface)
> +			return -ENODEV;
> +		return net_dm_interface_stop(net, interface->name);
> +	}
> +
> +	return 0;
> +}
> +
>  static int net_dm_config_fill(struct sk_buff *msg, struct genl_info *info)
>  {
>  	void *hdr;
> @@ -1503,6 +1565,7 @@ static int dropmon_net_event(struct notifier_block *ev_block,
>  	struct net_device *dev = netdev_notifier_info_to_dev(ptr);
>  	struct dm_hw_stat_delta *new_stat = NULL;
>  	struct dm_hw_stat_delta *tmp;
> +	unsigned long flags;
>  
>  	switch (event) {
>  	case NETDEV_REGISTER:
> @@ -1529,6 +1592,12 @@ static int dropmon_net_event(struct notifier_block *ev_block,
>  				}
>  			}
>  		}
> +		spin_lock_irqsave(&interface_lock, flags);
> +		if (interface && interface == dev) {
> +			dev_put(interface);
> +			interface = NULL;
> +		}
> +		spin_unlock_irqrestore(&interface_lock, flags);
>  		mutex_unlock(&net_dm_mutex);
>  		break;
>  	}
> @@ -1543,6 +1612,7 @@ static const struct nla_policy net_dm_nl_policy[NET_DM_ATTR_MAX + 1] = {
>  	[NET_DM_ATTR_QUEUE_LEN] = { .type = NLA_U32 },
>  	[NET_DM_ATTR_SW_DROPS]	= {. type = NLA_FLAG },
>  	[NET_DM_ATTR_HW_DROPS]	= {. type = NLA_FLAG },
> +	[NET_DM_ATTR_IFNAME] = {. type = NLA_STRING, .len = IFNAMSIZ },
>  };
>  
>  static const struct genl_ops dropmon_ops[] = {
> @@ -1570,6 +1640,16 @@ static const struct genl_ops dropmon_ops[] = {
>  		.cmd = NET_DM_CMD_STATS_GET,
>  		.doit = net_dm_cmd_stats_get,
>  	},
> +	{
> +		.cmd = NET_DM_CMD_START_IFC,
> +		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
> +		.doit = net_dm_cmd_ifc_trace,
> +	},
> +	{
> +		.cmd = NET_DM_CMD_STOP_IFC,
> +		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
> +		.doit = net_dm_cmd_ifc_trace,
> +	},
>  };
>  
>  static int net_dm_nl_pre_doit(const struct genl_ops *ops,
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
