Return-Path: <SRS0=4WB8=FF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC5FC64E7A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 10:27:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D383207FF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 10:27:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r/J5PXoE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D383207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E969887101;
	Tue,  1 Dec 2020 10:26:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fj87gkVih8xw; Tue,  1 Dec 2020 10:26:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3D96D870C8;
	Tue,  1 Dec 2020 10:26:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 340A0C163C;
	Tue,  1 Dec 2020 10:26:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94892C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 10:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8285A87108
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 10:26:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VJTY1g-OjCm2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 10:26:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 79876870C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 10:26:56 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id y5so1053356iow.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Dec 2020 02:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wY++r0dKxDHMYEJr314A3prdtel3uVUYqv4jRDHBN6s=;
 b=r/J5PXoEvdypPp9Gm1AJA0IAWFd1UJGye47ueoDrrd5lqQ7/GMEHBw0UYZ7L7gFVu+
 CbBq9fOaoo7wvC5y5JZJk52lJAnkhNIrauDH6tRmy3TqK2mi+oErfvI5RQevx+b/I4oh
 gAmC4i1JiPKei4WpJooMajHbjxNCRKE6U5MkBvbIMVEKG4c24TCzlvgqULY6WMRWhA+v
 6JGxLNhQKWTH39/TzGbf8haJcNdJf/f8mXXtv5/Yi9GDb5rjJNGpBzP22WjIr7JT8KDO
 Mva8VgsFkKUWbpuDMwF3UGqKTi0uJJbTF4MvtgOiMKCEvxyDtCZbNo6t4o++LUFdVujb
 0FCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wY++r0dKxDHMYEJr314A3prdtel3uVUYqv4jRDHBN6s=;
 b=BkjEXuLfildKv7N7yLTXWWIV0CNUFKo7JLpcOPan1BRpuPjJF4tcCF83oMp5YoRqVf
 +qIU7FDCNFCH1zsC57zC6gRnTiqjQB3bkg2AZMwkd2tH5fm3jrxpJIdVt8HJpFKmCZoI
 k5B0jcd/Wh+F/oORlzIq+tr+yHf3SoUHMT9AgxdDXXhLO1b0XdxLLXaU89raFT+lNd+r
 07pwNuy89que/GwOtcUiA5MNd10sqqxLDbBqaW5A9ySiSgeTHYj2NaZhYnNRHIqwb2ye
 Pwva8cV8GMOQ0ACR9uja7u+4qTpLE58fyhCNcYsNlM0fzPnwMQ/0IKSR0Sed8aATd7wM
 iLmA==
X-Gm-Message-State: AOAM532kc9vKmOqEmFbY3WOlNWncMKlsshDSpxa9j2/76ksUgocxU7f7
 am55s6aTXvVOQCVopzk7z33cT2kSpmpJDc8gwShXVc040KU=
X-Google-Smtp-Source: ABdhPJyBS+3XVpFO2sZQEbF+rKfQGZw1VKdBBv50Z8tAoJ5SOUSIe/DDYjaI9ZH0FhpzkUCXEV9mQXr5/XaKmLTS+Pg=
X-Received: by 2002:a5e:820d:: with SMTP id l13mr1831001iom.102.1606818415642; 
 Tue, 01 Dec 2020 02:26:55 -0800 (PST)
MIME-Version: 1.0
References: <20201129081447.15041-1-yashsri421@gmail.com>
 <50d28187-d6ea-2f82-29fb-1f0027d0bf72@gmail.com>
In-Reply-To: <50d28187-d6ea-2f82-29fb-1f0027d0bf72@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 1 Dec 2020 11:27:00 +0100
Message-ID: <CAKXUXMy=khmyDcT5Q1cph=UsTc1YsZzL22H65rPkbkmBse2EHA@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v5] checkpatch: add fix and
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

