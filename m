Return-Path: <SRS0=GItZ=E5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769B2C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Nov 2020 15:19:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF37D2078E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Nov 2020 15:19:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r2CODv4G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF37D2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BBCAE20348;
	Mon, 23 Nov 2020 15:19:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l9TagmtNvMjU; Mon, 23 Nov 2020 15:19:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4BF2920480;
	Mon, 23 Nov 2020 15:19:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39B60C0891;
	Mon, 23 Nov 2020 15:19:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 479D7C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 15:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 438F784C26
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 15:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dP0cq2xLu9qj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 15:19:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 13E1384ADA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 15:19:11 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id s10so18500482ioe.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 07:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KhvhVTBBCg95wuyigXHXxfUX1o0IuKoz4WwTgd0VakI=;
 b=r2CODv4GDcakcwSFVRAnb1/Oju9Z42YcPeOXP2wk88EdDV6vqbJwWBIU0HIhcTyuOX
 S5ymEMcknJa+EX6p983+GklKGMat49UsLneW+EcxUpjjjk1OVe/Rn0Jj37kpMASj5aaH
 fftsP3NKpIJIYulVTYYaJ+qeeoX946PVRl3ukao5C15sjaRGVY7LZCFAEEbyQkQ1XP7j
 YGzGQ/n57dARF7OJESPQRnCxCnkmxSM7YfXl2oa2bvEm3p0Oo2PF43C8KMiYlTCt6P/7
 cqmBb9b9g3phWs9Wphx7lrA4ArZ/PhJ43GZXtTrLCsLFPvn0h+mB94MmmzEuyoHwtv1i
 Tr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KhvhVTBBCg95wuyigXHXxfUX1o0IuKoz4WwTgd0VakI=;
 b=KqL+0aJ0UfRUmIy4RG+GMQmygKgkzSMxm/4IMoq7loylM/+a/R0NMI0EUUZMRERR7d
 biW9zOUYC3I6k32QmEDXlrX4LaE5BpItG5LU4vxOMKQypO4YkLkqUDq1Af5Z7+UDbsxj
 9OKx+8VsMCoraQD4+w33z3sYq9YlohfH5pKzX2TwQW+aP1oKB4WUPsNIOFU4Rtwu/cXR
 0gw/oKE+8rmBC1ipjNXITE8YFo1yZ0er4MR0AtLW7eOICEu0Jgu9wqJLMTIkdNkMQbVo
 2sG2hqDX5lJ2cJJD+U9UWcE0HTDYIURlFWJl8OE318chjABftQ1KlNNZXTV0AYvrFFJ8
 2AXw==
X-Gm-Message-State: AOAM531naBekOxZsz7rTDG7o5riUn2xOVCASrPOdNFGr7ix/J4wMADuC
 iV8LdsrTxWotfYb40ip9CNvvvj27KfuguNT/KgdQQViDA4o=
X-Google-Smtp-Source: ABdhPJxqXpQYJTgvj/t7m/L9ZO9QcCc5286ji9XwKMSlFNWKp1JS4ERACWX+9/BE8kWgZwMq3CCbT/lhleeyEHFcqbw=
X-Received: by 2002:a5d:990e:: with SMTP id x14mr190285iol.158.1606144750242; 
 Mon, 23 Nov 2020 07:19:10 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMzfQn9qbSLKnBn+hMs4uqiPqzESXfOPocoLmkSvOZEKRQ@mail.gmail.com>
 <20201123122138.29260-1-yashsri421@gmail.com>
 <CAKXUXMwP6_U3nY9yPLfZ9J3vq3FsBYd41mPfbZ1vY5xr11=GYQ@mail.gmail.com>
 <047b136a-3543-f193-068c-b16c5dfdf349@gmail.com>
