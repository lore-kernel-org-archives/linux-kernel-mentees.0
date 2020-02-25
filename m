Return-Path: <SRS0=F6Pe=4N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CDA2C35DF5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Feb 2020 12:10:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B0562084E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Feb 2020 12:10:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvpUiAYt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B0562084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E99D12076F;
	Tue, 25 Feb 2020 12:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UfQ00u1TScFn; Tue, 25 Feb 2020 12:10:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 75710204A7;
	Tue, 25 Feb 2020 12:10:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5CD7EC089F;
	Tue, 25 Feb 2020 12:10:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1E44C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 12:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9FEE2844BC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 12:10:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IF7OHfPHIoAF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 12:10:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C790B84482
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 12:09:37 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id d6so6805641pgn.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 04:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Mqwfc2KPcVYiVKPkQxYVO7vDegBEMXoJ1E0hLY/tEvs=;
 b=QvpUiAYt/81/K3o5p9SEGp2S+oMZT+pF5G/IgKwJ3lkCNIGGhE/nqbrDprw6OJGudw
 DUsN/CNkCmL2wqEET9mky2iuKALEg4gRZPHXjbe4mDJGEFhJ8ZlmL+35JSi4sbKu7+ym
 bXdvae1ucylvR/2yo/6NFm7kVpAx2Ft2uX2ENpIxVC/i2YISkNdFAgUAGz/5Ypm36D9D
 LBpyOYtWig9hLKlZ09ncVhBxPnKYi2nK6R4tGVHmUkvyzlngfHidSMEFW5Hzx4tGTi/h
 OWGfE8fn6cQTUGLapsaPo39dImC5ITRM7AsE00N4g2ZNcVba4ZwRXvZQy+IondWafLuJ
 uLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Mqwfc2KPcVYiVKPkQxYVO7vDegBEMXoJ1E0hLY/tEvs=;
 b=kPUlQcvPqAIXYfFUTW31NcJ7UniuZ90Q8S/ElqZIL3BkfKMJOnb4Va6aBxpiM1uFaJ
 NliQihkydPRkjNPwvlmrgU6mr3mTBd/DbviFx6EimxS4tlaWlShqlfLQiy36IEpzOtGW
 J/hUJPN87plCKvrto33vF2H5lHRXCEpisnJ64dBiGSRhcu7LRVYZGdJfBFI35KDmO++y
 NHNa5AL6oPXi5YFua4Bl+ViAppd6CpO1xbz6vUFm4KlweGDP57Yp5vTDXaVsTvbuYpRw
 jeorbAS+nRq+KSRgGOo2YBf7hVI1npAM7EFhpEm28Qtn1wWgyaVPb7V3xHgL8CgTnfRl
 XV8w==
X-Gm-Message-State: APjAAAW2qApsH76oEc4hgl1NH8S0knWrRWkbAisZxvUUZeGmUevwAtyZ
 OX4jdfJpKH6q79klmnQ5cA==
X-Google-Smtp-Source: APXvYqw2IDOcub20k/JBZx9cp2o1QdYEKf3jJ3rBWjrY04ClE4F+LPbgluh8uCOp28IxecK5bd73nA==
X-Received: by 2002:aa7:8587:: with SMTP id w7mr57040697pfn.39.1582632577377; 
 Tue, 25 Feb 2020 04:09:37 -0800 (PST)
Received: from madhuparna-HP-Notebook
 ([2402:3a80:1ee1:f355:e8e5:803b:cde8:bccc])
 by smtp.gmail.com with ESMTPSA id e6sm16685944pfh.32.2020.02.25.04.09.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Feb 2020 04:09:36 -0800 (PST)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Tue, 25 Feb 2020 17:39:08 +0530
To: Jiri Pirko <jiri@resnulli.us>
Message-ID: <20200225120908.GA29836@madhuparna-HP-Notebook>
References: <20200224093013.25700-1-madhuparnabhowmik10@gmail.com>
 <20200224105209.GB16270@nanopsycho>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224105209.GB16270@nanopsycho>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 madhuparnabhowmik10@gmail.com, jiri@mellanox.com, joel@joelfernandes.org,
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

