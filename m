Return-Path: <SRS0=ImFK=EY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1516C56202
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 20:23:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4059C20706
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 20:23:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KU8Gjb7m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4059C20706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A72D687241;
	Wed, 18 Nov 2020 20:23:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1BcjUBQzz0W4; Wed, 18 Nov 2020 20:23:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 98E2187236;
	Wed, 18 Nov 2020 20:23:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78BAFC0891;
	Wed, 18 Nov 2020 20:23:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2894C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 20:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C9C5E86A7D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 20:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hXIUQ4kblWS4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 20:23:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DDFF782070
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 20:23:25 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id e139so4906984lfd.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 12:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=20CZ0mMTdqYZmScmnhKZcCAXu1Wndcjz7koPln1t+qY=;
 b=KU8Gjb7mHayD7Jt1lL9faSUPJQWG73iP7Y43UvTA0kQcuAdKqOtNSZX5H/qYBr4Awf
 d1HGNZLYZBLh3xw3BHf5kAX7nHOEEoi1807t9wVRhxpG6zOBtNiG8ZhnP1l53efYfJsH
 9YQqde7EBATjwEpD/P2xJ29kUh29ltT79qR0Kwl5RNKkBFmV3YnNeahTb3V3Gc6oymzw
 ziDJBZmh1udwnAwNvawMwDvcFfV6wKutN66iqLTH/LX98vnpjW0s66a4Co7NAjgm9ZJ2
 Z4tPyLjcWu4/OG3wchFU0SL3qvUjds1OJthBQ6/Cthmhe8+lN7MgoMAbEK8PGB/LjYu+
 bVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=20CZ0mMTdqYZmScmnhKZcCAXu1Wndcjz7koPln1t+qY=;
 b=lLXSzKO5d4ngvZEQbKwWqcRr/ccP7NTY6X5dgsn3SvgvAvrcHfDPDruy1g6VyPLgzO
 f/8AfP28FdcpiXsAb8UeRwrourrlHClHVsPxkWgikIhiB174G6XyU6QQ/sM2XCsDzaIu
 Ci3Ki7H7bE4LXiWAKRklgp9QsHDiMNK5Pp+vdfGV5ZZi6YODiHUXxZcd/zQcYuIuerQN
 GEkB5pL3g3QtA0VKUAFSIi1dj/vWg+OAIEiW1iscOdyochkADYDHObVhNLS6dlOeJHom
 u1tlsMHZ1nXJ10ur+tXk/rIlGdeeimNvQqKCXMQFxCtV6NFG/hJQ6adPYTPmTY1kwXoV
 ZvRA==
X-Gm-Message-State: AOAM532lcutL/SzBrqd56YjS3sx0YmbhX69nclsDlrKOickTn4I/N+t4
 5BF/ZV5UIAnfuMl7dn7GyROjYAnsIq9MiS/g/nE=
X-Google-Smtp-Source: ABdhPJygARz6iDkAvScV3Pe7WNMax5IbCJBi8REKGbfjygwxixZm/JA0DMP266qu5T/9Xc55mkAj5Zq9/alOGahZjg8=
X-Received: by 2002:a19:8110:: with SMTP id c16mr4198068lfd.372.1605731003760; 
 Wed, 18 Nov 2020 12:23:23 -0800 (PST)
MIME-Version: 1.0
References: <20201118124035.96976-1-dwaipayanray1@gmail.com>
 <457730448c84136be089748bea69abd2254e3832.camel@perches.com>
 <CABJPP5CqKjY3_mfkJEsHX_8Zc7q1TRCgA4T54sTEZBiKgPS+OQ@mail.gmail.com>
 <754e240d1c88274ce2d94a5b6dbcfff1cc8c9508.camel@perches.com>
 <CABJPP5CHofzA46FHe3eJrgjQBTcaoCkR=dc29xxK80oFZJVfoQ@mail.gmail.com>
 <12b44d3a477de314320dc9d26b26576875525f27.camel@perches.com>
In-Reply-To: <12b44d3a477de314320dc9d26b26576875525f27.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 19 Nov 2020 01:52:52 +0530
Message-ID: <CABJPP5DTBkuzEjs28wufdnOXf61-T=wtoZWiTya_idXfJ92eNQ@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add --fix option for
	OPEN_BRACE issues
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

On Thu, Nov 19, 2020 at 1:28 AM Joe Perches <joe@perches.com> wrote:
>
> On Thu, 2020-11-19 at 00:15 +0530, Dwaipayan Ray wrote:
> > On Thu, Nov 19, 2020 at 12:09 AM Joe Perches <joe@perches.com> wrote:
> > >
> > > On Thu, 2020-11-19 at 00:03 +0530, Dwaipayan Ray wrote:
> > > > On Wed, Nov 18, 2020 at 11:44 PM Joe Perches <joe@perches.com> wrote:
> > > > >
> > > > > On Wed, 2020-11-18 at 18:10 +0530, Dwaipayan Ray wrote:
> > > > > > Brace style misuses of the following types are now
> > > > > > corrected:
> > > > > []
> > > > > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > > > []
> > > > > > @@ -3937,9 +3937,23 @@ sub process {
> > > > > >                       #print "pre<$pre_ctx>\nline<$line>\nctx<$ctx>\nnext<$lines[$ctx_ln - 1]>\n";
> > > > > >
> > > > > >
> > > > > >                       if ($ctx !~ /{\s*/ && defined($lines[$ctx_ln - 1]) && $lines[$ctx_ln - 1] =~ /^\+\s*{/) {
> > > > > > -                             ERROR("OPEN_BRACE",
> > > > > > -                                   "that open brace { should be on the previous line\n" .
> > > > > > -                                     "$here\n$ctx\n$rawlines[$ctx_ln - 1]\n");
> > > > > > +                             if (ERROR("OPEN_BRACE",
> > > > > > +                                       "that open brace { should be on the previous line\n" .
> > > > > > +                                             "$here\n$ctx\n$rawlines[$ctx_ln - 1]\n") &&
> > > > > > +                                 $fix) {
> > > > > > +                                     my $line1 = $rawlines[$ctx_ln - 2];
> > > > >
> > > > > How are you sure that in a patch context this line always starts with /^\+/ ?
> > > >
> > > > Hi,
> > > > I followed it from the other fixes for OPEN_BRACE which were already
> > > > there. In the patch context if the lines are added then only I think the fix
> > > > should be triggered. Other instances should not be modified.
> > >
> > > As far as I know there are no existing uses of --fix with OPEN_BRACE.
> > >
> >
> > I think you added it via 8d1824780f2f1 ("checkpatch: add --fix option
> > for a couple OPEN_BRACE misuses")
>
> The difference here is that you are dealing with a $stat context and
> the existing --fix entries are just for single line fixes.
>

Hi,
Ya I understand that. Though I am dealing with $stat content,
I am also directly accessing $rawlines here.
So I think that should have the proper patch line format, starting
with + or - or so.

So in this case if the error is triggered, checking for /^+/ should be done
becase it would be wrong to fix the others with /^[- ]/

Is there something else that I am not getting here?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
