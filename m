Return-Path: <SRS0=qNNM=4K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B46C35671
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 06:26:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 022CC208C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 06:26:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=resnulli-us.20150623.gappssmtp.com header.i=@resnulli-us.20150623.gappssmtp.com header.b="YgYqaaBl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 022CC208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C1BDF86B11;
	Sat, 22 Feb 2020 06:26:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QhojSqTidQjO; Sat, 22 Feb 2020 06:26:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4AE63869BA;
	Sat, 22 Feb 2020 06:26:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 358E6C1D81;
	Sat, 22 Feb 2020 06:26:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7905FC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 06:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7544686A4F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 06:26:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oebRlCZCL1J9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 06:26:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B1756869BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 06:26:43 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z3so4412586wru.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 22:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/59J0H3GMLZGQBLxUb/P9gfXRVxPokMyJCYkW6dkkKw=;
 b=YgYqaaBlYOEfNDyadkILBH204HirajE3Z3I6L46m+XYGL+RnnSyqssH5LRBF8pMbnD
 rQtwZBIeDF3K2aQKN4zQ444s8Sa7e3aV9hEH9D40u5crwSoUAh4FqtgVnSwoPWKNubm6
 wO7MwJntiLJZyKKaytoOmia6jISJjJbEjGHXFc/G2TxotGF4hDPK5hAGgR27FMYX5otV
 i+u9jQB+XjJ4GnYQKIpoAbPpId20EBlfrdC0atRKSbwC7cx8qdAKuptu/8+DYGQZGI3X
 U124fcx9wtju0mIA7qZIyGSUQsER9a9jIctkjwhvw/ASrxNdJ4jsgL/H2veTEWvaZyeM
 m9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/59J0H3GMLZGQBLxUb/P9gfXRVxPokMyJCYkW6dkkKw=;
 b=JGmquMMAv36zle6dKV80DROh4MVK8f9L58tY+bMKwU5rNMW/iQzxlh3ihTGkk4K6/+
 15yjqA2gsTNel+yFUAQz5oZopO/0cLlfMH1bk68eozpDEQkqByR7QD0dPsd38OLWxNkv
 98sHKj2XCwwjP4Fg4tOHEPWiva6Pt4mu29KGErxXlyIsinYhnlEZYhOZbEy68PAJjNsB
 yEjuUU9vbAo/XqPLFOq1mOqO4O/FX7wuwyTVSRQLa9eZmOU6/GXy2jqdeJlI76onIiPy
 YP9ZDfrBugduDCsLIlwZKaa8ft6CZU5CwDlJLfQICvB+bbuo03sttIS0gItgQCTAJ3Pv
 uY9A==
X-Gm-Message-State: APjAAAWFrGAaL6+b2E7byUkkD4GLb4SB/VsHYiVsDYmaUXFyiSOSZzsT
 wRUcgmxE/hs2wYxKZcUkXZqw7A==
X-Google-Smtp-Source: APXvYqzJCvVsgqjVymg7udnn6kagPdqKPFB6BfUwZSDat3KQhYu5qWhke/ZVlGCJiAG2QeUeiqvJhw==
X-Received: by 2002:a5d:4687:: with SMTP id u7mr51024980wrq.176.1582352801556; 
 Fri, 21 Feb 2020 22:26:41 -0800 (PST)
Received: from localhost (ip-89-177-130-96.net.upcbroadband.cz.
 [89.177.130.96])
 by smtp.gmail.com with ESMTPSA id h5sm7655640wmf.8.2020.02.21.22.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 22:26:41 -0800 (PST)
Date: Sat, 22 Feb 2020 07:26:40 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: madhuparnabhowmik10@gmail.com
Message-ID: <20200222062640.GA2228@nanopsycho>
References: <20200221180943.17415-1-madhuparnabhowmik10@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221180943.17415-1-madhuparnabhowmik10@gmail.com>
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 jiri@mellanox.com, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: core: devlink.c: Hold
 devlink->lock from the beginning of devlink_dpipe_table_register()
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

Fri, Feb 21, 2020 at 07:09:43PM CET, madhuparnabhowmik10@gmail.com wrote:
>From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>
>devlink_dpipe_table_find() should be called under either
>rcu_read_lock() or devlink->lock. devlink_dpipe_table_register()
>calls devlink_dpipe_table_find() without holding the lock
>and acquires it later. Therefore hold the devlink->lock
>from the beginning of devlink_dpipe_table_register().
>
>Suggested-by: Jiri Pirko <jiri@mellanox.com>
>Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>---
> net/core/devlink.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/net/core/devlink.c b/net/core/devlink.c
>index 3e8c94155d93..d54e1f156b6f 100644
>--- a/net/core/devlink.c
>+++ b/net/core/devlink.c
>@@ -6840,6 +6840,8 @@ int devlink_dpipe_table_register(struct devlink *devlink,
> {
> 	struct devlink_dpipe_table *table;
> 
>+	mutex_lock(&devlink->lock);
>+
> 	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name))
> 		return -EEXIST;

You have to handle the error path.


> 
>@@ -6855,7 +6857,6 @@ int devlink_dpipe_table_register(struct devlink *devlink,
> 	table->priv = priv;
> 	table->counter_control_extern = counter_control_extern;
> 
>-	mutex_lock(&devlink->lock);
> 	list_add_tail_rcu(&table->list, &devlink->dpipe_table_list);
> 	mutex_unlock(&devlink->lock);
> 	return 0;
>-- 
>2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
