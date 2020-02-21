Return-Path: <SRS0=GVOk=4J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF73C35646
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 17:36:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 131ED24650
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 17:36:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7JCJhFZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 131ED24650
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CEC2C86E2A;
	Fri, 21 Feb 2020 17:36:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P37crxieuu-H; Fri, 21 Feb 2020 17:36:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4995686DEB;
	Fri, 21 Feb 2020 17:36:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3635FC1D81;
	Fri, 21 Feb 2020 17:36:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88502C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 17:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7411C864AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 17:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mBJTKHEIXCuu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 17:36:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E22B0864AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 17:36:18 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id e8so1137484plt.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 09:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xCuUVG8i9sUDnafZb9V7mQjHX9/dckJtwGg3rmaaHo4=;
 b=I7JCJhFZz8SRs2jNQKKGxgwzmYk7nx4qwqEm8xoUGhzbEX+jz77yNShT8//TUNew7o
 m9B2eLslNGYfGQ2F335wUDgqaUROFv6w8orB6SPR2bL80icZ6IVgKkbAHw/OZP9m0W42
 jJqOp8HalM194W7hG3xcHHTwJcZko+ncvfVT5MDko2o3akKrx3F2KNPPghDsPPu9NGvQ
 oj85orP2I77EIa0H3YQq71kOdC+jULP1NmHTZN/Fm2lgda/i7xjO+iwgfxDY5+Gu0gfP
 BZjn0BMzUEWVqzP3qGhtYJg/72AvYi60eYSO7NNZxmb+gqgGNoFeppczIl2n2chtkzzA
 UPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xCuUVG8i9sUDnafZb9V7mQjHX9/dckJtwGg3rmaaHo4=;
 b=Sg93iqyCj3b+cjm4YXufGAaTT36hptoQvPcyndgl4wPzxbskW+nsOTvu5QVx1a34V1
 YNVbfIQZhxh+jDv84M2y6dqiR2vD1QRLss1Y/sEwCxKn1pV5/wRMG2GVsD33+2W1ShL+
 Lpvu7CeNgq7o7yQcUVcC1bk5Q98qiBo0WMhTeSwxMI+6MUPqTaDSnnHEZHaaZCICWcn4
 SlCFSIoS7q3aPlpomf0DPHlZS86/US71X5MF8S11IQ/OsmANcUoIHAVqHp7+XfXtsIHw
 c3uP9NMhCkDdRNU3+Ms00+T2RObzPyKxvJDBwHfDfPVFWI0cervLe2vvUVnJmsM89EbJ
 69dQ==
X-Gm-Message-State: APjAAAWuKC6ci30DbRXO8n/+FrFnFD/CJygLTj4Svh5TQY3aTfA7lVvh
 tLmf9hTBxUikFHfBlrmjQQ==
X-Google-Smtp-Source: APXvYqyViuIGu2NMjKXfV2oi5e71Y2nv4Ub8Ajrnm77/jV9pFx3oWcpx0XVU8lPi+Cpf68UC7E4Sjg==
X-Received: by 2002:a17:90a:c084:: with SMTP id
 o4mr4192690pjs.35.1582306578445; 
 Fri, 21 Feb 2020 09:36:18 -0800 (PST)
Received: from madhuparna-HP-Notebook
 ([2402:3a80:1ee0:fe5e:d03d:769b:c838:c146])
 by smtp.gmail.com with ESMTPSA id l15sm3044096pgi.31.2020.02.21.09.35.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 21 Feb 2020 09:36:17 -0800 (PST)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Fri, 21 Feb 2020 23:05:34 +0530
To: Jiri Pirko <jiri@resnulli.us>
Message-ID: <20200221173533.GA13198@madhuparna-HP-Notebook>
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
>
Hi,

Yes I had noticed this, but I was not sure if there is some other lock
which is being used.

If yes, then can you please tell me which lock is held in this case,
and I can add that condition as well to list_for_each_entry_rcu() usage.

And if no lock or rcu_read_lock is held then may be we should
use rcu_read_lock/unlock here.

Let me know what you think about this.

Thank you,
Madhuparna

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
