Return-Path: <SRS0=Vbn0=BU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FA1C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 13:39:56 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33ABC20729
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 13:39:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGnt1MgL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33ABC20729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D05AC890D4;
	Mon, 10 Aug 2020 13:39:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pn6mJTMtHIgb; Mon, 10 Aug 2020 13:39:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 28D6C87D99;
	Mon, 10 Aug 2020 13:39:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F394C0864;
	Mon, 10 Aug 2020 13:39:55 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 997AFC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 13:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 828598827F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 13:39:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qFtI7IgCyfKM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 13:39:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5B35788262
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 13:39:53 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 9so7645243wmj.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 06:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wQXwole3kTB9zcN+Pyn4hxfuw4dEOY8H2tP6VlLvClg=;
 b=UGnt1MgLcFklXEgt21yPcO9J2LBO09KqZ7e4pMxSZyA/1fsWJ/qHfpQgLQ4rL3dVWq
 USIUYWuG9mnKroSkHXMbpyfiEWz6Mssx4vA+VVTOZt37vhp6S7ATynyaUfoyJpOGZAgN
 pMu1erKTdM3pwcsTj/mIO6G8EOTUaFFXW/bu9ucB6c9K2+6TSARJKAiO3crMf3GABagn
 7vIbK2UjQsoQ6jU5lrQr1ECSd37svqquz8FkOrU5sKoQw1R9Laxr6MU8KVxN3MUhViQB
 UrCtRXz9ovaXHWBLWOaLJKWxjE3ER9hGE/2yZl/K6Pn+4ixweB8p5FpkL1UDPMqxbE2D
 Jk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wQXwole3kTB9zcN+Pyn4hxfuw4dEOY8H2tP6VlLvClg=;
 b=dR7e5SS4vW8W006RzKO3WTzi5RgDw2kOjjo1OS47dR021UFDpfcCQbfukt+07W9uWf
 r3gqd+M9haBTsvpwjIJYB0Y+0cIIn/jy1icypvUqGoEQfFNshA9vg8xJ9ndhQ0L2ALNm
 qrz8FW1CdjslFqQ1fFlWgmYS6nLbMF9oGPxNZXNfxUUXNRbPqtPAzvGGFHYRLeqSa4OP
 12FhLlUCB9MHgfT9wH8OyRu5/T5nnlZj5FxSW36j45Mjvz/5UG8RU9A/of4X0rZRxlpa
 w0n+X9VaZDGOg9gg2Id8HHBpiGfMZxIrJeDI+WyiXZi2ED/vEhFlVl38H7sp4QBD81vm
 fnmw==
X-Gm-Message-State: AOAM5315WZWedYXkEfGtZC+qpFep/5yKvV1efIEvtUZrLpp9Ck/29fnW
 QmvvdPgsS71Q2Dluac/qsWd2GvfKoj7hsCD7neY=
X-Google-Smtp-Source: ABdhPJxoIZ6cFJfjs2hzWYJ8isoQGnGHikI77YeyYsFLqv+3ARhlck53r9n5aTVgTLdWDXt7w/KZciN5IKSwT1EYf/0=
X-Received: by 2002:a1c:96d7:: with SMTP id y206mr25026001wmd.9.1597066791786; 
 Mon, 10 Aug 2020 06:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200707171515.110818-1-izabela.bakollari@gmail.com>
 <20200804160908.46193-1-izabela.bakollari@gmail.com>
In-Reply-To: <20200804160908.46193-1-izabela.bakollari@gmail.com>
From: Izabela Bakollari <izabela.bakollari@gmail.com>
Date: Mon, 10 Aug 2020 15:39:40 +0200
Message-ID: <CAC8tkWDuvz3HQDp=Bb-Sfgiks1ETG-j1SMFn6O2nhyzYL5Cc8Q@mail.gmail.com>
To: nhorman@tuxdriver.com, davem@davemloft.net, kuba@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCHv2 net-next] dropwatch: Support
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

I have worked on this feature as part of the Linux Kernel Mentorship
Program. Your review would really help me in this learning process.

Thanks,
Izabela

