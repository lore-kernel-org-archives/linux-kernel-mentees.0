Return-Path: <SRS0=D7LL=ZE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF25FC43331
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Nov 2019 07:06:47 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B36DA2067B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Nov 2019 07:06:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgqIdL6f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B36DA2067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7E889CB6;
	Tue, 12 Nov 2019 07:06:47 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6241DCB2
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 07:06:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 047CFDF
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 07:06:44 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id p24so12693964pfn.4
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 11 Nov 2019 23:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ql1jIUeiY1C+T9LmSMtc8/U6bCDKCcN1H4rKQhpHe/0=;
	b=GgqIdL6fGJCr52h3bBiwOZ91GQso8g/u0NSxUoU843cCxITwTIK4te7Kg45C0R79bi
	lcuGiZB+F+5cn0xci/il1FZ8VFTE0SpXvbFxA1qnlwb+7k3AGfpBZVq2147wAZIic4Td
	qOr5ui7JVwZQGCO3zOmv5vQu3blUPI29tuAEjAuCRo9J33o1ZfzN3N4+CYxkG3khT720
	LuxsauggumYUcqoAFrRtFEuQqiSEshgoN8QN4gwkMydeEKpXJ5LqOly5p1oG5bN+DTFT
	HxT1ODX/G9efYmZqd6bpOCCPYJ9Kos+r85/e+pc77jqRBcxNSB2N8rLqSyElxw8CpGJa
	dZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ql1jIUeiY1C+T9LmSMtc8/U6bCDKCcN1H4rKQhpHe/0=;
	b=qXFHyrU2neR3zJY7e227L3SsATijEAr5EB6jFw6bspR2fGlUqNwh/6DLP7PczpgSO/
	t2cgk6gzgBDqbUKEBVNRJ/4/TkCr1FZpgTUb96siU8cm3fHClKjwgzvMYcQDhh7doxdV
	ENE21obWLxokt/H27p6CCYO0ohn0aj0Aw+qOrOA3mAdQQJAtIwbx09qzB3S2iSUgZSTh
	SIbSGPnLKwAXBdkGuHLbOLekVua4d9RlOvcbQ+YqpRRCxTuFkYEMTEEkUd/O+tNuMQXi
	4LdnGbhzKwbrs0+8rOJg3/Bjh5GGiyyHrcbWB3gfvdUU7jB4NQgLme+qJsyUs6PVVo5D
	gkkA==
X-Gm-Message-State: APjAAAW5UE4NcNqipVbqKcwEHgry0i6ziliBI1jztbrL8IyXfyhr7yYM
	InyoUFlazsoNYW9mPdEBK+4=
X-Google-Smtp-Source: APXvYqwsbPm6gC6wIu0VgkQMTf+DYXTY585sOnUoaTQ6eOTwS/0nh5E9s5+rfZdvUBr0QuyW9Kj2qw==
X-Received: by 2002:a17:90b:4386:: with SMTP id
	in6mr4396434pjb.33.1573542404409; 
	Mon, 11 Nov 2019 23:06:44 -0800 (PST)
Received: from workstation-kernel-dev ([139.5.252.152])
	by smtp.gmail.com with ESMTPSA id
	x2sm23519376pfj.90.2019.11.11.23.06.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 11 Nov 2019 23:06:43 -0800 (PST)
Date: Tue, 12 Nov 2019 12:36:38 +0530
From: Amol Grover <frextrite@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Message-ID: <20191112070638.GA2561@workstation-kernel-dev>
References: <20191111181122.28083-1-madhuparnabhowmik04@gmail.com>
	<20191111213659.GP2865@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191111213659.GP2865@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org, joel@joelfernandes.org, mchehab@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: RCU: whatisRCU:
 Updated full list of RCU API
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
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
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

On Mon, Nov 11, 2019 at 01:36:59PM -0800, Paul E. McKenney wrote:
> On Mon, Nov 11, 2019 at 11:41:22PM +0530, madhuparnabhowmik04@gmail.com wrote:
> > From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> > 
> > This patch updates the list of RCU API in whatisRCU.rst.
> > 
> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> 
> Queued, thank you!  Phong, Amol, could you please take a look at this?

Tested-by: Amol Grover <frextrite@gmail.com>

Thanks
Amol

> 
> 						Thanx, Paul
> 
> > ---
> >  Documentation/RCU/whatisRCU.rst | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/RCU/whatisRCU.rst b/Documentation/RCU/whatisRCU.rst
> > index 2f6f6ebbc8b0..c7f147b8034f 100644
> > --- a/Documentation/RCU/whatisRCU.rst
> > +++ b/Documentation/RCU/whatisRCU.rst
> > @@ -884,11 +884,14 @@ in docbook.  Here is the list, by category.
> >  RCU list traversal::
> >  
> >  	list_entry_rcu
> > +	list_entry_lockless
> >  	list_first_entry_rcu
> >  	list_next_rcu
> >  	list_for_each_entry_rcu
> >  	list_for_each_entry_continue_rcu
> >  	list_for_each_entry_from_rcu
> > +	list_first_or_null_rcu
> > +	list_next_or_null_rcu
> >  	hlist_first_rcu
> >  	hlist_next_rcu
> >  	hlist_pprev_rcu
> > @@ -902,7 +905,7 @@ RCU list traversal::
> >  	hlist_bl_first_rcu
> >  	hlist_bl_for_each_entry_rcu
> >  
> > -RCU pointer/list udate::
> > +RCU pointer/list update::
> >  
> >  	rcu_assign_pointer
> >  	list_add_rcu
> > @@ -912,10 +915,12 @@ RCU pointer/list udate::
> >  	hlist_add_behind_rcu
> >  	hlist_add_before_rcu
> >  	hlist_add_head_rcu
> > +	hlist_add_tail_rcu
> >  	hlist_del_rcu
> >  	hlist_del_init_rcu
> >  	hlist_replace_rcu
> > -	list_splice_init_rcu()
> > +	list_splice_init_rcu
> > +	list_splice_tail_init_rcu
> >  	hlist_nulls_del_init_rcu
> >  	hlist_nulls_del_rcu
> >  	hlist_nulls_add_head_rcu
> > -- 
> > 2.17.1
> > 
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