On Mon, Feb 24, 2020 at 11:52:09AM +0100, Jiri Pirko wrote:
> Mon, Feb 24, 2020 at 10:30:13AM CET, madhuparnabhowmik10@gmail.com wrote:
> >From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> >
> >list_for_each_entry_rcu() has built-in RCU and lock checking.
> >
> >Pass cond argument to list_for_each_entry_rcu() to silence
> >false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled.
> >
> >The devlink->lock is held when devlink_dpipe_table_find()
> >is called in non RCU read side section. Therefore, pass struct devlink
> >to devlink_dpipe_table_find() for lockdep checking.
> >
> >Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> >---
> > net/core/devlink.c | 18 +++++++++---------
> > 1 file changed, 9 insertions(+), 9 deletions(-)
> >
> >diff --git a/net/core/devlink.c b/net/core/devlink.c
> >index e82750bdc496..dadf5fa79bb1 100644
> >--- a/net/core/devlink.c
> >+++ b/net/core/devlink.c
> >@@ -2103,11 +2103,11 @@ static int devlink_dpipe_entry_put(struct sk_buff *skb,
> > 
> > static struct devlink_dpipe_table *
> > devlink_dpipe_table_find(struct list_head *dpipe_tables,
> >-			 const char *table_name)
> >+			 const char *table_name, struct devlink *devlink)
> > {
> > 	struct devlink_dpipe_table *table;
> >-
> >-	list_for_each_entry_rcu(table, dpipe_tables, list) {
> >+	list_for_each_entry_rcu(table, dpipe_tables, list,
> >+				lockdep_is_held(&devlink->lock)) {
> > 		if (!strcmp(table->name, table_name))
> > 			return table;
> > 	}
> >@@ -2226,7 +2226,7 @@ static int devlink_nl_cmd_dpipe_entries_get(struct sk_buff *skb,
> > 
> > 	table_name = nla_data(info->attrs[DEVLINK_ATTR_DPIPE_TABLE_NAME]);
> > 	table = devlink_dpipe_table_find(&devlink->dpipe_table_list,
> >-					 table_name);
> >+					 table_name, devlink);
> > 	if (!table)
> > 		return -EINVAL;
> > 
> >@@ -2382,7 +2382,7 @@ static int devlink_dpipe_table_counters_set(struct devlink *devlink,
> > 	struct devlink_dpipe_table *table;
> > 
> > 	table = devlink_dpipe_table_find(&devlink->dpipe_table_list,
> >-					 table_name);
> >+					 table_name, devlink);
> > 	if (!table)
> > 		return -EINVAL;
> > 
> >@@ -6814,7 +6814,7 @@ bool devlink_dpipe_table_counter_enabled(struct devlink *devlink,
> > 
> > 	rcu_read_lock();
> > 	table = devlink_dpipe_table_find(&devlink->dpipe_table_list,
> >-					 table_name);
> >+					 table_name, devlink);
> > 	enabled = false;
> > 	if (table)
> > 		enabled = table->counters_enabled;
> >@@ -6845,7 +6845,7 @@ int devlink_dpipe_table_register(struct devlink *devlink,
> > 
> > 	mutex_lock(&devlink->lock);
> > 
> >-	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name)) {
> >+	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name, devlink)) {
> 
> Run scripts/checkpatch.pl on your patch. You are breaking 80-cols limit
> here.
>
Sure, I will take care of this and send the updated patch soon.

Thank you,
Madhuparna
> Otherwise, the patch looks fine.
> 
> > 		err = -EEXIST;
> > 		goto unlock;
> > 	}
> >@@ -6881,7 +6881,7 @@ void devlink_dpipe_table_unregister(struct devlink *devlink,
> > 
> > 	mutex_lock(&devlink->lock);
> > 	table = devlink_dpipe_table_find(&devlink->dpipe_table_list,
> >-					 table_name);
> >+					 table_name, devlink);
> > 	if (!table)
> > 		goto unlock;
> > 	list_del_rcu(&table->list);
> >@@ -7038,7 +7038,7 @@ int devlink_dpipe_table_resource_set(struct devlink *devlink,
> > 
> > 	mutex_lock(&devlink->lock);
> > 	table = devlink_dpipe_table_find(&devlink->dpipe_table_list,
> >-					 table_name);
> >+					 table_name, devlink);
> > 	if (!table) {
> > 		err = -EINVAL;
> > 		goto out;
> >-- 
> >2.17.1
> >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
