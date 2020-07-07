Return-Path: <SRS0=keMi=AS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A64FC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 17:33:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D78B02075B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 17:33:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oGqcWcGz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D78B02075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 90C9987E28;
	Tue,  7 Jul 2020 17:33:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aan8qcB_6U8n; Tue,  7 Jul 2020 17:33:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 76DFA87861;
	Tue,  7 Jul 2020 17:33:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C224C07FF;
	Tue,  7 Jul 2020 17:33:56 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3DBA2C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 17:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 219F388A45
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 17:33:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BiZ1PPrPsAnE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 17:33:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 54BE68888A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 17:33:53 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id x9so3359235plr.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Jul 2020 10:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OG2UGSwTtZ3JhpHjOf9/K5Mq8nGQGxILirbLiIW7/lE=;
 b=oGqcWcGzRQP3aQKmSSrH/bX1Vqjd9YWJebkVyo71vwBL5Eb/wsWmEczRasIBhPbV1E
 M5q3e8MIbFsgK6VLQG2nRHs2BPFDj7QYWvlVigEVb8v2fsSQZWZmP+UJNqIR74jYR3iB
 CIrh0ioE7wi9DHbES0JMF4R0ET1XGg2l+lfY+Q2ppedMJPSk901K1ULEOEoYkpoVWmpw
 5yC9Jg61OiJtbFGJopPVjZitLETsWRTmvEN3beNquwv7h/y7nq+UReiC6JEEWfOEvMq9
 sRIUgrsJGpZ5eVeWg1gdwOkUGiHfa+QBS5M/VUmSDKSPOZWXbOf1fU0t9B8uJUtz+0B/
 CsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OG2UGSwTtZ3JhpHjOf9/K5Mq8nGQGxILirbLiIW7/lE=;
 b=aiQyCfq2wjAzXwIdh6KFmzC/r71lwaRI4ZrpA9+jNaSIJPCJzRbtO8PUEs/SNVLT7V
 /Zt/Nzdl1Gve6bKa+60rhgW2o4W7/1xjsf5PRqiaExUarJwxRqFM8VGfHy63tVxA7HtZ
 DmGFJlSoRXIUnztVQ0/EPtLRHuhGoI5xAdCIzr9w02Wm9xTAp+kD7Bnx+Bqu9geBynUL
 m5aBFlmDgWICErVSTk6spOUabEQlL1LvT8GliIeN66qmQKrGmPQoTuATtXvsiaIGjrBb
 M32a0ZmUqd28ze9EDTHHF0/PkKtIEDw38epE5snS56lxNlPxefdE2lB+M1UWbi/tDJ3y
 omQQ==
X-Gm-Message-State: AOAM532y7Sdo1As3RrD8yBLiTmg09AmPMX3ODLG+6deLnt+YURXP6mB7
 sntWFh/WZQnJMdcqZYqdjql0y9Jw
X-Google-Smtp-Source: ABdhPJw6mDbNYNk2zkHO904T8LdoKcgLU8JjL9z3qxqChr8Ge4i6nLV465YRGMqYh2nB2zT4RpFsUw==
X-Received: by 2002:a17:90a:ce96:: with SMTP id
 g22mr5540446pju.9.1594143232494; 
 Tue, 07 Jul 2020 10:33:52 -0700 (PDT)
Received: from [192.168.86.235] (c-73-241-150-58.hsd1.ca.comcast.net.
 [73.241.150.58])
 by smtp.gmail.com with ESMTPSA id i21sm7383950pfa.18.2020.07.07.10.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2020 10:33:51 -0700 (PDT)
To: izabela.bakollari@gmail.com, nhorman@tuxdriver.com, davem@davemloft.net,
 kuba@kernel.org
References: <20200707171515.110818-1-izabela.bakollari@gmail.com>
From: Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <8aa6bcfe-8117-0fc9-1bc5-9b6a600e0972@gmail.com>
Date: Tue, 7 Jul 2020 10:33:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200707171515.110818-1-izabela.bakollari@gmail.com>
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH net-next] dropwatch: Support
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



On 7/7/20 10:15 AM, izabela.bakollari@gmail.com wrote:
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
>  include/uapi/linux/net_dropmon.h |  3 ++
>  net/core/drop_monitor.c          | 79 +++++++++++++++++++++++++++++++-
>  2 files changed, 80 insertions(+), 2 deletions(-)
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
> index 8e33cec9fc4e..8049bff05abd 100644
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
> @@ -220,9 +222,8 @@ static void trace_drop_common(struct sk_buff *skb, void *location)
>  	struct per_cpu_dm_data *data;
>  	unsigned long flags;
>  
> -	local_irq_save(flags);
> +	spin_lock_irqsave(&data->lock, flags);
>  	data = this_cpu_ptr(&dm_cpu_data);
> -	spin_lock(&data->lock);

This change seems unrelated ?

And also buggy, since data is essentially garbage when you call spin_lock_irqsave(&data->lock, flags);

>  	dskb = data->skb;
>  
>  	if (!dskb)
> @@ -255,6 +256,12 @@ static void trace_drop_common(struct sk_buff *skb, void *location)
>  
>  out:
>  	spin_unlock_irqrestore(&data->lock, flags);
> +
> +	if (interface && interface != skb->dev) {
> +		skb = skb_clone(skb, GFP_ATOMIC);

skb_clone() can return NULL

> +		skb->dev = interface;
> +		netif_receive_skb(skb);
> +	}
>  }
>  
>  static void trace_kfree_skb_hit(void *ignore, struct sk_buff *skb, void *location)
> @@ -1315,6 +1322,63 @@ static int net_dm_cmd_trace(struct sk_buff *skb,
>  	return -EOPNOTSUPP;
>  }
>  
> +static int net_dm_interface_start(struct net *net, const char *ifname)
> +{
> +	struct net_device *nd;
> +
> +	nd = dev_get_by_name(net, ifname);
> +
> +	if (nd) {
> +		interface = nd;
> +		dev_hold(interface);
> +	} else {
> +		return -ENODEV;
> +	}
> +	return 0;
> +}
> +


What happens after this monitoring is started, then the admin does :

rmmod ifb


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
