Return-Path: <SRS0=8tby=Z3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 990DEC2BD09
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Dec 2019 15:14:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A86924652
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Dec 2019 15:14:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iqs3hhxM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A86924652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3745F88A5B;
	Thu,  5 Dec 2019 15:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W740tnTTO94W; Thu,  5 Dec 2019 15:14:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 18CD588A4E;
	Thu,  5 Dec 2019 15:14:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0394DC1DD7;
	Thu,  5 Dec 2019 15:14:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21684C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 15:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 15CEF204AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 15:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dP7QgayeI8ZT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 15:14:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id B8036204A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 15:14:26 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q8so1750848pfh.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 05 Dec 2019 07:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4KrZ84UljluamxNF+nH5kh1soJy0EOumBh8z5AiXj1M=;
 b=Iqs3hhxMyajp6V6jOD9k8vmFZgFnE7RlH5Y5SIFEW8fHtSiT8WMNdMvH4Orv5qsVnY
 ISzL7S362NFaevFh8wcBCvOnjDMqjeRa3xqLJXIk7QgpiCsap+7/QOAVOCI78pX52ki/
 1iGqAct3hgHONi8QTfRTdMj/DFNsuBZyY8uIzcLhqDydv1LPSqccgf0eayjyO7lLusS9
 Jloht0wmQC3Kwcf6ISB50SO/CZsro7ORzKDPuxdt0ItadsFYasg6pYViQvzfHeJm9phH
 ty6sWpUnWREW4jEYCpVEw8a3W+5Drw2jihWJmNNWDDHx1kTvpoICF8bWE1PV+L42jQfB
 lpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4KrZ84UljluamxNF+nH5kh1soJy0EOumBh8z5AiXj1M=;
 b=APWRVHe2bqifFOKeeLpDRNCMi/QKjupgd8WUP3ShIcUHNbw5KRuaCYadK2uiZ+N1uP
 hWdFYxzfs3YKLgYPGnvLiQAu/B1lvgEr2uW8KmLIqb9w1aH0eQ1TmlHhmxKs/DLuO2Mq
 tC8sgxA0Y+Xrr7bhD86t2YthdpiNkqTK4DekPwMv0k8Nm4eAK/afCL6L3sLTJ6GGASBx
 QQe317m20SvbDxfwf8bfW99wj58PF9WtyoYYRprSFNxHAhKKXFUjzCtw1ykRhPCxuHru
 SCDxiyMt5uPg+bP058x80N+YdBuNd7ZcL6AyJZvaPFBdipxa9FKVAPpvUHlUKzrOrRrw
 pXjg==
X-Gm-Message-State: APjAAAXiM43GQYjCC0+bnPv2wJ9O/cNDkC9AfHQTVsoxRTglIFSvWYl0
 BT7n4WxA6oFl9slX/2V+rWc=
X-Google-Smtp-Source: APXvYqy/oc7fJO2/PLyS5gTXvu0Yq0ItJ+u+B2pLMSWHPIMKM4VcXxZPSU3Y9Rq9/t32w3QA2avRRg==
X-Received: by 2002:a63:ec0a:: with SMTP id j10mr7305169pgh.178.1575558866248; 
 Thu, 05 Dec 2019 07:14:26 -0800 (PST)
Received: from workstation-kernel-dev ([103.211.17.187])
 by smtp.gmail.com with ESMTPSA id x13sm13397674pfc.171.2019.12.05.07.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 07:14:25 -0800 (PST)
Date: Thu, 5 Dec 2019 20:44:18 +0530
From: Amol Grover <frextrite@gmail.com>
To: Joel Fernandes <joel@joelfernandes.org>
Message-ID: <20191205151418.GA3424@workstation-kernel-dev>
References: <20191203063941.6981-1-frextrite@gmail.com>
 <20191203064132.38d75348@lwn.net>
 <20191204082412.GA6959@workstation-kernel-dev>
 <20191204074833.44bcc079@lwn.net>
 <20191204153958.GA17404@google.com>
 <20191204084729.184480f3@lwn.net>
 <20191204163552.GE17404@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191204163552.GE17404@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: "Paul E . McKenney" <paulmck@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] doc: listRCU: Add some more
 listRCU patterns in the kernel
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

On Wed, Dec 04, 2019 at 11:35:52AM -0500, Joel Fernandes wrote:
> On Wed, Dec 04, 2019 at 08:47:29AM -0700, Jonathan Corbet wrote:
> > On Wed, 4 Dec 2019 10:39:58 -0500
> > Joel Fernandes <joel@joelfernandes.org> wrote:
> > 
> > > Actually I had asked Amol privately to add the backticks. It appeared
> > > super weird in my browser when some function calls were rendered
> > > monospace while others weren't. Not all functions were successfully
> > > cross referenced for me. May be it is my kernel version?
> > 
> > If you have an example of a failure to cross-reference a function that
> > has kerneldoc comments *that are included in the toctree*, I'd like to see
> > it; that's a bug.
> > 
> > Changing the font on functions without anything to cross-reference to is
> > easy enough and should probably be done; I'll look into it when I get a
> > chance.
> 
> I tried on a different machine (my work machine) and the cross-referencing is
> working fine. So I am not sure if this could be something related to Sphinx
> version or I had used an older kernel tree before. This kernel tree is
> Linus's master.
> 

This is great! I'll remove the "``" from function text and send in the
updated version. However, should I leave in the "``CONSTANTS``" and
"``variables``"? They dont' have any kernel docs to be cross-referenced
with and also make them distinguishable from the normal text.

Thanks
Amol

> thanks,
> 
>  - Joel
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
