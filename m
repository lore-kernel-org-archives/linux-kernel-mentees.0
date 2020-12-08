Return-Path: <SRS0=ZryW=FM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033D1C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Dec 2020 16:54:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74DE023A79
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Dec 2020 16:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74DE023A79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0698B87510;
	Tue,  8 Dec 2020 16:54:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s9jRKNaJNR7E; Tue,  8 Dec 2020 16:54:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 73BC1873D1;
	Tue,  8 Dec 2020 16:54:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59C42C0893;
	Tue,  8 Dec 2020 16:54:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11510C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Dec 2020 16:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0567487510
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Dec 2020 16:54:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sA2bJIwr2cWX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Dec 2020 16:54:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 305D5873D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Dec 2020 16:54:21 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id k8so16074765ilr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Dec 2020 08:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wRrkg7oH4fdynU/Xow7nqQDLbaqn9Shs+pAWiq+hYmg=;
 b=uKHPG6fyzzU1C51tHtp6J4FliOjy48+4UZNNME/ljVdOiSIsBuGdMluy5rvPO7qvc2
 TLdCik8/qXXae6wp3REBXeGPdNc4z0zGD7roTcVZ1v4h+REheZeJDvZjJSlr4kkqAbMJ
 Aco+E5Oxy0+2VxGvTtim8IBvAzhn6PVCCGW61JOm+GCDJBKPB3vE9DDcObUWdcegXM6Z
 HmOkDTKIsDZljryChYTJoe8XbpSC+dLp23IYT514GRQU1/viXMyeJowxj+d5P1eIno1V
 HymJWatY17Yc5yQ1MnYqp1fDAwOfKqhX9Jyi84OAU3uYya0plT83UcGbq8PCmx8DaapA
 Jngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wRrkg7oH4fdynU/Xow7nqQDLbaqn9Shs+pAWiq+hYmg=;
 b=bpaJdbRRcoztmMw7Y4tQf83Tx41No4GMR+UVpKT61trPQ7oBDMp1ZGHSdLNBba5a36
 5Pk0GxTCXXH/9gaYah5uib3d7f2hdkCCuXjCZ3rewtMBjciUkahHTtV05OvqDetZ9+P2
 C6f75fFHC9AVVAmmOF9saDX5U7O0K6nJdrnK01PKTyJrJd14BEvUitcy6iA/DQbfqS7D
 wvU5VT6wjoigJzVfiewBgttt+YxCHnPFG2+J3yoyGrf5dGuDS5lKC1pngxflgf5KCNk+
 6/ixv5tzUCay0aRpUPKt2s42mAZhk5lGtzYmD3jt1X0TNfwNR2E/wcuY5X0lnknPfWmE
 5QwQ==
X-Gm-Message-State: AOAM5332d564bpbdssnD8k5GDb2yLB/C6dHEPDON/+ZPM7x0zZq2hXCD
 +HJm1mMkKogP5hBctst7HWdWDm1IrGykjrU0uFE=
X-Google-Smtp-Source: ABdhPJwfjdaC2HVNIRACgXSpuzIdN3oeKzPTMcD8uckylaHa1ZT3SQVztYOGLdJgRUCFV7W9mqFyGM8OeZdjbK5kB9w=
X-Received: by 2002:a92:a804:: with SMTP id o4mr27366100ilh.125.1607446460479; 
 Tue, 08 Dec 2020 08:54:20 -0800 (PST)
MIME-Version: 1.0
References: <20201202183649.9773-1-yashsri421@gmail.com>
 <540be894-a369-160f-25cc-a22a06612c9f@gmail.com>
In-Reply-To: <540be894-a369-160f-25cc-a22a06612c9f@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 8 Dec 2020 17:54:09 +0100
Message-ID: <CAKXUXMyhw4rKNesshCdHT+mLJ9PEkA+ZJO7bFXZciNFDZKHtBA@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	BAD_SIGN_OFF
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