On Tue, Dec 1, 2020 at 10:00 AM Aditya <yashsri421@gmail.com> wrote:
>
> On 29/11/20 1:44 pm, Aditya Srivastava wrote:
> > Currently, checkpatch.pl warns for BAD_SIGN_OFF on non-standard signature
> > styles.
> >
> > This warning occurs because of incorrect use of signature tags,
> > e.g. an evaluation on v4.13..v5.8 showed the use of following incorrect
> > signature tags, which may seem correct, but are not standard:
> >
> > 1) Requested-by (count: 48) => Suggested-by
> > Rationale: In an open-source project, there are no 'requests', just
> > 'suggestions' to convince a maintainer to accept your patch
> >
> > 2) Co-authored-by (count: 43) => Co-developed-by
> > Rationale: Co-developed-by and Co-authored-by are synonyms
> >
> > 3) Analyzed-by (count: 22) / Analysed-by (count: 5) => Co-developed-by
> > Rationale: Analyzing is a part of Software Development, so
> > 'Co-developed-by' is perfectly fine, even if contributor did not create
> > code
> >
> > 4) Improvements-by (count: 19) => Co-developed-by
> >
> > 5) Noticed-by (count: 11) => Reported-by
> >
> > 6) Inspired-by (count: 11) => Suggested-by
> >
> > 7) Verified-by (count: 8) => Tested-by
> > Rationale: Used by a single user. On reading mailing list, it seems
> > Tested-by might be a suitable alternative
> >
> > 8) Okay-ished-by (count: 8) => Acked-by
> > Rationale: Used by a single user. On reading mailing list, it seems
> > Acked-by must be suitable alternative
> >
> > 9) Acked-for-MFD-by (count: 6) => Acked-by
> >
> > 10) Reviewed-off-by (count: 5) => Reviewed-by
> >
> > 11) Proposed-by (count: 5) => Suggested-by
> > Rationale: On observing the mailing list, this tag is always used for a
> > maintainer. It seems that the changes might have been suggested by them
> > and the tag is used as acknowledgment for the same
> >
> > 12) Fixed-by (count: 3) => Co-developed-by
> > Rationale: Fixing bug is a part of Software Development, so
> > 'Co-developed-by' is perfectly fine, even if contributor did not create
> > code
> >
> > 13) Pointed-out-by (count: 3) / Pointed-at-by (count: 2) => Suggested-by
> > Rationale: The tags are used for maintainers. It seems that the changes
> > might have been suggested by them and the tag is used as acknowledgment
> > for the same
> > E.g., Pointed-at-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
> > 14) Suggestions-by (count: 3) => Suggested-by
> >
> > Provide a fix by replacing the non-standard signature with its standard
> > equivalent.
> >
> > Also, improve warning messages correspondingly, providing suitable
> > rationale to the user for the suggestion made.
> >
> > Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> > ---
> > applies on next-20201120 and my last patch at Link: https://lore.kernel.org/linux-kernel-mentees/db1195235752685fc85fb52ecb1b1af3f35b5394.camel@perches.com/T/#u
> >
> > changes in v2: replace commit specific example with brief evaluation
> >
> > changes in v3: provide rationale to users for every signature tag suggestion;
> > modify commit message describing arrival to conclusion in a structured way
> >
> > changes in v4: modify rationale for certain suggestions
> >
> > changes in v5: remove the tag deletion suggestions, ie "Generated-by" and "Celebrated-by"; rebase on last accepted changes; modify commit message
> >
> >  scripts/checkpatch.pl | 73 ++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 72 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 4a026926139f..d0c2f189272f 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -563,6 +563,72 @@ sub find_standard_signature {
> >
> >       return "";
> >  }
> > +our %standard_signature_fix = (
> > +     "Requested-by:" => {
> > +             suggestion => "Suggested-by:",
> > +             rationale => "In an open-source project, there are no 'requests', just 'suggestions' to convince a maintainer to accept your patch",
> > +     },
> > +     "Co-authored-by:" => {
> > +             suggestion => "Co-developed-by:",
> > +             rationale => "Co-developed-by is the standard signature tag to attribute multiple authors for a patch",
> > +     },
> > +     "Analyzed-by:" => {
> > +             suggestion => "Co-developed-by:",
> > +             rationale => "Analyzing is a part of Software Development, so 'Co-developed-by' is perfectly fine, even if contributor did not create code",
> > +     },
> > +     "Analysed-by:" => {
> > +             suggestion => "Co-developed-by:",
> > +             rationale => "Analysing is a part of Software Development, so 'Co-developed-by' is perfectly fine, even if contributor did not create code",
> > +     },
> > +     "Improvements-by:" => {
> > +             suggestion => "Co-developed-by:",
> > +             rationale => "Performing improvements are a part of Software Development, so 'Co-developed-by' is perfectly fine, even if contributor did not create code",
> > +     },
> > +     "Noticed-by:" => {
> > +             suggestion => "Reported-by:",
> > +             rationale => "Reported-by is the standard signature tag for acknowledging user who noticed or reported any bug(s)",
> > +     },
> > +     "Inspired-by:" => {
> > +             suggestion => "Suggested-by:",
> > +             rationale => "Suggested-by is the standard signature tag for acknowledging user for their suggestions",
> > +     },
> > +     "Verified-by:" => {
> > +             suggestion => "Tested-by:",
> > +             rationale => "Tested-by is the standard signature tag to attribute user for verifying/testing the patch",
> > +     },
> > +     "Okay-ished-by:" => {
> > +             suggestion => "Acked-by:",
> > +             rationale => "Acked-by is the standard signature tag for recording one's approval",
> > +     },
> > +     "Acked-for-MFD-by:" => {
> > +             suggestion => "Acked-by:",
> > +             rationale => "Acked-by is the standard signature tag for recording one's approval",
> > +     },
> > +     "Reviewed-off-by:" => {
> > +             suggestion => "Reviewed-by:",
> > +             rationale => "Reviewed-by is the standard signature tag to indicate that the patch has been reviewed",
> > +     },
> > +     "Proposed-by:" => {
> > +             suggestion => "Suggested-by:",
> > +             rationale => "Suggested-by is the standard signature tag for acknowledging user for their suggestions",
> > +     },
> > +     "Fixed-by:" => {
> > +             suggestion => "Co-developed-by:",
> > +             rationale => "Fixing bug is a part of Software Development, so 'Co-developed-by' is perfectly fine, even if contributor did not create code",
> > +     },
> > +     "Pointed-out-by:" => {
> > +             suggestion => "Suggested-by:",
> > +             rationale => "Pointing out certain changes is synonymous to suggesting changes, so Suggested-by seems perfectly fine",
> > +     },
> > +     "Pointed-at-by:" => {
> > +             suggestion => "Suggested-by:",
> > +             rationale => "Pointing at certain changes is synonymous to suggesting changes, so Suggested-by seems perfectly fine",
> > +     },
> > +     "Suggestions-by:" => {
> > +             suggestion => "Suggested-by:",
> > +             rationale => "Suggested-by is the standard signature tag for acknowledging user for their suggestions",
> > +     },
> > +);
> >
> >  our @typeListMisordered = (
> >       qr{char\s+(?:un)?signed},
> > @@ -2832,12 +2898,17 @@ sub process {
> >
> >                       if ($sign_off !~ /$signature_tags/) {
> >                               my $suggested_signature = find_standard_signature($sign_off);
> > +                             my $rationale = "";
> > +                             if (exists($standard_signature_fix{$sign_off})) {
> > +                                     $suggested_signature = $standard_signature_fix{$sign_off}{'suggestion'};
> > +                                     $rationale = $standard_signature_fix{$sign_off}{'rationale'};
> > +                             }
> >                               if ($suggested_signature eq "") {
> >                                       WARN("BAD_SIGN_OFF",
> >                                            "Non-standard signature: $sign_off\n" . $herecurr);
> >                               } else {
> >                                       if (WARN("BAD_SIGN_OFF",
> > -                                              "Non-standard signature: '$sign_off' - perhaps '$suggested_signature'?\n" . $herecurr) &&
> > +                                              "Non-standard signature: '$sign_off' - perhaps '$suggested_signature'? $rationale\n" . $herecurr) &&
> >                                           $fix) {
> >                                               $fixed[$fixlinenr] =~ s/$sign_off/$suggested_signature/;
> >                                       }
> >
>
> Hi Lukas
> You probably missed this patch. Actually I wanted to get a quick
> feedback from you before sending it to Joe again.
>

Sorry, looks good and can go to Joe. It could be that Joe is more
picky; so, we might just choose the very obvious mappings after the
discussion with him.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
