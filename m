Return-Path: <SRS0=/QZw=DF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E211C2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Sep 2020 15:09:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D38F3207F7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Sep 2020 15:09:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciYhFjNw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D38F3207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8DAE086156;
	Mon, 28 Sep 2020 15:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n7vE-V+96Prd; Mon, 28 Sep 2020 15:09:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 25BB6860BE;
	Mon, 28 Sep 2020 15:09:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C2D7C0891;
	Mon, 28 Sep 2020 15:09:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7FEAC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 15:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A142F860BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 15:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZQ9LHDVdbkCB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 15:09:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 93C4F85C0B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 15:09:55 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id b12so1715940edz.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 08:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=EE9igE5I6DePnCirYVsWHsPj5ViGI89MPl64CKtnXO0=;
 b=ciYhFjNwDLiFoCKdTQfH8knnkYs+it7u1R8IDbf695XaMyXVXhB6/R6RH5LJPU0mRO
 LUr6jhCkZ0Md/yEd03UPf7T2DKYbwx+J8p/nrbBchQ08juuabCh+eEkx4L26HMhwPyBo
 MDCrPXH/SrAP4CWI78KikZQ03sTTBv+4yk4KWmQuqi2YNyC33jH/7BMW2TvNHYRUVYsi
 /ad3oRzSN0pkIw9KwmU4rJV1L8Jiruu4OEj9RwQMPyynlxtypAFGmkNQUm26v0H3ruJn
 4qRANTak/t9i4Vo1SDvQemcRmhwxAKNCiFOgg5LCttfLzuFfNfm7/kUvL9K5qkj4C1dd
 Y3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=EE9igE5I6DePnCirYVsWHsPj5ViGI89MPl64CKtnXO0=;
 b=E6J2a+Ey7l76S9YLvJW6RJxdnRr1siPMvBQHAvpuPpbaCYmpnBzHGJsl1VBs9jSED/
 0cCzMbc4KCxRK0H7zn6sUrNeFbXFSiqPrad1FAXqJTloEYhKbLd4eZ6/gvaz92q82SBT
 T9k2eXNNnhV+4x696fhSWYx7JNHveQELUZSHctWfIDFP6zAYu3LyRKkEZHnj5LImFZo4
 hrQH9nmaLJBV2CCJlTqaO+sNfaPxxQCDFkLNHNN24EJWoLkTtBJz+3kK7kvHYYJKSTr5
 GmwGBe9U/9MI7mrZPI5WVGJ/fkqV3jlt9UZYFik4DNGckJ7OTRn/UC1wOKo32Ygkwizl
 T7dQ==
X-Gm-Message-State: AOAM5309r/P42zfbDphFFct5K1aA/HMJy2BC4AM5n/1G/wu2olFljYas
 Kr+3xccCWsydtWGICcJreE4=
X-Google-Smtp-Source: ABdhPJxvNnsSYQDkgyYeRP5guLtY+V+a9p3mT9PGG/90yTDvupD0YP4lhu+gslbWjaOUmWqTgYOfhg==
X-Received: by 2002:a05:6402:718:: with SMTP id
 w24mr2295008edx.294.1601305794094; 
 Mon, 28 Sep 2020 08:09:54 -0700 (PDT)
Received: from felia ([2001:16b8:2d9d:5000:7872:7299:adfa:b749])
 by smtp.gmail.com with ESMTPSA id q12sm2067330edj.19.2020.09.28.08.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 08:09:53 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 28 Sep 2020 17:09:52 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5Dws9Q_5A0LeSWSTb-dgSQiguU5rOF-cEvDTTrfonfmEQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009281706250.4154@felia>
References: <alpine.DEB.2.21.2009181157160.14717@felia>
 <CABJPP5A8kaaFqR9Sm-rS6uuWb6CdbnkLLPXWpgp8XeEgC9uOJw@mail.gmail.com>
 <alpine.DEB.2.21.2009211112460.7483@felia>
 <CABJPP5B6D2ttt5D1ROrQNy7BDMcp+CBg6QB3vFRac4H10CkvCw@mail.gmail.com>
 <alpine.DEB.2.21.2009222028250.20644@felia>
 <CABJPP5B9RsGXCCAHxve2hxmCSyPX3C5aO_5MU9QMtNm08cXiNg@mail.gmail.com>
 <alpine.DEB.2.21.2009230925520.6068@felia>
 <CABJPP5CQxXdAD5fFRZaApjh2GJJ_2Dd1Q=6phS-61iLrU5qb9Q@mail.gmail.com>
 <alpine.DEB.2.21.2009230941250.6068@felia>
 <CABJPP5B8GJWPBqeb1RhJknN-4Q0_nQfU9M=Oy+K=Fwe02cgoag@mail.gmail.com>
 <alpine.DEB.2.21.2009250854230.5992@felia>
 <CABJPP5Chc5+tNda3af88=pUC2XN8bEga4FiP=+KBwyx0UWOmyA@mail.gmail.com>
 <alpine.DEB.2.21.2009250930570.5992@felia>
 <CABJPP5B8mfAi3MMS4xWbArJe=FcMBTF9U8qvXmaicGj5WKiGBQ@mail.gmail.com>
 <CABJPP5A46fh=Eth7RwXYHarcS11kyHMCUMrRfvvJ3_8oafAkJA@mail.gmail.com>
 <alpine.DEB.2.21.2009281608130.4154@felia>
 <CABJPP5Dws9Q_5A0LeSWSTb-dgSQiguU5rOF-cEvDTTrfonfmEQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl investigation:
	NO_AUTHOR_SIGN_OFF issues
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



On Mon, 28 Sep 2020, Dwaipayan Ray wrote:

> >
> > How about just starting a new thread instead?
> >
> > I will answer on the new thread.
> >
> > Lukas
> >
> 
> Sure, I will.
> 
> Also did my last mail go through to you?
>

Yes, that went through. I just did not have some immediate thought on any 
further response. I think it is a good idea but I had no strong feeling on 
louding rejecting or loudly raising acknowledgement to the idea.

Just go for it.

Lukas
 
> Quoted:
> > So I did run my script to evaluate the type of errors that were generated.
> > My results are from commits between v5.7 and v5.8
> >
> > 1) Same address, different name
> > There were 32 such instances. In general, there was no regularity in the
> > specific error.
> >
> > There were some cases with letter case mismatch. Like there was one
> > committer who used the names "Arend Van Spriel", and "Arend van Spriel".
> > I believe this error should not be generated and matching be made case
> > neutral.
> >
> > Apart from this, the rest of the cases in this category were some with missing
> > first or last names, using names in other languages or having commas in
> > one name, using initials etc. These should be warned about.
> >
> > 2) Same name, different address
> > There were 204 such instances. Most of them were of the form in which they
> > used a completely different email address.
> >
> > Only one case was found with an email extension.
> > <hpeter@gmail.com>
> > <hpeter+linux_kernel@gmail.com>
> > in commit 423d9118c624
> >
> > So in general I think most email mismatches should be specified by a WARN
> > and for email extension there should be a --strict CHECK.
> > What do you think of this?
> >
> > Thanks,
> > Dwaipayan.
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