On Tue, Aug 4, 2020 at 6:09 PM <izabela.bakollari@gmail.com> wrote:
>
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
> Changes in v2:
> - protect the dummy ethernet interface from being changed by another
> thread/cpu
> ---
>  include/uapi/linux/net_dropmon.h |  3 ++
>  net/core/drop_monitor.c          | 84 ++++++++++++++++++++++++++++++++
>  2 files changed, 87 insertions(+)
>
> diff --git a/include/uapi/linux/net_dropmon.h b/include/uapi/linux/net_dropmon.h
> index 67e31f329190..e8e861e03a8a 100644
> --- a/include/uapi/linux/net_dropmon.h
> +++ b/include/uapi/linux/net_dropmon.h
> @@ -58,6 +58,8 @@ enum {
>         NET_DM_CMD_CONFIG_NEW,
>         NET_DM_CMD_STATS_GET,
>         NET_DM_CMD_STATS_NEW,
> +       NET_DM_CMD_START_IFC,
> +       NET_DM_CMD_STOP_IFC,
>         _NET_DM_CMD_MAX,
>  };
>
> @@ -93,6 +95,7 @@ enum net_dm_attr {
>         NET_DM_ATTR_SW_DROPS,                   /* flag */
>         NET_DM_ATTR_HW_DROPS,                   /* flag */
>         NET_DM_ATTR_FLOW_ACTION_COOKIE,         /* binary */
> +       NET_DM_ATTR_IFNAME,                     /* string */
>
>         __NET_DM_ATTR_MAX,
>         NET_DM_ATTR_MAX = __NET_DM_ATTR_MAX - 1
> diff --git a/net/core/drop_monitor.c b/net/core/drop_monitor.c
> index 8e33cec9fc4e..781e69876d2f 100644
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
>         u64 dropped;
>         struct u64_stats_sync syncp;
> @@ -255,6 +259,21 @@ static void trace_drop_common(struct sk_buff *skb, void *location)
>
>  out:
>         spin_unlock_irqrestore(&data->lock, flags);
> +       spin_lock_irqsave(&interface_lock, flags);
> +       if (interface && interface != skb->dev) {
> +               skb = skb_clone(skb, GFP_ATOMIC);
> +               if (skb) {
> +                       skb->dev = interface;
> +                       spin_unlock_irqrestore(&interface_lock, flags);
> +                       netif_receive_skb(skb);
> +               } else {
> +                       spin_unlock_irqrestore(&interface_lock, flags);
> +                       pr_err("dropwatch: Not enough memory to clone dropped skb\n");
> +                       return;
> +               }
> +       } else {
> +               spin_unlock_irqrestore(&interface_lock, flags);
> +       }
>  }
>
>  static void trace_kfree_skb_hit(void *ignore, struct sk_buff *skb, void *location)
> @@ -1315,6 +1334,53 @@ static int net_dm_cmd_trace(struct sk_buff *skb,
>         return -EOPNOTSUPP;
>  }
>
> +static int net_dm_interface_start(struct net *net, const char *ifname)
> +{
> +       struct net_device *nd = dev_get_by_name(net, ifname);
> +
> +       if (nd)
> +               interface = nd;
> +       else
> +               return -ENODEV;
> +
> +       return 0;
> +}
> +
> +static int net_dm_interface_stop(struct net *net, const char *ifname)
> +{
> +       dev_put(interface);
> +       interface = NULL;
> +
> +       return 0;
> +}
> +
> +static int net_dm_cmd_ifc_trace(struct sk_buff *skb, struct genl_info *info)
> +{
> +       struct net *net = sock_net(skb->sk);
> +       char ifname[IFNAMSIZ];
> +
> +       if (net_dm_is_monitoring())
> +               return -EBUSY;
> +
> +       memset(ifname, 0, IFNAMSIZ);
> +       nla_strlcpy(ifname, info->attrs[NET_DM_ATTR_IFNAME], IFNAMSIZ - 1);
> +
> +       switch (info->genlhdr->cmd) {
> +       case NET_DM_CMD_START_IFC:
> +               if (!interface)
> +                       return net_dm_interface_start(net, ifname);
> +               else
> +                       return -EBUSY;
> +       case NET_DM_CMD_STOP_IFC:
> +               if (interface)
> +                       return net_dm_interface_stop(net, interface->name);
> +               else
> +                       return -ENODEV;
> +       }
> +
> +       return 0;
> +}
> +
>  static int net_dm_config_fill(struct sk_buff *msg, struct genl_info *info)
>  {
>         void *hdr;
> @@ -1503,6 +1569,7 @@ static int dropmon_net_event(struct notifier_block *ev_block,
>         struct net_device *dev = netdev_notifier_info_to_dev(ptr);
>         struct dm_hw_stat_delta *new_stat = NULL;
>         struct dm_hw_stat_delta *tmp;
> +       unsigned long flags;
>
>         switch (event) {
>         case NETDEV_REGISTER:
> @@ -1529,6 +1596,12 @@ static int dropmon_net_event(struct notifier_block *ev_block,
>                                 }
>                         }
>                 }
> +               spin_lock_irqsave(&interface_lock, flags);
> +               if (interface && interface == dev) {
> +                       dev_put(interface);
> +                       interface = NULL;
> +               }
> +               spin_unlock_irqrestore(&interface_lock, flags);
>                 mutex_unlock(&net_dm_mutex);
>                 break;
>         }
> @@ -1543,6 +1616,7 @@ static const struct nla_policy net_dm_nl_policy[NET_DM_ATTR_MAX + 1] = {
>         [NET_DM_ATTR_QUEUE_LEN] = { .type = NLA_U32 },
>         [NET_DM_ATTR_SW_DROPS]  = {. type = NLA_FLAG },
>         [NET_DM_ATTR_HW_DROPS]  = {. type = NLA_FLAG },
> +       [NET_DM_ATTR_IFNAME] = {. type = NLA_STRING, .len = IFNAMSIZ },
>  };
>
>  static const struct genl_ops dropmon_ops[] = {
> @@ -1570,6 +1644,16 @@ static const struct genl_ops dropmon_ops[] = {
>                 .cmd = NET_DM_CMD_STATS_GET,
>                 .doit = net_dm_cmd_stats_get,
>         },
> +       {
> +               .cmd = NET_DM_CMD_START_IFC,
> +               .validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
> +               .doit = net_dm_cmd_ifc_trace,
> +       },
> +       {
> +               .cmd = NET_DM_CMD_STOP_IFC,
> +               .validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
> +               .doit = net_dm_cmd_ifc_trace,
> +       },
>  };
>
>  static int net_dm_nl_pre_doit(const struct genl_ops *ops,
> --
> 2.18.4
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