In-Reply-To: <047b136a-3543-f193-068c-b16c5dfdf349@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 23 Nov 2020 16:18:59 +0100
Message-ID: <CAKXUXMzrBxw-Uryq04ByQ9bmS5-jyqGu18MpFNn2gPY0XeF1oQ@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add fix and
 improve warning msg for Non-standard signature
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

On Mon, Nov 23, 2020 at 4:16 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 23/11/20 6:39 pm, Lukas Bulwahn wrote:
> > On Mon, Nov 23, 2020 at 1:21 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
> >>
> >> Currently, checkpatch.pl warns for BAD_SIGN_OFF on non-standard signature
> >> styles.
> >>
> >> This warning occurs because of incorrect use of signature tags,
> >> e.g. an evaluation on v4.13..v5.8 showed the use of following incorrect
> >> signature tags, which may seem correct, but are not standard:
> >>
> >> 1) Requested-by (count: 48) => Suggested-by
> >> Rationale: In an open-source project, there are no 'requests', just
> >> 'suggestions' to convince a maintainer to accept your patch
> >>
> >> 2) Co-authored-by (count: 43) => Co-developed-by
> >> Rationale: Co-developed-by and Co-authored-by are synonyms
> >>
> >> 3) Analyzed-by (count: 22) / Analysed-by (count: 5) => Co-developed-by
> >> Rationale: Analyzing is a part of Software Development, so
> >> 'Co-developed-by' is perfectly fine, even if contributor did not create
> >> code
> >>
> >> 4) Improvements-by (count: 19) => Co-developed-by
> >>
> >> 5) Noticed-by (count: 11) => Reported-by
> >>
> >> 6) Inspired-by (count: 11) => Suggested-by
> >>
> >> 7) Verified-by (count: 8) => Tested-by
> >> Rationale: Used by a single user. On reading mailing list, it seems
> >> Tested-by might be a suitable alternative
> >>
> >> 8) Okay-ished-by (count: 8) => Acked-by
> >> Rationale: Used by a single user. On reading mailing list, it seems
> >> Acked-by must be suitable alternative
> >>
> >> 9) Acked-for-MFD-by (count: 6) => Acked-by
> >>
> >> 10) Reviewed-off-by (count: 5) => Reviewed-by
> >>
> >> 11) Proposed-by (count: 5) => Suggested-by
> >> Rationale: On observing the mailing list, this tag is always used for a
> >> maintainer. It seems that the changes might have been suggested by them
> >> and the tag is used as acknowledgement for the same
> >>
> >> 12) Fixed-by (count: 3) => Co-developed-by
> >> Rationale: Fixing bug is a part of Software Development, so
> >> 'Co-developed-by' is perfectly fine, even if contributor did not create
> >> code
> >>
> >> 13) Pointed-out-by (count: 3) / Pointed-at-by (count: 2) => Suggested-by
> >> Rationale: The tags are used for maintainers. It seems that the changes
> >> might have been suggested by them and the tag is used as acknowledgement
> >> for the same
> >> E.g., Pointed-at-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >>
> >> 14) Suggestions-by (count: 3) => Suggested-by
> >>
> >> 15) Generated-by (count: 17) => remove the tag
> >> On observing the mailing list, this tag is always used for quoting the
> >> tool or script, which might have been used to generate the patch.
> >> E.g. Generated-by: scripts/coccinelle/api/alloc/kzalloc-simple.cocci
> >>
> >> 16) Celebrated-by (count: 3) => remove the tag
> >> This tag was used for only one commit. On observing mailing list, it seem
> >> like the celebration for a particular patch and changes.
> >>
> >> Provide a fix by:
> >> 1) replacing the non-standard signature with its standard equivalent
> >> 2) removing the signature if it is not required
> >>
> >> Also, improve warning messages correspondingly, providing users
> >> suggestions to either replace or remove the signature. Also provide
> >> suitable rationale to the user for the suggestion made.
> >>
> >> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> >
> >
> > Looks good to me. Let us propose this to Joe for review.
> >
> Sent it. We probably still need to discuss about the remaining signatures:
> 1) "Debugged-by", 61
> 2) "Originally-by", 39
> 3) "Bisected-by", 20
> 4) "Diagnosed-by", 11
> 5) "Original-patch-by", 11
> 6) "Based-on-patch-by", 7
> 7) "Based-on-a-patch-by", 8
> 8) "Root-caused-by", 6
> 9) "Original-by", 6
> 10) "Based-on-patches-by", 5
> 11) "Based-on-work-by", 5
>
> Should I send this list as a follow-up mail?
>

