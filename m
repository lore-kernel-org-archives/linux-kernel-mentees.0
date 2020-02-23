Return-Path: <SRS0=/lQp=4L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C315C35666
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 11:04:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61E8420637
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 11:04:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tKep900/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61E8420637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 55A9C873DE;
	Sun, 23 Feb 2020 11:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SkSWi5fYzO9p; Sun, 23 Feb 2020 11:04:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D54B2873DA;
	Sun, 23 Feb 2020 11:04:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C16DAC1AE2;
	Sun, 23 Feb 2020 11:04:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F121DC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 11:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DBBB62037E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 11:04:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id REw8MVGO0ZdM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 11:04:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by silver.osuosl.org (Postfix) with ESMTPS id D03EF20369
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 11:04:26 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id y8so2778197pll.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 03:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=om4f7MVc7Kk4+w+0wroNyFz+6EbbOUYfqD30UnUwIqk=;
 b=tKep900/tlJjVC1CTw0BrMP83obkKmYKmqiYOzqSXTmPQyOrJhOu24H+yRqljXSZ18
 D5H8BkZ3Uirf85lOX2Z1eo1LLLC8HbfVDcw9tGClHpQZW0qb65KVC/25iuKtlzzDGV5X
 bZB9SGwAqiA6A39U3T5p39r8A7Zfh6smCtWH/AmnGvbpBrZUkFOd/qd6Wwt/nOUQXuOE
 iPTtSoWVjSsNhd7VbtRtYtky4DP9uemZr5fSasy+MvjFLJtCbEgYqwkkI+9tU3cw9aNB
 lPq6G2+NTWpsyJfilkKZvq5JLP3Dfwc+JE5ewg7uzJmG4etCCfw/pI6UP0qELnxY0AnJ
 CZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=om4f7MVc7Kk4+w+0wroNyFz+6EbbOUYfqD30UnUwIqk=;
 b=V3bHG0NsYmsJvfGsB8bdhYS56AGNXYXRMOHs8khXwlu32G3LH0cPHvsfFz8TqipPNo
 As3OTzrgnZDKHouXkL3BfQU3qJOFgPIuXZHMebnAnufl8qU95MF0sWQq49my8iPhWnyb
 gobRFTIYfO6MRg7FIyjcsTb0g1utO2AxWK0bTtyQUQ74rDkYcQ4PnF0sotS3lZkbrXsD
 8SSauH/u11ey9klEzAal5yQJXv0ZmOrU61IVmqzljD/hwLMFZPtdOzEAFAVrpZ8Ludj/
 i6kRMXWHt3lpYfUEKOLCmch+iAs7lYbfmoaYAcvrlIvZCxvWucH5RlJ4GmcNVsdaYPdM
 R8tw==
X-Gm-Message-State: APjAAAVVqNfmBfY6f8jwfAWgjrEhbUDDkrVW5TE48VIAKzVcqWJN78OF
 R36vQB3jCODavUp76+51aQ==
X-Google-Smtp-Source: APXvYqxPpt+EHE/A0V8OL5mRLTRyVUdJzEkkF8DjgaM8xAVR3oGwTUBMypk8vCsioEpJwiUIMw66kA==
X-Received: by 2002:a17:90a:fb4f:: with SMTP id
 iq15mr14285642pjb.86.1582455866390; 
 Sun, 23 Feb 2020 03:04:26 -0800 (PST)
Received: from madhuparna-HP-Notebook ([42.109.138.18])
 by smtp.gmail.com with ESMTPSA id z5sm9324536pfq.3.2020.02.23.03.04.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 23 Feb 2020 03:04:25 -0800 (PST)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Sun, 23 Feb 2020 16:33:42 +0530
To: Jiri Pirko <jiri@resnulli.us>
Message-ID: <20200223110342.GB2400@madhuparna-HP-Notebook>
References: <20200221165141.24630-1-madhuparnabhowmik10@gmail.com>
 <20200221172008.GA2181@nanopsycho>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221172008.GA2181@nanopsycho>
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

On Fri, Feb 21, 2020 at 06:20:08PM +0100, Jiri Pirko wrote:
> Fri, Feb 21, 2020 at 05:51:41PM CET, madhuparnabhowmik10@gmail.com wrote:
> >From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> >
> >list_for_each_entry_rcu() has built-in RCU and lock checking.
> >
> >Pass cond argument to list_for_each_entry_rcu() to silence
> >false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled
> >by default.
> >
> >Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> 
> Reviewed-by: Jiri Pirko <jiri@mellanox.com>
> 
> Thanks.
> 
> However, there is a callpath where not devlink lock neither rcu read is
> taken:
> devlink_dpipe_table_register()->devlink_dpipe_table_find()
> I guess that was not the trace you were seeing, right?
> 
> 
> >---
> > net/core/devlink.c | 3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> >
> >diff --git a/net/core/devlink.c b/net/core/devlink.c
> >index 4c63c9a4c09e..3e8c94155d93 100644
> >--- a/net/core/devlink.c
> >+++ b/net/core/devlink.c
> >@@ -2107,7 +2107,8 @@ devlink_dpipe_table_find(struct list_head *dpipe_tables,
> > {
> > 	struct devlink_dpipe_table *table;
> > 
> >-	list_for_each_entry_rcu(table, dpipe_tables, list) {
> >+	list_for_each_entry_rcu(table, dpipe_tables, list,
> >+				lockdep_is_held(&devlink->lock)) {

Hi Jiri,

I just noticed that this patch does not compile because devlink is
not passed as an argument to devlink_dpipe_table_find() and it is not
even global. I am not sure why I didn't encounter this error before
sending the patch. Anyway, I am sorry about this.
But it seems to be the right lock that should be held and checked for
in devlink_dpipe_table_find(). 
So will it be okay to pass devlink to devlink_dpipe_table_find()?
Anyway devlink_dpipe_table_find() is only called from functions
within devlink.c.

Let me know what you think about this.
Thank you,
Madhuparna


> > 		if (!strcmp(table->name, table_name))
> > 			return table;
> > 	}
> >-- 
> >2.17.1
> >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
