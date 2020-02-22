Return-Path: <SRS0=qNNM=4K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03E3C35672
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 06:56:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0CB020707
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 06:56:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPURgE2L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0CB020707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9117886DFC;
	Sat, 22 Feb 2020 06:56:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A-omyw9HO4kO; Sat, 22 Feb 2020 06:56:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D31178555A;
	Sat, 22 Feb 2020 06:56:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD50DC1D81;
	Sat, 22 Feb 2020 06:56:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E054C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 06:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EDB7A86DDC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 06:56:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y7jtN+kYvTGq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 06:56:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7AD858555A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 06:56:13 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id z7so2136800pgk.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 22:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=P1m+5CvuP9WCDPeB2rpqQfl3ZDcAcnZi8bxAc6P+hRk=;
 b=dPURgE2Lm4GaZRYbjxHDP2B3otEz+xUJEcA5i3LVcJjawKYEdOuzaftuH86Hvn+z2u
 p/HVStoCr46D2r7vAdKIPPtDTw4Ri6UvouwJXuUMdRnjZR1uRFWRzplttwg9dEQVxU19
 1NG0zIrux8y1zMOTymtU3BKJ784cQOyQRz5msCWx/YsIFqY961KYxuzX3vGbVwouhQQz
 ik8FgDZLGYnmcK/wYxvm6zW8PFY+Z5VTTRXJXHAH5fTCVu26af795nwaVHxInjqxlJoD
 Ypo8gnLH4AqjLeMSFFSB4nCkVEYNbTnuLJM9gTLI/IxYz+6WNlc5FJztHC4QepS+LQ0x
 j1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=P1m+5CvuP9WCDPeB2rpqQfl3ZDcAcnZi8bxAc6P+hRk=;
 b=cYhBXNdKz50qTgeaDCKNKliBViq78VlRnU44eJrj3a0X4TJW6qkZLq60NPYV8NwUeF
 IW9FCW9W1Mm1WiN0ScXysz85MOZOGbONlqwk4oazn2TdP+EVfbhR4cSNzGJAqEx75V0I
 wKVOOcbHMQ/mVs9o+ThwPO7SzrCLKWJhJq6qP//w2SjGG6yG8HqpoePNYnrcf8HKhxVy
 TRql+WFIAnhpkPcDJnRZAZqboLctK8DSTKDA/xAvFA+RBPPj2JCCYW0CndG5BDxVz050
 TARzcQ6rcmJUVQmcBcDTp5sQTKSF+uRdzBIgWP/DFdG9HpB0d0zAaD0EKsaIt9GP8ORh
 QsyQ==
X-Gm-Message-State: APjAAAVmkyyfgcDVuia9ZpZ9hE07JoY1gAA9p2xQC7yIiUqY21Q/fEmP
 HUx/TjYsc5xhyVnLpYXilggbiYw=
X-Google-Smtp-Source: APXvYqwowHvFtBe6LpkACUng2s38E8ahG4DvKaIDLCfgUrVAiTcya7q3HI8cDbC0aT0bMh1HGsTSXA==
X-Received: by 2002:aa7:9359:: with SMTP id 25mr41508430pfn.188.1582354573071; 
 Fri, 21 Feb 2020 22:56:13 -0800 (PST)
Received: from madhuparna-HP-Notebook ([42.109.147.216])
 by smtp.gmail.com with ESMTPSA id z127sm4456084pgb.64.2020.02.21.22.56.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 21 Feb 2020 22:56:12 -0800 (PST)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Sat, 22 Feb 2020 12:25:36 +0530
To: Jiri Pirko <jiri@resnulli.us>
Message-ID: <20200222065536.GA9143@madhuparna-HP-Notebook>
References: <20200221180943.17415-1-madhuparnabhowmik10@gmail.com>
 <20200222062640.GA2228@nanopsycho>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200222062640.GA2228@nanopsycho>
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

On Sat, Feb 22, 2020 at 07:26:40AM +0100, Jiri Pirko wrote:
> Fri, Feb 21, 2020 at 07:09:43PM CET, madhuparnabhowmik10@gmail.com wrote:
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
> > net/core/devlink.c | 3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> >
> >diff --git a/net/core/devlink.c b/net/core/devlink.c
> >index 3e8c94155d93..d54e1f156b6f 100644
> >--- a/net/core/devlink.c
> >+++ b/net/core/devlink.c
> >@@ -6840,6 +6840,8 @@ int devlink_dpipe_table_register(struct devlink *devlink,
> > {
> > 	struct devlink_dpipe_table *table;
> > 
> >+	mutex_lock(&devlink->lock);
> >+
> > 	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name))
> > 		return -EEXIST;
> 
> You have to handle the error path.
>
Sure, I have sent the updated patch.

Thank you,
Madhuparna
> 
> > 
> >@@ -6855,7 +6857,6 @@ int devlink_dpipe_table_register(struct devlink *devlink,
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
