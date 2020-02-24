Return-Path: <SRS0=/sBJ=4M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF85C3567B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Feb 2020 10:52:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82C252080D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Feb 2020 10:52:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=resnulli-us.20150623.gappssmtp.com header.i=@resnulli-us.20150623.gappssmtp.com header.b="rRWh5ZbI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82C252080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7F64E85495;
	Mon, 24 Feb 2020 10:52:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LTCfJDWhCkjA; Mon, 24 Feb 2020 10:52:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C3AC784AE1;
	Mon, 24 Feb 2020 10:52:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8E58C18DA;
	Mon, 24 Feb 2020 10:52:19 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F8D5C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2020 10:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F227585191
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2020 10:52:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id diNmwYrNCFwq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2020 10:52:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 46399848A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2020 10:52:11 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a5so8491491wmb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2020 02:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+/3oknbjjXh74tXkJ87bK1AQRcBTEShGAS9TRSr6HFc=;
 b=rRWh5ZbInWogei16TJbuZiPxb08LdmfbYKsu5d4uW34t6VXfELPhC3SQaZAb8nhIPo
 Wda/hWbSbM7MxeAD3Zt6HuJx8bFQQjiKkNKkDvG+JWmW7Uvgld7TDHmG5zF0TOL2KgNT
 RHUpAwJZt3Rrxc5MWW7UlWVtHLBdqv3qMC3mAEJ7ddzaaAdX97ry+iiJXwKHGNPFH+aG
 1+QNifHvI6Bvj8yw6q9EWNAcXOxr2p9fMUzpcgbpJaW1lD51/PglYCiql3QagLVDcAYz
 WkQEALiNuhOOiSkrL8vJONmUL1vKMkP1gO8SqDrDeYgWZnE4PMDa/4xJV+VgDgbUgD4s
 GhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+/3oknbjjXh74tXkJ87bK1AQRcBTEShGAS9TRSr6HFc=;
 b=sf0p+bJzFpkP0nte3E9FGWgd2pbnTdy1AqxiA+gl+Ra5/jDdFM2oVq9dPpByZP8iil
 gfqftpVdvh3Vyoj+R3c8vEen3c7V7pBnXTIRER2VyVfuCIjnMkFFZ3j72a/BGv3vThES
 dWBRBUB80KwAOdqEBII9z5Wr8UWJJ7xEGt6fKnAkvRtmPF7ckbOvI03aZ/nMpghW9rUm
 BmPUEHbIeLyjCjRIsC/1rxsqTuyX06Wcmd2cjyzCKpZpaHR295p5Z10JpvS5sR2Axfcu
 NLNReMzqh1xqV7n25yIKsSlZCT1hRqfqi8cpkQjeAaiOi7maSITWg5zbqA89nkAEH1Cd
 9PsQ==
X-Gm-Message-State: APjAAAVewS/lK6ajixI/p6wtXWykJVPrKtgbV4xqvcanCdMsQBTBIjlu
 QpMb8gwD109HnC1PzRhiNeWKwg==
X-Google-Smtp-Source: APXvYqxP173/3xNIfZXcna9Yb7nuBIf8//+b+CatKWU3a/Qh6VaE8qWvRUIK35pa/v+MuRKN2M85Vw==
X-Received: by 2002:a1c:8055:: with SMTP id b82mr21965462wmd.127.1582541530156; 
 Mon, 24 Feb 2020 02:52:10 -0800 (PST)
Received: from localhost (ip-89-177-130-96.net.upcbroadband.cz.
 [89.177.130.96])
 by smtp.gmail.com with ESMTPSA id z16sm777239wrp.33.2020.02.24.02.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 02:52:09 -0800 (PST)
Date: Mon, 24 Feb 2020 11:52:09 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: madhuparnabhowmik10@gmail.com
Message-ID: <20200224105209.GB16270@nanopsycho>
References: <20200224093013.25700-1-madhuparnabhowmik10@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224093013.25700-1-madhuparnabhowmik10@gmail.com>
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

