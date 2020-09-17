Return-Path: <SRS0=D/zP=C2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF49C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Sep 2020 15:03:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE7D72220D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Sep 2020 15:03:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ucKi77fC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE7D72220D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8991E86A0C;
	Thu, 17 Sep 2020 15:03:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2vpxfjJLwVxe; Thu, 17 Sep 2020 15:03:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1951786970;
	Thu, 17 Sep 2020 15:03:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2CFEC0888;
	Thu, 17 Sep 2020 15:03:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E97C2C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 15:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DD43185194
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 15:03:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n05su8--93g2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 15:03:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6CF6F85191
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 15:03:42 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id l17so2793330edq.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 08:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Qx+DXfKsgvWwRhv7EQ4EAmhNB3po0t8P6upG2hAGMN8=;
 b=ucKi77fCdevhXuA5vSzpCt/b9vLCDY5CKadml5Bz4bFzvgBSci1BpY7uN4A1vTGprl
 f7KzOs/JLkEjisGOxZ2QNPRuyalgXoT5JnYEAd9Y1OTbgw0E7r5gaykc6WxZycsxjpAo
 QF0+a8ddJvj9siehfpAqufK3mHyOhtd+cDP2/flm0jFMvebWcoNxGVhR3SsF9ixKjNiO
 idC4333HeZ3M7Mo9EEMUGAKhvKHeSVxae5izUvjpIfw4q+YK0mO/FiKDiof4vrl0bBD2
 SDj4wWuDNq1nzBVv1Jpxnf6Tutpp4ZdUnSpSFSRkM5WIQZxsS4gvt3zaQZzrOoaESaIC
 Y1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Qx+DXfKsgvWwRhv7EQ4EAmhNB3po0t8P6upG2hAGMN8=;
 b=GVajbLacnmN5XKZkm8QhglqGvk/4UALN8KMltca9RNIfQZP5owhxV4+fm6oj6C2p5t
 qRR9oRV4VEM0+RvCEwvZ9gbPJVcfkJGwKam/mHT6/Jxzl/j7ZsCRo74kJYGw28bFHlQZ
 Lwm7NQN5gqdtHArOwj4FyYrgN4CUPl5qD+cqkqLh8RKuH+zrELREkLYjnWzJJPVPyL3n
 cQ61vbWgz1sD2/pomzp9Mb1lUQAkxnbdD5Hax1Ck+xo4mNVnQi6q/WnHHlGBayCchd8L
 CFDW0zaOQoJqgIsQtWDckfWH87bx1piUcuFjZRenWcnH3iuLMqbkYYWFBIliV1rnRc3Q
 RIFw==
X-Gm-Message-State: AOAM533fE7F9iwBF6nJjkf6KBL2QgGupYJ1sE8sS28wAq3gKb767OQ/n
 c/NPIb0u8D5CctX7HljK1zQ=
X-Google-Smtp-Source: ABdhPJyewDaLn6JmBrSGGe/cVOlE+xJzHfG5Ila/uKp5FfGeGIhOOLj7HLgzvRjqP6muLvrLWzYSEA==
X-Received: by 2002:aa7:d353:: with SMTP id m19mr32368231edr.275.1600355020769; 
 Thu, 17 Sep 2020 08:03:40 -0700 (PDT)
Received: from felia ([2001:16b8:2da3:1100:b096:8628:b410:46b3])
 by smtp.gmail.com with ESMTPSA id k10sm16699675edo.36.2020.09.17.08.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 08:03:40 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Thu, 17 Sep 2020 17:03:39 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5CQc8WMQU2yLbW9OVrd8bdDNFJsKTqjonOsqQHCk5G1TA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009171654520.9985@felia>
References: <CABJPP5CSa_QowD-O3_E5ndoQJvuBv=n2x5WG-acwQKE=rt5+Rw@mail.gmail.com>
 <alpine.DEB.2.21.2009131301570.22585@felia>
 <CABJPP5BmRcC+OTSjuX_QrYononVq__DkhjGOgiKrP147MAXK+g@mail.gmail.com>
 <alpine.DEB.2.21.2009132010300.6806@felia>
 <CABJPP5BaUss9pWq=e+UDmVvr-puJsBtSVppST+CTcB8JkEdLmQ@mail.gmail.com>
 <alpine.DEB.2.21.2009140716420.7737@felia>
 <CABJPP5D87ZVTfZ4QHxp5vweTN16LQCy+rniq-uDVCvKkbYRDNg@mail.gmail.com>
 <alpine.DEB.2.21.2009141535010.17999@felia>
 <CABJPP5Aniv2kQ4wfAD9JuR_7Q5pjChasHZTAvBWOOaza4H3VSg@mail.gmail.com>
 <alpine.DEB.2.21.2009142016150.6496@felia>
 <CABJPP5DhzCHz6PM7bLzW9s1=VckN_+qnaUuYO148xSL59Q-pkA@mail.gmail.com>
 <alpine.DEB.2.21.2009160837380.10877@felia>
 <CABJPP5Dtz7VagfY+h2Qcm=XH6W7EQxXv1QReJLU9pnz2Jp_coQ@mail.gmail.com>
 <CABJPP5BBUsSQBDi1QbL7xgVdRUqMG7OWXcNSUKsMN601Y3EYbw@mail.gmail.com>
 <alpine.DEB.2.21.2009171614150.9985@felia>
 <CABJPP5CQc8WMQU2yLbW9OVrd8bdDNFJsKTqjonOsqQHCk5G1TA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Linux kernel checkpatch.pl mentorship
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



On Thu, 17 Sep 2020, Dwaipayan Ray wrote:

> > Good investigation. Can you please share the commit of the commit message
> > you refer to in the future?
> >
> > I found it, commit cd2614967d8b ("checkpatch: warn if missing author
> > Signed-off-by"), but to convince the maintainers and authors that you did
> > your homework properly, it is good to refer to the commits you looked at.
> >
> > The kernel documentation tells you how to refer to commits.
> >
> 
> Yes sure, I will remember to do that in the future.
> 
> For now, I am thinking to fix the split FROM header issue. What I have thought
> of is to keep a variable keeping the part data and if the author cannot be
> resolved at the present line, then at the next line join the data and parse
> the email.
> I think the implementation to this will be fairly easy, with one
> flag variable to indicate whether the from header has been parsed in the
> previous line.
> 
> Should i proceed with this?
>

Sure. I suggest you just have a look at how checkpatch.pl handles rules 
when content is split over multiple lines, though. I think Ayush copied 
one typical pattern of checking the current line and the next line.

I will trust you that you will find a solution that works...

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