On Tue, Dec 8, 2020 at 5:44 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 3/12/20 12:06 am, Aditya Srivastava wrote:
> > Currently checkpatch warns us if the Co-developed-by line for an author
> > isn't immediately followed by the Signed-off-by line.
> >
> > Generally, this warning occurs because of:
> > 1) Absence of Signed-off-by line for the author from the patch
> > 2) Misplaced Signed-off-by line for the author in the patch
> >
> > Provide a simple fix by:
> > 1) Inserting Signed-off-by line for the author immediately after the
> > Co-developed-by line
> >
> > 2) Removing Signed-off-by line for the author (if it pre-existed on
> > some other line)
> >
> > Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 28 ++++++++++++++++++++++++----
> >  1 file changed, 24 insertions(+), 4 deletions(-)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 5c9f13a97c12..d8f9d4d8b13d 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -2509,6 +2509,9 @@ sub process {
> >       my @setup_docs = ();
> >       my $setup_docs = 0;
> >
> > +     my %signed_off_by_lines;
> > +     my %co_developed_by_lines;
> > +
> >       my $camelcase_file_seeded = 0;
> >
> >       my $checklicenseline = 1;
> > @@ -2794,6 +2797,7 @@ sub process {
> >                                       my $ctx = $1;
> >                                       my ($email_name, $email_comment, $email_address, $comment1) = parse_email($ctx);
> >                                       my ($author_name, $author_comment, $author_address, $comment2) = parse_email($author);
> > +                                     $signed_off_by_lines{$ctx} = $fixlinenr;
> >
> >                                       if ($email_address eq $author_address && $email_name eq $author_name) {
> >                                               $author_sob = $ctx;
> > @@ -2989,11 +2993,17 @@ sub process {
> >                                       }
> >                               }
> >                               if (!defined $lines[$linenr]) {
> > -                                     WARN("BAD_SIGN_OFF",
> > -                                             "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline);
> > +                                     if (WARN("BAD_SIGN_OFF",
> > +                                              "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline) &&
> > +                                         $fix) {
> > +                                             $co_developed_by_lines{$email} = $fixlinenr;
> > +                                     }
> >                               } elsif ($rawlines[$linenr] !~ /^\s*signed-off-by:\s*(.*)/i) {
> > -                                     WARN("BAD_SIGN_OFF",
> > -                                          "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline . "\n" .$rawlines[$linenr]);
> > +                                     if (WARN("BAD_SIGN_OFF",
> > +                                              "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline . "\n" .$rawlines[$linenr]) &&
> > +                                         $fix) {
> > +                                             $co_developed_by_lines{$email} = $fixlinenr;
> > +                                     }
> >                               } elsif ($1 ne $email) {
> >                                       WARN("BAD_SIGN_OFF",
> >                                            "Co-developed-by and Signed-off-by: name/email do not match \n" . "$here\n" . $rawline . "\n" .$rawlines[$linenr]);
> > @@ -7203,6 +7213,16 @@ sub process {
> >               ERROR("NOT_UNIFIED_DIFF",
> >                     "Does not appear to be a unified-diff format patch\n");
> >       }
> > +
> > +     if (%co_developed_by_lines) {
> > +             foreach my $co_developer (keys %co_developed_by_lines) {
> > +                     if (exists($signed_off_by_lines{$co_developer})) {
> > +                             fix_delete_line($signed_off_by_lines{$co_developer}, "Signed-off-by: $co_developer");
> > +                     }
> > +                     fix_insert_line($co_developed_by_lines{$co_developer} + 1, "Signed-off-by: $co_developer");
> > +             }
> > +     }
> > +
> >       if ($is_patch && $has_commit_log && $chk_signoff) {
> >               if ($signoff == 0) {
> >                       ERROR("MISSING_SIGN_OFF",
> >
>

Not a big fan of that. Especially because adding and removing
Signed-off-by: from a trail has a specific meaning.

So that fix can only be applied under very specific conditions. You
cannot just sign a document in the name of another person, that is
clearly fraud and identity theft.

As a patch author, you would need to really carefully think if this
fix is valid or not. Do we have examples of patches where this is
wrong and where your fix can actually be run by a specific person?

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
