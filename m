Return-Path: <SRS0=Qgc5=GK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_RED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E0EC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Jan 2021 21:16:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4639D23441
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Jan 2021 21:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4639D23441
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 001FA86FA0;
	Thu,  7 Jan 2021 21:16:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rCA8qt3C5sot; Thu,  7 Jan 2021 21:16:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6DE7786F1B;
	Thu,  7 Jan 2021 21:16:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5EC16C0891;
	Thu,  7 Jan 2021 21:16:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3BDBFC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Jan 2021 21:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2AC71869A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Jan 2021 21:16:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3-StHPUianRt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Jan 2021 21:16:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 633DB85551
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Jan 2021 21:16:28 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id q4so4376067plr.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 07 Jan 2021 13:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=5fzui2ssAAjv83Q95dR6yA7Ay+ceGXA4laR9uMk3EkM=;
 b=bufj13b1pA5CWLI2Pq822s7h/8DoilsrlNu+qzeY8SID580HNOAAfi1Qmh+Hb7COCv
 E+H3U7qyZ5LHSBh4/SpGg4SUnTyk/CrWGS2+5mvmFMpg2DKqUzDI/DJy0BRJg85FEUK4
 O9sJ+u6wIL66sK2CC5RNwpWxC612Esbrx4Pe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5fzui2ssAAjv83Q95dR6yA7Ay+ceGXA4laR9uMk3EkM=;
 b=dAd/a0C462mN0QYqkWgkRLa5U6c/HNu6kzLmYMF+A2p2TOv8YD2Y2V3YF9zhp8NM/8
 qI4BbKGbueg95GNtj0FCZOk6TQH0jU6D+pygTZJKLqwfYkDV7aLZkKvKYJlKWs3Dujcw
 +6prtA17olV1BKbFZAsEA3f175PqNc07MSVafGvZfBDDApBb1Kblzy5CtFAjOVCbPf+j
 1ZmKkqfTDaLrnvAfVdVSUDrnwTDL/hgqHtRD7WkMbTHCDRJNmjZ4fAtoZJ1x7d6CvhFg
 Dt8cmWTMMD1zQyTxzUGlebXFLoVQ/p4sGf1dHERQosZU+5CFHo6v2x/+nXkEXVEkB50a
 61tQ==
X-Gm-Message-State: AOAM530FHPt4SLadgl/i5WT7F+Za6by6SM9KLUaHj01HZmPqP6D6tpIx
 in0VjfkvsBrOChfbLmFRHRqpPw==
X-Google-Smtp-Source: ABdhPJwRqig6SLkglfxKbRByV3jzPWHK3fgtkRRkHE9Tz+rnFZX3ekd8S09rx+presosDommRKJtrw==
X-Received: by 2002:a17:90a:730b:: with SMTP id
 m11mr394327pjk.76.1610054188001; 
 Thu, 07 Jan 2021 13:16:28 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id v3sm6349833pjn.7.2021.01.07.13.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 13:16:27 -0800 (PST)
Date: Thu, 7 Jan 2021 13:16:26 -0800
From: Kees Cook <keescook@chromium.org>
To: Joe Perches <joe@perches.com>
Message-ID: <202101071310.3AC5F0C4@keescook>
References: <20210105082303.15310-1-dwaipayanray1@gmail.com>
 <50cc861121b62b3c1518222f24f679c3f72b868d.camel@perches.com>
 <CABJPP5DQ0Y42z9ej_j06+KaQevT3ztWcwGMkismj4qv5EHvnxA@mail.gmail.com>
 <3ffe616d8c3fb54833bfc4d86cb73427cf6c7add.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ffe616d8c3fb54833bfc4d86cb73427cf6c7add.camel@perches.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [Linux-kernel-mentees] deprecated.rst: deprecated strcpy ?
 (was: [PATCH] checkpatch: add a new check for strcpy/strlcpy uses)
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Jan 05, 2021 at 01:28:18AM -0800, Joe Perches wrote:
> On Tue, 2021-01-05 at 14:29 +0530, Dwaipayan Ray wrote:
> > On Tue, Jan 5, 2021 at 2:14 PM Joe Perches <joe@perches.com> wrote:
> > > =

> > > On Tue, 2021-01-05 at 13:53 +0530, Dwaipayan Ray wrote:
> > > > strcpy() performs no bounds checking on the destination buffer.
> > > > This could result in linear overflows beyond the end of the buffer.
> > > > =

> > > > strlcpy() reads the entire source buffer first. This read
> > > > may exceed the destination size limit. This can be both inefficient
> > > > and lead to linear read overflows.
> > > > =

> > > > The safe replacement to both of these is to use strscpy() instead.
> > > > Add a new checkpatch warning which alerts the user on finding usage=
 of
> > > > strcpy() or strlcpy().
> > > =

> > > I do not believe that strscpy is preferred over strcpy.
> > > =

> > > When the size of the output buffer is known to be larger
> > > than the input, strcpy is faster.
> > > =

> > > There are about 2k uses of strcpy.
> > > Is there a use where strcpy use actually matters?
> > > I don't know offhand...
> > > =

> > > But I believe compilers do not optimize away the uses of strscpy
> > > to a simple memcpy like they do for strcpy with a const from
> > > =

> > > =A0=A0=A0=A0=A0=A0=A0=A0strcpy(foo, "bar");
> > > =

> > =

> > Yes the optimization here definitely helps. So in case the programmer
> > knows that the destination buffer is always larger, then strcpy() shoul=
d be
> > preferred? I think the documentation might have been too strict about
> > strcpy() uses here:
> > =

> > Documentation/process/deprecated.rst:
> > "strcpy() performs no bounds checking on the destination buffer. This
> > could result in linear overflows beyond the end of the buffer, leading =
to
> > all kinds of misbehaviors. While `CONFIG_FORTIFY_SOURCE=3Dy` and various
> > compiler flags help reduce the risk of using this function, there is
> > no good reason to add new uses of this function. The safe replacement
> > is strscpy(),..."
> =

> Kees/Jonathan:
> =

> Perhaps this text is overly restrictive.
> =

> There are ~2k uses of strcpy in the kernel.
> =

> About half of these are where the buffer length of foo is known and the
> use is 'strcpy(foo, "bar")' so the compiler converts/optimizes away the
> strcpy to memcpy and may not even put "bar" into the string table.
> =

> I believe strscpy uses do not have this optimization.
> =

> Is there a case where the runtime costs actually matters?
> I expect so.

The original goal was to use another helper that worked on static
strings like this. Linus rejected that idea, so we're in a weird place.
I think we could perhaps build a strcpy() replacement that requires
compile-time validated arguments, and to break the build if not.

i.e.

given:
	char array[8];
	char *ptr;

allow:


	strcpy(array, "1234567");

disallow:

	strcpy(array, "12345678");	/* too long */
	strcpy(array, src);		/* not optimized, so use strscpy? */
	strcpy(ptr, "1234567");		/* unknown destination size */
	strcpy(ptr, src);		/* unknown destination size */

What do you think?

-- =

Kees Cook
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