Mon, Feb 24, 2020 at 10:30:13AM CET, madhuparnabhowmik10@gmail.com wrote:
>From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>
>list_for_each_entry_rcu() has built-in RCU and lock checking.
>
>Pass cond argument to list_for_each_entry_rcu() to silence
>false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled.
>
>The devlink->lock is held when devlink_dpipe_table_find()
>is called in non RCU read side section. Therefore, pass struct devlink
>to devlink_dpipe_table_find() for lockdep checking.
>
>Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>---
> net/core/devlink.c | 18 +++++++++---------
> 1 file changed, 9 insertions(+), 9 deletions(-)
>
>diff --git a/net/core/devlink.c b/net/core/devlink.c
>index e82750bdc496..dadf5fa79bb1 100644
>--- a/net/core/devlink.c
>+++ b/net/core/devlink.c
>@@ -2103,11 +2103,11 @@ static int devlink_dpipe_entry_put(struct sk_buff *skb,
> 
> static struct devlink_dpipe_table *
> devlink_dpipe_table_find(struct list_head *dpipe_tables,
>-			 const char *table_name)
>+			 const char *table_name, struct devlink *devlink)
> {
> 	struct devlink_dpipe_table *table;
>-
>-	list_for_each_entry_rcu(table, dpipe_tables, list) {
>+	list_for_each_entry_rcu(table, dpipe_tables, list,
>+				lockdep_is_held(&devlink->lock)) {
> 		if (!strcmp(table->name, table_name))
> 			return table;
> 	}
>@@ -2226,7 +2226,7 @@ static int devlink_nl_cmd_dpipe_entries_get(struct sk_buff *skb,
> 
> 	table_name = nla_data(info->attrs[DEVLINK_ATTR_DPIPE_TABLE_NAME]);
> 	table = devlink_dpipe_table_find(&devlink->dpipe_table_list,
>-					 table_name);
>+					 table_name, devlink);
> 	if (!table)
> 		return -EINVAL;
> 
>@@ -2382,7 +2382,7 @@ static int devlink_dpipe_table_counters_set(struct devlink *devlink,
> 	struct devlink_dpipe_table *table;
> 
> 	table = devlink_dpipe_table_find(&devlink->dpipe_table_list,
>-					 table_name);
>+					 table_name, devlink);
> 	if (!table)
> 		return -EINVAL;
> 
>@@ -6814,7 +6814,7 @@ bool devlink_dpipe_table_counter_enabled(struct devlink *devlink,
> 
> 	rcu_read_lock();
> 	table = devlink_dpipe_table_find(&devlink->dpipe_table_list,
>-					 table_name);
>+					 table_name, devlink);
> 	enabled = false;
> 	if (table)
> 		enabled = table->counters_enabled;
>@@ -6845,7 +6845,7 @@ int devlink_dpipe_table_register(struct devlink *devlink,
> 
> 	mutex_lock(&devlink->lock);
> 
>-	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name)) {
>+	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name, devlink)) {

Run scripts/checkpatch.pl on your patch. You are breaking 80-cols limit
here.

Otherwise, the patch looks fine.

> 		err = -EEXIST;
> 		goto unlock;
> 	}
>@@ -6881,7 +6881,7 @@ void devlink_dpipe_table_unregister(struct devlink *devlink,
> 
> 	mutex_lock(&devlink->lock);
> 	table = devlink_dpipe_table_find(&devlink->dpipe_table_list,
>-					 table_name);
>+					 table_name, devlink);
> 	if (!table)
> 		goto unlock;
> 	list_del_rcu(&table->list);
>@@ -7038,7 +7038,7 @@ int devlink_dpipe_table_resource_set(struct devlink *devlink,
> 
> 	mutex_lock(&devlink->lock);
> 	table = devlink_dpipe_table_find(&devlink->dpipe_table_list,
>-					 table_name);
>+					 table_name, devlink);
> 	if (!table) {
> 		err = -EINVAL;
> 		goto out;
>-- 
>2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
