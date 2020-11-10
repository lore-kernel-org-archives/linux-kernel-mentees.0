Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D68C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 12:39:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C251A20780
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 12:39:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fo/cyvH5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C251A20780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2543A2286C;
	Tue, 10 Nov 2020 12:39:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V4DZFqywQhDk; Tue, 10 Nov 2020 12:39:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 134891FEAE;
	Tue, 10 Nov 2020 12:39:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA42AC0889;
	Tue, 10 Nov 2020 12:39:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16F85C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 12:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0AD042000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 12:39:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hQ8wg9ttaxMD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 12:39:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 792641FEAE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 12:39:03 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id z2so11806584ilh.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 04:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+itxR3PRewWf71JfBjCwNhQuuNUU3ISYBu3N1pNS7IA=;
 b=Fo/cyvH57ivz7eHG3KcZW4eN4sDPaAQdpBqgVRW/hwKJwbfqg77v1G0WNT3MJfz8fz
 Sdo1FT22xxbuh6RA2Y+Sqcu2I/JjhEW9YrJtydOUo5NYYroKNlBUxddcsdt7ojnXqcnr
 YIB+bJx17V5bFCXWnX7oAQVr8b94buk+d7gKWfdZOza8Tik+WlRcjjVQ3VneHT+x8i9d
 YbFe8uRniMWkmOd6ezi/IlQ6Ku/AWIaPUZLa2Kjv5jzHkHAVy/mm3FmFcCR0QyZmtQsV
 cD0aVQ7LdYuVuaR/tMTSAqQazAG/4A7qMHNgRRuKp8bFYQkc4OjPFRaknZWQxJmlCgDg
 6j3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+itxR3PRewWf71JfBjCwNhQuuNUU3ISYBu3N1pNS7IA=;
 b=MddnARp68ZySMv7uwCPqBSyOBxnFJIIcfTgKGk4t7lPy4EE30BX9yG9X08Fj45qVlY
 PwR6zw6dH+v7Ecb1ZxPiRcQ0uYG7NJmwdn9JmP96n5NKFdmU/VyCzcGiionTXpDspK5N
 E2emWXEUDVmEW4oBUDp9nHHv98WLBkX17pqIjhgdMprlEv4zHLS9RAr0nkCB0jSm/ZR7
 CWB9gsUYrVtkdRFgdtOhhLsTeOW0bVuRlbdqVwdNrK+PfIDxD7CC2Fi3/F31H2nV6QsE
 DzMU5W7dIx/c8TyjC2jiKi65MixjG0R0u2Xsb4GdIdr//aVXbxe3PQ+4w/xwrKH9tXam
 0TmQ==
X-Gm-Message-State: AOAM531WdaDhcjlflPPd1Avd2PbX0fjxtRsHyYGaK3VSzk1lRA0T70/T
 Ve3NP7kF5KL3UlDAQMbdcPaHm07KZNTY7ClbHVQ=
X-Google-Smtp-Source: ABdhPJySRrcwJQNldVXgEp6t4XCHtumS3lhGEvpSUGadApdMH0A6mwGeNTO3Hrxia/el/JFct/yQnuizx1mJw5/BqTE=
X-Received: by 2002:a92:cb51:: with SMTP id f17mr13353064ilq.64.1605011942715; 
 Tue, 10 Nov 2020 04:39:02 -0800 (PST)
MIME-Version: 1.0
References: <20201110100554.15995-1-yashsri421@gmail.com>
 <CAKXUXMy2RG3UP_PEzH+KHhZNv7ehSgR9+oz_5mrQUyNO89HkHA@mail.gmail.com>
 <c4be24c1-6fa7-232c-df25-04de47eac72c@gmail.com>
In-Reply-To: <c4be24c1-6fa7-232c-df25-04de47eac72c@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 10 Nov 2020 13:38:52 +0100
Message-ID: <CAKXUXMysz-viVa66UqeqQ00NRMZWuig8CbXgD=x+x35vwxPbmg@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	MISSING_SIGN_OFF
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

