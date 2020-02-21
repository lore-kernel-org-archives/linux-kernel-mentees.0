Return-Path: <SRS0=GVOk=4J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64A0C35646
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 18:00:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B79720722
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 18:00:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t+zeW3mg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B79720722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4FFDF875AE;
	Fri, 21 Feb 2020 18:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pl3vGTSAWbgV; Fri, 21 Feb 2020 18:00:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6CD1584FC0;
	Fri, 21 Feb 2020 18:00:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54991C1D81;
	Fri, 21 Feb 2020 18:00:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DAD84C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 18:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BE9CE8758A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 18:00:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TfDLt47N7sbC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 18:00:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5E58184FC0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 18:00:26 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id j4so1366547pgi.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 10:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=z+o5vmJ3WcD8niaaOHTfXdBCZlrojxir+QG2cCGfk6A=;
 b=t+zeW3mgrebrV+iIT4eJHk1R4y+Z41nbR+wradhj0hqb96NV391lKQ68T6qY21u2Sx
 oWHwkCU5+FqKAAj/4eISmcMUPtgjWvJvMEBmFQ6LZgvVT0VwSv9bl3Sy+V+Io7W1C7qM
 Fx2n4W4xEaKJ056N6cMdP8Y59n6Xbii3AvMlTH86oZZ9M85e2+aK0/XtFKNJZPAekBdQ
 WbM+XiiAlgCdbRoOh2+JXym7DCe4/MxyokCsO9GOz/OvjaPYH7CjmOs6sqWcFTEOUNSI
 v8uKrVq6Q6hjmxMGCiImrSVQzxjA2aPCs9gtaIFJSUMF6uRDgfrRfxL8LX8+dBBZM2J0
 NJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z+o5vmJ3WcD8niaaOHTfXdBCZlrojxir+QG2cCGfk6A=;
 b=f6xbktTjrQfJcPpMgnpicnlwrTORk8bhi+Yld0PCADAvYthKEdoxbiBtD0/d4nlAKX
 8wJXYlzZjfrZzx5g9YEHO4KkUGgx8/ZTHjluozZY9ChtzanUQcLNoIWY/E7sbHDML6jV
 hee+GnEU3R2ETgoiYUfaDuwH0K9MhrpiWZwnIx+u+bEi/F9LG9660wChDB3B67CS3O0w
 eWbPDLCe5BC78wX0QDBYtvHP+6Nw/Dsz0USIYYNXMEiOK6qXmLqskQ/xtPQ3UrAhsiBI
 GALV2kQASqrg8e2zwheB/RVcGFav/pxz3bleoclznXEVbaqIRTaqWUocf4E1+7boXLdA
 hebg==
X-Gm-Message-State: APjAAAVsy9kUu6ZsJwL2kiXKwXquueZresEPYbu0nMKCtlc7ba2I45qs
 nxNSied41O6NH1gUXVqv6A==
X-Google-Smtp-Source: APXvYqxud//iAviYNHnubCd8GZQM6QC6ZR1Dnjwf1LjuLqxAB2/myqBOj/I9u3irWrI/sqnCHK5zdQ==
X-Received: by 2002:a63:2cc9:: with SMTP id
 s192mr38389623pgs.441.1582308025998; 
 Fri, 21 Feb 2020 10:00:25 -0800 (PST)
Received: from madhuparna-HP-Notebook
 ([2402:3a80:1ee0:fe5e:d03d:769b:c838:c146])
 by smtp.gmail.com with ESMTPSA id p24sm3506364pff.69.2020.02.21.10.00.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 21 Feb 2020 10:00:25 -0800 (PST)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Fri, 21 Feb 2020 23:30:15 +0530
To: Jiri Pirko <jiri@resnulli.us>,
	y@madhuparna-HP-Notebook.osuosl.org
Message-ID: <20200221180015.GA16779@madhuparna-HP-Notebook>
References: <20200221165141.24630-1-madhuparnabhowmik10@gmail.com>
 <20200221172008.GA2181@nanopsycho>
 <20200221173533.GA13198@madhuparna-HP-Notebook>
 <20200221175436.GB2181@nanopsycho>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221175436.GB2181@nanopsycho>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, jiri@mellanox.com,
 joel@joelfernandes.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
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

On Fri, Feb 21, 2020 at 06:54:36PM +0100, Jiri Pirko wrote:
> Fri, Feb 21, 2020 at 06:35:34PM CET, madhuparnabhowmik10@gmail.com wrote:
> >On Fri, Feb 21, 2020 at 06:20:08PM +0100, Jiri Pirko wrote:
> >> Fri, Feb 21, 2020 at 05:51:41PM CET, madhuparnabhowmik10@gmail.com wrote:
> >> >From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> >> >
> >> >list_for_each_entry_rcu() has built-in RCU and lock checking.
> >> >
> >> >Pass cond argument to list_for_each_entry_rcu() to silence
> >> >false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled
> >> >by default.
> >> >
> >> >Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> >> 
> >> Reviewed-by: Jiri Pirko <jiri@mellanox.com>
> >> 
> >> Thanks.
> >> 
> >> However, there is a callpath where not devlink lock neither rcu read is
> >> taken:
> >> devlink_dpipe_table_register()->devlink_dpipe_table_find()
> >>
> >Hi,
> >
> >Yes I had noticed this, but I was not sure if there is some other lock
> >which is being used.
> >
> >If yes, then can you please tell me which lock is held in this case,
> >and I can add that condition as well to list_for_each_entry_rcu() usage.
> >
> >And if no lock or rcu_read_lock is held then may be we should
> >use rcu_read_lock/unlock here.
> >
> >Let me know what you think about this.
> 
> devlink->lock should be held since the beginning of
> devlink_dpipe_table_register()
>
Alright, I will send a patch with this change soon.
Thank you for the help.

Regards,
Madhuparna
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
