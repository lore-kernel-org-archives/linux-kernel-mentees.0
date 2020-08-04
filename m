Return-Path: <SRS0=ILBb=BO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA60C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Aug 2020 23:14:21 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ED6D2086A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Aug 2020 23:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9ED6D2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 58A3F20404;
	Tue,  4 Aug 2020 23:14:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3yJHZbsst2Pn; Tue,  4 Aug 2020 23:14:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7FE0E203E4;
	Tue,  4 Aug 2020 23:14:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73894C0050;
	Tue,  4 Aug 2020 23:14:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD04AC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 23:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B219920404
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 23:14:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sHnAakzIymC3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 23:14:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by silver.osuosl.org (Postfix) with ESMTPS id BBD29203E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 23:14:16 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id DC56E12896E76;
 Tue,  4 Aug 2020 15:57:29 -0700 (PDT)
Date: Tue, 04 Aug 2020 16:14:14 -0700 (PDT)
Message-Id: <20200804.161414.149428114422381017.davem@davemloft.net>
To: izabela.bakollari@gmail.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200804160908.46193-1-izabela.bakollari@gmail.com>
References: <20200707171515.110818-1-izabela.bakollari@gmail.com>
 <20200804160908.46193-1-izabela.bakollari@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 04 Aug 2020 15:57:30 -0700 (PDT)
Cc: kuba@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, nhorman@tuxdriver.com, netdev@vger.kernel.org
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

From: izabela.bakollari@gmail.com
Date: Tue,  4 Aug 2020 18:09:08 +0200

> @@ -1315,6 +1334,53 @@ static int net_dm_cmd_trace(struct sk_buff *skb,
>  	return -EOPNOTSUPP;
>  }
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
> +}
> +
> +static int net_dm_interface_stop(struct net *net, const char *ifname)
> +{
> +	dev_put(interface);
> +	interface = NULL;
> +
> +	return 0;
> +}

Where is the netdev notifier that will drop this reference if the network
device is unregistered?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
