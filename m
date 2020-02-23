Return-Path: <SRS0=/lQp=4L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA64C35673
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 10:56:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70C2520637
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 10:56:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPdjVDnf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70C2520637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 424098663C;
	Sun, 23 Feb 2020 10:56:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kddox9wCMj53; Sun, 23 Feb 2020 10:56:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BD6D985CA1;
	Sun, 23 Feb 2020 10:56:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6F4CC1AE2;
	Sun, 23 Feb 2020 10:56:19 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB7BEC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 10:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D92EF85CA1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 10:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HUoZOKNfHWyo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 10:56:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5B9B18663C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 10:56:17 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 185so3766468pfv.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 02:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Y4VY1Azy1o3PoJqSKPRqaiIxMs3Y8ukCDbObo1HjIMY=;
 b=CPdjVDnfw0/2F2CgiSygZvvIsvU1j06og18Asa17oW35tVg82IHVtWq2lx7oDCIQOB
 Zni8Kpd2RE8QtJFSN9H4Dnnr/u4sQDLwOI0mdDpuhxlUIgnM/rSaQu698VSMknpOuvNK
 VadwWKH4JkLwzcGALIEcpACTDsUTez5TpNtYsfRg2lNKwC5DnhSnbkZsOLSRAYDnsv/p
 KvvXTaBir7a2fcQeKLQBwH8Yk3Zh2GPNHUnBKc1NxUsjsBS7DGsPkKrvdFkaHkwTmUil
 lwIUKQw2FtXyHTEmPVKfs7G2eJrNK5hsP4GD0qDrbnmvpwGxUrMudFHsIvMCfx08Ifsf
 SI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Y4VY1Azy1o3PoJqSKPRqaiIxMs3Y8ukCDbObo1HjIMY=;
 b=j/TVM4bkW6CAO9/h5zGXgenZv8gvLmFEVyeaiwWvmlXT4Ue75jSh0odc/9HnkVIgUS
 qF1OvUDU8uK+A/e5qFxGdClvnzSE09nicdNM+YCaYPv/xJUdYuLEwhZtsUjdev88tJA+
 6LXZnO+6SlaP0cufrakbXQCmCLKABtEiw8NW/47ulFod5d1R+kcIy9Zc/3ZqyMse7Aep
 5y6H/ZlrJeKZHmguXcf3eSiT3WmfvCw2agVWzFwxrvBKFK7mSOUzpHxt6wJc+wh0iDGR
 vjlVR1GKdSVRmYDt/oLAnoj0z8qx5m49aqN5ue+OGHhMJHYbnki/vDSLWa7koXsQR77Q
 3emQ==
X-Gm-Message-State: APjAAAX3SvW6TJBGEWWwbyJd9ICsWGGg7zFIRor5DnMtqEa8rlNmsD5N
 i1GE/N1xFj+/OM+lo0LfJA==
X-Google-Smtp-Source: APXvYqw4YCUB6My3nq+OxFm92OU+rjZrxzEdwhzqqnit1IzAEjHzRdsub2GaWCHQ/aStoHOUt4asXw==
X-Received: by 2002:a63:de54:: with SMTP id y20mr47965037pgi.79.1582455376990; 
 Sun, 23 Feb 2020 02:56:16 -0800 (PST)
Received: from madhuparna-HP-Notebook
 ([2402:3a80:515:9a49:e8ed:fa6e:a613:7ebf])
 by smtp.gmail.com with ESMTPSA id m16sm1446176pfh.60.2020.02.23.02.56.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 23 Feb 2020 02:56:16 -0800 (PST)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Sun, 23 Feb 2020 16:26:10 +0530
To: Jiri Pirko <jiri@resnulli.us>
Message-ID: <20200223105610.GA2400@madhuparna-HP-Notebook>
References: <20200222065234.8829-1-madhuparnabhowmik10@gmail.com>
 <20200223064329.GD2228@nanopsycho>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200223064329.GD2228@nanopsycho>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 madhuparnabhowmik10@gmail.com, jiri@mellanox.com, joel@joelfernandes.org,
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

On Sun, Feb 23, 2020 at 07:43:29AM +0100, Jiri Pirko wrote:
> Sat, Feb 22, 2020 at 07:52:34AM CET, madhuparnabhowmik10@gmail.com wrote:
> >From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> >
> >devlink_dpipe_table_find() should be called under either
> >rcu_read_lock() or devlink->lock. devlink_dpipe_table_register()
> >calls devlink_dpipe_table_find() without holding the lock
> >and acquires it later. Therefore hold the devlink->lock
> >from the beginning of devlink_dpipe_table_register().
> >
> >Suggested-by: Jiri Pirko <jiri@mellanox.com>
> >Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> >---
> > net/core/devlink.c | 15 +++++++++++----
> > 1 file changed, 11 insertions(+), 4 deletions(-)
> >
> >diff --git a/net/core/devlink.c b/net/core/devlink.c
> >index 3e8c94155d93..ba9dd8cb98c3 100644
> >--- a/net/core/devlink.c
> >+++ b/net/core/devlink.c
> >@@ -6840,22 +6840,29 @@ int devlink_dpipe_table_register(struct devlink *devlink,
> > {
> > 	struct devlink_dpipe_table *table;
> > 
> >-	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name))
> >+	mutex_lock(&devlink->lock);
> >+
> >+	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name)) {
> >+		mutex_unlock(&devlink->lock);
> > 		return -EEXIST;
> >+	}
> > 
> >-	if (WARN_ON(!table_ops->size_get))
> >+	if (WARN_ON(!table_ops->size_get)) {
> >+		mutex_unlock(&devlink->lock);
> > 		return -EINVAL;
> >+	}
> > 
> > 	table = kzalloc(sizeof(*table), GFP_KERNEL);
> >-	if (!table)
> >+	if (!table) {
> >+		mutex_unlock(&devlink->lock);
> 
> Please use "goto unlock" instead of unlocking on multiple places.
>
Sure, I have sent a new patch.
Thank you,
Madhuparna
> 
> 
> > 		return -ENOMEM;
> >+	}
> > 
> > 	table->name = table_name;
> > 	table->table_ops = table_ops;
> > 	table->priv = priv;
> > 	table->counter_control_extern = counter_control_extern;
> > 
> >-	mutex_lock(&devlink->lock);
> > 	list_add_tail_rcu(&table->list, &devlink->dpipe_table_list);
> > 	mutex_unlock(&devlink->lock);
> > 	return 0;
> >-- 
> >2.17.1
> >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
