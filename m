Return-Path: <SRS0=/lQp=4L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E8CC35666
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 11:01:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADB1D20637
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 11:01:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=resnulli-us.20150623.gappssmtp.com header.i=@resnulli-us.20150623.gappssmtp.com header.b="1wmQJcbX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADB1D20637
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A161A87404;
	Sun, 23 Feb 2020 11:01:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 97J5oMECCnco; Sun, 23 Feb 2020 11:01:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 83FFA873CE;
	Sun, 23 Feb 2020 11:01:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6CC95C1AE2;
	Sun, 23 Feb 2020 11:01:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D563C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 11:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 145BB2037E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 11:01:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZGWwoqavWH2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 11:01:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 756A720369
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 11:01:48 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z3so6997907wru.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 03:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nNPrsHRgMBJ28633rhUatoFgkN3nEJ6CqDkonaiRJ/k=;
 b=1wmQJcbXK3udpuO0gJvSAevchnQrhS2D7iwgDR1V8N3PQ74b1eL7Yrs6PqK3XV3V6M
 ocNPnJS9P/0wS4k7EWEbPX2Yu4Wufml3iccw/opY89TOWUuuY/tnGDCXFec5JCV8iOoR
 74kg3BTywFpFxFn0dpRRgcPLG+87/M+kX3lr6JnYKGSKIXDqp5AWUdgZ0nFrgey07Vty
 f7q3LWvpm8YY6RSJ6xEIfT+YMdme8rU+KeDJ1M6ZcafHdlmL+ccxtOhRcoieEEazU5MM
 SgUVEtJc4CBGTs+vw6M1079J9y214WLO3sz88SdF3hWC9oUwWRYaGQGJithrQ1mnteO6
 TFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nNPrsHRgMBJ28633rhUatoFgkN3nEJ6CqDkonaiRJ/k=;
 b=m0AtmLwMlWDSiFCsi2LjfiHm5qVYDoEgYsUj22pmM4tKgjBzLsDLbxPm6mPJYwOs69
 6glIMXZJOI4gnELy/LkVCoCG6BqbcQsLTvw4duyPzNdrwMe+qcO6hCT6O58roRd2Dzt9
 oC/hYvOTNSLrPxkdwLuhOMtOmGZ9/7wLeO/Ihq2XXiOtekSQgIMHHNSiiNNyYXL92+JR
 R2Woh51GJWLIzQxku/46ytx0zp/wBWF8BR5gAan68lJZsCNypXpESeSLX7JwZd+VeipJ
 Swyefl7hPG8ZrkbmIHxNxcoHLxVolC/M67txXZ3Q5/trbBsSZ6lulHZ/cAPfoAPkV6+G
 s7ZQ==
X-Gm-Message-State: APjAAAUOSD1cqE11CrrxnkErtLJ+5bLNRm/O4Rm22ut7fHg2ZR0GjN+x
 aSl/XHiHEuYNr1L7IAHXqmGgUg==
X-Google-Smtp-Source: APXvYqzgEMCZfzOoWDjWUaSpZbFzGH0LqC4DP638gxs1UJpsD7iwLnM7GXZGsNgvTL88KtPUPTvErg==
X-Received: by 2002:adf:e68d:: with SMTP id r13mr4306936wrm.159.1582455707231; 
 Sun, 23 Feb 2020 03:01:47 -0800 (PST)
Received: from localhost (ip-89-177-130-96.net.upcbroadband.cz.
 [89.177.130.96])
 by smtp.gmail.com with ESMTPSA id x7sm12742129wrq.41.2020.02.23.03.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2020 03:01:46 -0800 (PST)
Date: Sun, 23 Feb 2020 12:01:45 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: madhuparnabhowmik10@gmail.com
Message-ID: <20200223110145.GE2228@nanopsycho>
References: <20200223105253.30469-1-madhuparnabhowmik10@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200223105253.30469-1-madhuparnabhowmik10@gmail.com>
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

Sun, Feb 23, 2020 at 11:52:53AM CET, madhuparnabhowmik10@gmail.com wrote:
>From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>
>devlink_dpipe_table_find() should be called under either
>rcu_read_lock() or devlink->lock. devlink_dpipe_table_register()
>calls devlink_dpipe_table_find() without holding the lock
>and acquires it later. Therefore hold the devlink->lock
>from the beginning of devlink_dpipe_table_register().
>
>Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>---
> net/core/devlink.c | 25 +++++++++++++++++--------
> 1 file changed, 17 insertions(+), 8 deletions(-)
>
>diff --git a/net/core/devlink.c b/net/core/devlink.c
>index 4c63c9a4c09e..61a350f59741 100644
>--- a/net/core/devlink.c
>+++ b/net/core/devlink.c
>@@ -6838,26 +6838,35 @@ int devlink_dpipe_table_register(struct devlink *devlink,
> 				 void *priv, bool counter_control_extern)
> {
> 	struct devlink_dpipe_table *table;
>+	int err = 0;
> 
>-	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name))
>-		return -EEXIST;
>+	mutex_lock(&devlink->lock);
> 
>-	if (WARN_ON(!table_ops->size_get))
>-		return -EINVAL;
>+	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name)) {
>+		err = -EEXIST;
>+		goto unlock;
>+	}
>+
>+	if (WARN_ON(!table_ops->size_get)) {
>+		err = -EINVAL;
>+		goto unlock;
>+	}


Put this check out of the lock please.


> 
> 	table = kzalloc(sizeof(*table), GFP_KERNEL);
>-	if (!table)
>-		return -ENOMEM;
>+	if (!table) {
>+		err = -ENOMEM;
>+		goto unlock;
>+	}
> 
> 	table->name = table_name;
> 	table->table_ops = table_ops;
> 	table->priv = priv;
> 	table->counter_control_extern = counter_control_extern;
> 
>-	mutex_lock(&devlink->lock);
> 	list_add_tail_rcu(&table->list, &devlink->dpipe_table_list);
>+unlock:
> 	mutex_unlock(&devlink->lock);
>-	return 0;
>+	return err;
> }
> EXPORT_SYMBOL_GPL(devlink_dpipe_table_register);
> 
>-- 
>2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
