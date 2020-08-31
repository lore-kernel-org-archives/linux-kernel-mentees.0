Return-Path: <SRS0=Gq3P=CJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB861C433E6
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Aug 2020 13:18:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92F612073A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Aug 2020 13:18:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZcZGI7MG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92F612073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 74768844D6;
	Mon, 31 Aug 2020 13:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5yOis3Z2Cgae; Mon, 31 Aug 2020 13:18:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 12F25844BC;
	Mon, 31 Aug 2020 13:18:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EFC88C0052;
	Mon, 31 Aug 2020 13:18:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78E9AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 13:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7415187371
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 13:18:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hBlWMnykHMkH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 13:18:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E8B118731E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 13:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598879903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0o6bclwuKSh0fyVGfM/hWIeUd3ILyiWt6k5DL+CCfI=;
 b=ZcZGI7MGaGMzUn7wN6JYOudYVC6rV+dw+XUp6YZqn4JFBbwL0ghCQnpgLevDDUfOG2xlZR
 +TI28uczRfcT4+R5R6rA7xl5YljamgdyV84iMjMgRkVofjfrQ1Vbawg2EDgRQ8ZqGfM9MY
 6rsyIf3C4Rh67oc4IzdcbYIHW1+Vr8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-SZorX-3YPXyNFmO4BLCvPQ-1; Mon, 31 Aug 2020 09:18:21 -0400
X-MC-Unique: SZorX-3YPXyNFmO4BLCvPQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFE2C1074641;
 Mon, 31 Aug 2020 13:18:19 +0000 (UTC)
Received: from [10.40.193.137] (unknown [10.40.193.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C40B85C22D;
 Mon, 31 Aug 2020 13:18:17 +0000 (UTC)
To: izabela.bakollari@gmail.com
References: <20200707171515.110818-1-izabela.bakollari@gmail.com>
 <20200804160908.46193-1-izabela.bakollari@gmail.com>
From: Michal Schmidt <mschmidt@redhat.com>
Message-ID: <e971a990-4c92-9d64-8bc6-61516d874370@redhat.com>
Date: Mon, 31 Aug 2020 15:18:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200804160908.46193-1-izabela.bakollari@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: nhorman@tuxdriver.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kuba@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Dne 04. 08. 20 v 18:09 izabela.bakollari@gmail.com napsala:
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
>   include/uapi/linux/net_dropmon.h |  3 ++
>   net/core/drop_monitor.c          | 84 ++++++++++++++++++++++++++++++++
>   2 files changed, 87 insertions(+)
[...]
> @@ -255,6 +259,21 @@ static void trace_drop_common(struct sk_buff *skb, void *location)
>   
>   out:
>   	spin_unlock_irqrestore(&data->lock, flags);
> +	spin_lock_irqsave(&interface_lock, flags);
> +	if (interface && interface != skb->dev) {
> +		skb = skb_clone(skb, GFP_ATOMIC);

I suggest naming the cloned skb "nskb". Less potential for confusion 
that way.

> +		if (skb) {
> +			skb->dev = interface;
> +			spin_unlock_irqrestore(&interface_lock, flags);
> +			netif_receive_skb(skb);
> +		} else {
> +			spin_unlock_irqrestore(&interface_lock, flags);
> +			pr_err("dropwatch: Not enough memory to clone dropped skb\n");

Maybe avoid logging the error here. In NET_DM_ALERT_MODE_PACKET mode, 
drop monitor does not log about the skb_clone() failure either.
We don't want to open the possibility to flood the logs in case this 
somehow gets triggered by every packet.

A coding style suggestion - can you rearrange it so that the error path 
code is spelled out first? Then the regular path does not have to be 
indented further:

       nskb = skb_clone(skb, GFP_ATOMIC);
       if (!nskb) {
               spin_unlock_irqrestore(&interface_lock, flags);
               return;
       }

       /* ... implicit else ... Proceed normally ... */

> +			return;
> +		}
> +	} else {
> +		spin_unlock_irqrestore(&interface_lock, flags);
> +	}
>   }
>   
>   static void trace_kfree_skb_hit(void *ignore, struct sk_buff *skb, void *location)
> @@ -1315,6 +1334,53 @@ static int net_dm_cmd_trace(struct sk_buff *skb,
>   	return -EOPNOTSUPP;
>   }
>   
> +static int net_dm_interface_start(struct net *net, const char *ifname)
> +{
> +	struct net_device *nd = dev_get_by_name(net, ifname);
> +
> +	if (nd)
> +		interface = nd;
> +	else
> +		return -ENODEV;
> +
> +	return 0;

Similarly here, consider:

   if (!nd)
           return -ENODEV;

   interface = nd;
   return 0;

But maybe I'm nitpicking ...

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
> +
> +	switch (info->genlhdr->cmd) {
> +	case NET_DM_CMD_START_IFC:
> +		if (!interface)
> +			return net_dm_interface_start(net, ifname);
> +		else
> +			return -EBUSY;
> +	case NET_DM_CMD_STOP_IFC:
> +		if (interface)
> +			return net_dm_interface_stop(net, interface->name);
> +		else
> +			return -ENODEV;

... and here too.

Best regards,
Michal

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