On Tue, Nov 10, 2020 at 12:11 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 10/11/20 4:01 pm, Lukas Bulwahn wrote:
> > On Tue, Nov 10, 2020 at 11:06 AM Aditya Srivastava <yashsri421@gmail.com> wrote:
> >>
> >> Currently checkpatch warns us if there is no 'Signed-off-by' line
> >> for the patch.
> >>
> >> E.g., running checkpatch on commit 9ac060a708e0 ("leaking_addresses:
> >> Completely remove --version flag") reports this error:
> >>
> >> ERROR: Missing Signed-off-by: line(s)
> >>
> >> Provide a fix by adding a Signed-off-by line corresponding to the author
> >> of the patch before the patch separator line. Also avoid this error for
> >> the commits where some typo is present in the sign off.
> >>
> >> E.g. for commit 8cde5d5f7361 ("bus: ti-sysc: Detect omap4 type timers
> >> for quirk") we get missing sign off as well as bad sign off for:
> >>
> >> Siganed-off-by: Tony Lindgren <tony@atomide.com>
> >>
> >> Here it is probably best to give BAD_SIGN_OFF warning for Non-standard
> >> signature and avoid MISSING_SIGN_OFF
> >>
> >> A quick evaluation over v4.13..v5.8 found out that 4 out of 11 cases
> >> for this error is because of missing sign offs in reverts. Add
> >> documentation regarding it for the future users.
> >>
> >> Suggested-by: Joe Perches <joe@perches.com>
> >> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> >
> > Split this patch into two patches. One for documentation and one for
> > the checkpatch.pl change.
> >
> > The documentation patch needs its own commit message to explain why we
> > think this should be pointed out.
> >
> Okay
>
> >> ---
> >>  Documentation/process/submitting-patches.rst |  2 ++
> >>  scripts/checkpatch.pl                        | 17 ++++++++++++++---
> >>  2 files changed, 16 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> >> index 83d9a82055a7..ff065e1f6a25 100644
> >> --- a/Documentation/process/submitting-patches.rst
> >> +++ b/Documentation/process/submitting-patches.rst
> >> @@ -404,6 +404,8 @@ then you just add a line saying::
> >>
> >>  using your real name (sorry, no pseudonyms or anonymous contributions.)
> >>  This will be done for you automatically if you use ``git commit -s``.
> >> +Also reverts should include a Signed-off-by. ``git revert -s`` does
> >> +that for you.
> >>
> >>  Some people also put extra tags at the end.  They'll just be ignored for
> >>  now, but you can do this to mark internal company procedures or just
> >> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> >> index cb46288127ac..849e4a510767 100755
> >> --- a/scripts/checkpatch.pl
> >> +++ b/scripts/checkpatch.pl
> >> @@ -2404,6 +2404,8 @@ sub process {
> >>
> >>         my $last_blank_line = 0;
> >>         my $last_coalesced_string_linenr = -1;
> >> +       my $patch_separator_linenr = 0;
> >> +       my $is_signed_off = 0;
> >>
> >>         our @report = ();
> >>         our $cnt_lines = 0;
> >> @@ -2755,6 +2757,10 @@ sub process {
> >>                 if ($line =~ /^---$/) {
> >>                         $has_patch_separator = 1;
> >>                         $in_commit_log = 0;
> >> +                       # to add missing sign off line before diff(s)
> >> +                       if($patch_separator_linenr == 0) {
> >> +                               $patch_separator_linenr = $fixlinenr;
> >> +                       }
> >
> > Why do you use fixlinenr here? How is that different from linenr?
> >
> I used $fixlinenr here as we need to later use it for
> fix_insert_line(), where we are passing fixlinenrs' always. So, to
> keep it consistent, I used $fixlinenr
> Should I use $linenr instead? I think they differ by 1
>

I do not know. I am just asking if you are sure that you record the
fixlinenr there or not.

fixlinenr sounds good, but I am not sure.

> >>                 }
> >>
> >>  # Check if MAINTAINERS is being updated.  If so, there's probably no need to
> >> @@ -2771,6 +2777,8 @@ sub process {
> >>                         my $space_after = $3;
> >>                         my $email = $4;
> >>                         my $ucfirst_sign_off = ucfirst(lc($sign_off));
> >> +                       # to avoid missing_sign_off error as it most probably is a typo
> >> +                       $is_signed_off = 1;
> >
> > Probably is_signed_off is the wrong name here.
> >
> > Other than that, this change looks good.
> >
> Okay
>
> > Check if the patch applies on top of Dwaipayan's latest patches he sent.
> >
> Yes, I have made the changes after applying this patch:
> https://lore.kernel.org/linux-kernel-mentees/20201108100632.75340-1-dwaipayanray1@gmail.com/
>

Sounds good. Mention that in the patch below the "---" so that everyone knows.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
