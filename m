Return-Path: <SRS0=GVOk=4J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769C5C35657
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 17:20:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FD60222C4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 17:20:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=resnulli-us.20150623.gappssmtp.com header.i=@resnulli-us.20150623.gappssmtp.com header.b="JynLIov+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FD60222C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0B42C2207F;
	Fri, 21 Feb 2020 17:20:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3NtCwP+gh+R7; Fri, 21 Feb 2020 17:20:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D0A2F20115;
	Fri, 21 Feb 2020 17:20:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BABD4C1D81;
	Fri, 21 Feb 2020 17:20:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 859E9C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 17:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 81D0D85F3E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 17:20:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G_WoC1EbPvwc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 17:20:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4EED085F2D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 17:20:11 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a9so2719477wmj.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 09:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hqQ+aTrDEnBx+s6claZe2vKTKMHC/7x41HzbdXRsZ8E=;
 b=JynLIov+unMZmGChYa0cW1kD9wPV8hyIwmkvkxY2XgSnIKCbqVMYu0RQz+3zwwZyCv
 +N3u7P764XeiKP3oOQFv7dXKC7+Oe4ZQDA/88VwAYfY6lrtrLbJNEvdvyuV/d9GRpOZ1
 ZkMX8o/2quq4U5DJcXi8UuYkeXZJey2JnVfFKzF9TKPa88hn7dRrRu+jW+qIcl3gksOj
 4xTz4SdkHQQUdE/5kZzWczDO3qTOKmqRbmh1IsYfFJZ94Uv9AWIYcC9I6qjUfmaNS3+A
 xl90fPMcBWh6lQ2Gu0cPrw1W78ymY0t48sgRG64HIWovINycKZ6pBj5tY22Y+Bvv0N7X
 AHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hqQ+aTrDEnBx+s6claZe2vKTKMHC/7x41HzbdXRsZ8E=;
 b=eOprjmpmW8jyfGZEuij6v5tPXjfmw8ITZjzmwBF+XLw40jKuLAh/43XoLEhjAHma/C
 OCM4NCYpAe+q/vO9yJXkNGrxr2vphujl8knhbhf8rpX6/TS+9sTTLh3VIerrJtQH4ci0
 YlTDvA0jlYMFrc5tRqtm3KMVfiUGY87Lgrh5PzgqcG2xmg7HaeEzQmpHLk3R59tL6lHc
 RsNjxfnoYZCeL3CE15y5NMQRcrvggL/k9/56Itc18PJ+qKUJdhpdglRDTpiy8oUizgWh
 zLX+XQiwa5dr3V6tKsFVtyOj+lr8pRb/8XZeMbziehWoOYJabcA9RuiW6sI2k3tAM8sh
 5h9g==
X-Gm-Message-State: APjAAAXEzx+TyNNuYy/vohknUqnFJR+q8P3zUNR9DlY2BArbAhMjHeAR
 Z89gnaW2qoJ09mE47a5inZhecg==
X-Google-Smtp-Source: APXvYqzxk6iXslWi+d+A4DYTS4zK4n/WpayK/WU8wiRI+NtfEMydS6s1VGa9hfiASMIsFY/HqR57aw==
X-Received: by 2002:a05:600c:20f:: with SMTP id
 15mr4856445wmi.128.1582305610253; 
 Fri, 21 Feb 2020 09:20:10 -0800 (PST)
Received: from localhost (ip-89-177-130-96.net.upcbroadband.cz.
 [89.177.130.96])
 by smtp.gmail.com with ESMTPSA id d204sm4379677wmd.30.2020.02.21.09.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 09:20:09 -0800 (PST)
Date: Fri, 21 Feb 2020 18:20:08 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: madhuparnabhowmik10@gmail.com
Message-ID: <20200221172008.GA2181@nanopsycho>
References: <20200221165141.24630-1-madhuparnabhowmik10@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221165141.24630-1-madhuparnabhowmik10@gmail.com>
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 jiri@mellanox.com, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: core: devlink.c: Use
	built-in RCU list checking
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

Fri, Feb 21, 2020 at 05:51:41PM CET, madhuparnabhowmik10@gmail.com wrote:
>From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>
>list_for_each_entry_rcu() has built-in RCU and lock checking.
>
>Pass cond argument to list_for_each_entry_rcu() to silence
>false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled
>by default.
>
>Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

Reviewed-by: Jiri Pirko <jiri@mellanox.com>

Thanks.

However, there is a callpath where not devlink lock neither rcu read is
taken:
devlink_dpipe_table_register()->devlink_dpipe_table_find()

I guess that was not the trace you were seeing, right?


>---
> net/core/devlink.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/net/core/devlink.c b/net/core/devlink.c
>index 4c63c9a4c09e..3e8c94155d93 100644
>--- a/net/core/devlink.c
>+++ b/net/core/devlink.c
>@@ -2107,7 +2107,8 @@ devlink_dpipe_table_find(struct list_head *dpipe_tables,
> {
> 	struct devlink_dpipe_table *table;
> 
>-	list_for_each_entry_rcu(table, dpipe_tables, list) {
>+	list_for_each_entry_rcu(table, dpipe_tables, list,
>+				lockdep_is_held(&devlink->lock)) {
> 		if (!strcmp(table->name, table_name))
> 			return table;
> 	}
>-- 
>2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