Let us give Joe time to review the patch first; then if accepted, we
can continue the discussion on those tags above; you can already
propose a solution you have in mind and think about where the
documentation, checkpatch etc. needs to be adjusted.

> > Also, you can already start working on the related feature for
> > providing fixes based on the edit distance.
> >
> Okay.
>
> Thanks
> Aditya
> > With both features, we can probably fix all non-standard signatures...
> >
> > Lukas
> >
> >> ---
> >> changes in v2: replace commit specific example with brief evaluation
> >>
> >> changes in v3: provide rationale to users for every signature tag suggestion;
> >> modify commit message describing arrival to conclusion in a structured way
> >>
> >>  scripts/checkpatch.pl | 101 +++++++++++++++++++++++++++++++++++++++++-
> >>  1 file changed, 99 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> >> index fdfd5ec09be6..575ff8efb0eb 100755
> >> --- a/scripts/checkpatch.pl
> >> +++ b/scripts/checkpatch.pl
> >> @@ -506,6 +506,81 @@ our $signature_tags = qr{(?xi:
> >>         Cc:
> >>  )};
> >>
> >> +our %standard_signature_fix = (
> >> +       "Requested-by:" => {
> >> +               suggestion => "Suggested-by:",
> >> +               rationale => "In an open-source project, there are no 'requests', just 'suggestions' to convince a maintainer to accept your patch",
> >> +       },
> >> +       "Co-authored-by:" => {
> >> +               suggestion => "Co-developed-by:",
> >> +               rationale => "Co-developed-by and Co-authored-by are synonyms",
> >> +       },
> >> +       "Analyzed-by:" => {
> >> +               suggestion => "Co-developed-by:",
> >> +               rationale => "Analyzing is a part of Software Development, so 'Co-developed-by' is perfectly fine, even if contributor did not create code",
> >> +       },
> >> +       "Analysed-by:" => {
> >> +               suggestion => "Co-developed-by:",
> >> +               rationale => "Analysing is a part of Software Development, so 'Co-developed-by' is perfectly fine, even if contributor did not create code",
> >> +       },
> >> +       "Improvements-by:" => {
> >> +               suggestion => "Co-developed-by:",
> >> +               rationale => "Performing improvements are a part of Software Developement, so 'Co-developed-by' is perfectly fine, even if contributor did not create code",
> >> +       },
> >> +       "Noticed-by:" => {
> >> +               suggestion => "Reported-by:",
> >> +               rationale => "Reported-by and Noticed-by are synonyms",
> >> +       },
> >> +       "Inspired-by:" => {
> >> +               suggestion => "Suggested-by:",
> >> +               rationale => "Suggested-by is the standard signature tag for acknowledging user for their suggestions",
> >> +       },
> >> +       "Verified-by:" => {
> >> +               suggestion => "Tested-by:",
> >> +               rationale => "Tested-by and Verified-by are synonyms",
> >> +       },
> >> +       "Okay-ished-by:" => {
> >> +               suggestion => "Acked-by:",
> >> +               rationale => "Acked-by is the standard signature tag for recording your approval",
> >> +       },
> >> +       "Acked-for-MFD-by:" => {
> >> +               suggestion => "Acked-by:",
> >> +               rationale => "Acked-by is the standard signature tag for recording your approval",
> >> +       },
> >> +       "Reviewed-off-by:" => {
> >> +               suggestion => "Reviewed-by:",
> >> +               rationale => "Reviewed-by is the standard signature tag for recording your approval",
> >> +       },
> >> +       "Proposed-by:" => {
> >> +               suggestion => "Suggested-by:",
> >> +               rationale => "Proposing changes is same as suggesting changes, so Suggested-by seems perfectly fine",
> >> +       },
> >> +       "Fixed-by:" => {
> >> +               suggestion => "Co-developed-by:",
> >> +               rationale => "Fixing bug is a part of Software Development, so 'Co-developed-by' is perfectly fine, even if contributor did not create code",
> >> +       },
> >> +       "Pointed-out-by:" => {
> >> +               suggestion => "Suggested-by:",
> >> +               rationale => "Pointing out certain changes is synonymous to suggesting changes, so Suggested-by seems perfectly fine",
> >> +       },
> >> +       "Pointed-at-by:" => {
> >> +               suggestion => "Suggested-by:",
> >> +               rationale => "Pointing at certain changes is synonymous to suggesting changes, so Suggested-by seems perfectly fine",
> >> +       },
> >> +       "Suggestions-by:" => {
> >> +               suggestion => "Suggested-by:",
> >> +               rationale => "Suggested-by is the standard signature tag for acknowledging user for their suggestions",
> >> +       },
> >> +       "Generated-by:" => {
> >> +               suggestion => "remove",
> >> +               rationale => "Signature tags are used to acknowledge users for their contributions. It is advised to describe about tools in commit description instead",
> >> +       },
> >> +       "Celebrated-by:" => {
> >> +               suggestion => "remove",
> >> +               rationale => "Signature tags are used to acknowledge users for their contributions. This tag may not be required at all",
> >> +       },
> >> +);
> >> +
> >>  our @typeListMisordered = (
> >>         qr{char\s+(?:un)?signed},
> >>         qr{int\s+(?:(?:un)?signed\s+)?short\s},
> >> @@ -2773,8 +2848,30 @@ sub process {
> >>                         my $ucfirst_sign_off = ucfirst(lc($sign_off));
> >>
> >>                         if ($sign_off !~ /$signature_tags/) {
> >> -                               WARN("BAD_SIGN_OFF",
> >> -                                    "Non-standard signature: $sign_off\n" . $herecurr);
> >> +                               my $suggested_signature = "";
> >> +                               my $rationale = "";
> >> +                               if (exists($standard_signature_fix{$sign_off})) {
> >> +                                       $suggested_signature = $standard_signature_fix{$sign_off}{'suggestion'};
> >> +                                       $rationale = $standard_signature_fix{$sign_off}{'rationale'};
> >> +                               }
> >> +                               if ($suggested_signature eq "") {
> >> +                                       WARN("BAD_SIGN_OFF",
> >> +                                            "Non-standard signature: $sign_off\n" . $herecurr);
> >> +                               }
> >> +                               elsif ($suggested_signature eq "remove") {
> >> +                                       if (WARN("BAD_SIGN_OFF",
> >> +                                               "Non-standard signature: $sign_off. Please consider removing this signature tag. $rationale\n" . $herecurr) &&
> >> +                                       $fix) {
> >> +                                               fix_delete_line($fixlinenr, $rawline);
> >> +                                       }
> >> +                               }
> >> +                               else {
> >> +                                       if (WARN("BAD_SIGN_OFF",
> >> +                                               "Non-standard signature: $sign_off. Please use '$suggested_signature' instead. $rationale\n" . $herecurr) &&
> >> +                                       $fix) {
> >> +                                               $fixed[$fixlinenr] =~ s/$sign_off/$suggested_signature/;
> >> +                                       }
> >> +                               }
> >>                         }
> >>                         if (defined $space_before && $space_before ne "") {
> >>                                 if (WARN("BAD_SIGN_OFF",
> >> --
> >> 2.17.1
> >>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
