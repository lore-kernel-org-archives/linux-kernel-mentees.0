Return-Path: <SRS0=ImFK=EY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B68C56201
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 19:17:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06ED32222C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 19:17:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzUGMtDa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06ED32222C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 70B6786B0F;
	Wed, 18 Nov 2020 19:17:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wHiPQu38sScb; Wed, 18 Nov 2020 19:17:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 91DBF86B0A;
	Wed, 18 Nov 2020 19:17:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79BEDC0800;
	Wed, 18 Nov 2020 19:17:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21FDBC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 19:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0733B8728C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 19:17:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QREcHznsDVDn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 19:17:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 18A158701D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 19:17:19 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id d17so3246317ion.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 11:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=edUITlHygK/6gpqrFbm4POgC+3B1c5Z8zTminFkA+i0=;
 b=lzUGMtDaRs+Zitm/yQydu4WTqkXvJUlQDW+IM1TbO0/hOr00XfDA0zOVNxup+Ld0iy
 +v31FvFULExleffKJgxFpmxZnDwAUDHqUJ11q8/V7t1azzXf/ZzXh6UGo6PyxY+Iktxm
 QYRTCP5G4SCisvkfJxqT4xF6EuHoYA0HYULOgRGMzpwMuuVltYIx3O2I/UX8lJNfdETs
 R7eypk8zz26S2wWzfu4oDpiy+CuNfWGSEibOrypzxmL4qAoihA6X05SS7Z23xT2z0QSW
 R+vKJ5LbhG5wATuBE1bB59ocRM8HBw1EyRPRi3omGJWdCaMn3HuWBSlrbnES9+IAo/0Y
 LOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=edUITlHygK/6gpqrFbm4POgC+3B1c5Z8zTminFkA+i0=;
 b=eNuXRyRiaMVRf84mXi7ji/Ul1rfwHpTb/9ebruzPN5NfJRJ7vZ6LgoAZhvXcG3f9jL
 JgHX252Ub3Z3UKMCUEhFY0cFQfBO0SnakL1J/CUgfALAwm2tBWZEGDTZUckUhJ6WQvcO
 1EZGGx8emlCD1d+1Fm5lfMd6R1Swkw9HUqnN63Wk7Wvatvd/3duQONNdmLcYbxTr9ayI
 EkZ0oRqi708WN0kMdLSODLB7tkFcMJx5XIkuvl205st5uNORMHVQDJXBDdpDfdUhO/so
 ImGYHIDHuLO4SbZ2DY7XfUg/joHFmL0XaqsUeEDmZZPr/qp9bbGWwtFMn9VJaxq8XjRx
 VoAg==
X-Gm-Message-State: AOAM530BxVeJVWNFJfdGzM9T56HQ/AyD23tTkuBc9CSVSu0OqCWTHWz3
 jBWnh1VgR3FE+R4HbevBcVgOEDEAl/osr7ny3eA=
X-Google-Smtp-Source: ABdhPJyb0d0SK01FDhj2/BFky4FLcJGwJCvutVy6hPTLPgAXO8l7oesEMLuy+0hUQXqAncn08FJElwaJaR6vrjR6H+o=
X-Received: by 2002:a02:824b:: with SMTP id q11mr3306097jag.139.1605727038421; 
 Wed, 18 Nov 2020 11:17:18 -0800 (PST)
MIME-Version: 1.0
References: <50c8be3c-fceb-255b-43ba-1ce8284ab410@gmail.com>
 <CAKXUXMw2=4E8XpZFx04pkBmvwDSpcCedxE2ndX4DX5DTek_06g@mail.gmail.com>
 <ed152561-0932-65e2-fc86-3540fc456b09@gmail.com>
 <483df3b1-219c-129e-2c88-5411e012a9e1@gmail.com>
 <CAKXUXMx4-2-=XkXkvUcx6GuNmwfkSyYbOWc04uXkFgnHxsNNvQ@mail.gmail.com>
 <31eeb998-0f1a-5ae2-fd0a-62fd1cf3349b@gmail.com>
 <bde0d09e-39fb-234c-c7b3-42d859414794@gmail.com>
 <CAKXUXMwsUYgg+oOADM3wrryr2Vob_Yo1YX-ms5eKCeCAx7HTpw@mail.gmail.com>
 <050ddb53-33ff-83bc-7f91-b7c2874211f6@gmail.com>
 <056fae30-efa1-7758-c4bb-04bb90a03f8a@gmail.com>
In-Reply-To: <056fae30-efa1-7758-c4bb-04bb90a03f8a@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 18 Nov 2020 20:17:06 +0100
Message-ID: <CAKXUXMwJk+WC94r7cCNJ+ehoP9ebM4nc_ZLLQi2v1iGoa34d+w@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Fix for BAD_SIGN_OFF: non-standard
	signature
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
Content-Type: multipart/mixed; boundary="===============3026376520477862509=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3026376520477862509==
Content-Type: multipart/alternative; boundary="000000000000bb3e4e05b4667505"

--000000000000bb3e4e05b4667505
Content-Type: text/plain; charset="UTF-8"

On Mi., 18. Nov. 2020 at 11:12, Aditya <yashsri421@gmail.com> wrote:

> On 18/11/20 2:24 am, Aditya wrote:
> > On 17/11/20 11:12 pm, Lukas Bulwahn wrote:
> >> On Tue, Nov 17, 2020 at 7:03 PM Aditya <yashsri421@gmail.com> wrote:
> >>>
> >>> On 13/11/20 11:55 pm, Aditya wrote:
> >>>> On 13/11/20 8:56 pm, Lukas Bulwahn wrote:
> >>>>> On Fri, Nov 13, 2020 at 4:00 PM Aditya <yashsri421@gmail.com> wrote:
> >>>>>>
> >>>>>> On 13/11/20 8:05 pm, Aditya wrote:
> >>>>>>> On 12/11/20 1:34 am, Lukas Bulwahn wrote:
> >>>>>>>> On Wed, Nov 11, 2020 at 3:13 PM Aditya <yashsri421@gmail.com>
> wrote:
> >>>>>>>>>
> >>>>>>>>> Hi Sir
> >>>>>>>>> I have analyzed the checkpatch report for BAD_SIGN_OFF(over
> >>>>>>>>> v4.13..v5.8) for non-standard signature and generated reports
> for it.
> >>>>>>>>> Some mistakes are more frequent than others, whereas some
> mistakes
> >>>>>>>>> even have a frequency of 1.
> >>>>>>>>>
> >>>>>>>>> Non-standard signatures occurring with their frequency:
> >>>>>>>>>
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/non_standard_signs.txt
> >>>>>>>>>
> >>>>>>>>> Complete warning messages:
> >>>>>>>>>
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/warn_msgs.txt
> >>>>>>>>>
> >>>>>>>>> Should I implement the fix similar to TYPO_FIX, where we have a
> >>>>>>>>> separate file for common misspellings and corrected words? Or
> should I
> >>>>>>>>> make a hash of these misspellings in checkpatch.pl file as well?
> >>>>>>>>>
> >>>>>>>>> Also should I include all these misspelled words in it? Or omit
> words
> >>>>>>>>> below certain frequency?
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> I think the best way would be to compute some kind of edit
> distance to
> >>>>>>>> the known signature tags and if this edit distance is below a
> certain
> >>>>>>>> threshold, suggest that signature tag as the fix. We can then
> evaluate
> >>>>>>>> to determine the best suitable threshold. The edit distance
> between
> >>>>>>>> the different tags are so large that this should always work as
> >>>>>>>> intended.
> >>>>>>>>
> >>>>>>>> Then, we can look into these other creative tags and propose
> suitable
> >>>>>>>> existing tags for the more frequent ones that are non-standard.
> Or in
> >>>>>>>> the case, none of the existing ones fit we can start the
> discussion on
> >>>>>>>> proposing some new standard ones.
> >>>>>>>>
> >>>>>>>
> >>>>>>> I have generated a list of non-standard signatures and their fixes
> on
> >>>>>>> the basis of edit distance.
> >>>>>>>
> >>>>>>> This is the common list of non standard signatures and fixes (in
> >>>>>>> detail):
> >>>>>>>
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/min_dists.txt
> >>>>>>>
> >>>>>>> As I observed, I think, we can consider '<=2' as the threshold edit
> >>>>>>> distance.
> >>>>>>> List for non-standard signature and their proposed fix with edit
> >>>>>>> distance<=2 :
> >>>>>>>
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/less_than_3.txt
> >>>>>>>
> >>>>>>> I have also generated lists for 3 and 4 edit distance separately
> for
> >>>>>>> reference:
> >>>>>>> Equal to 3:
> >>>>>>>
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/equal_3.txt
> >>>>>>>
> >>>>>>> Equal to 4:
> >>>>>>>
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/equal_4.txt
> >>>>>>>
> >>>>>>> For the rest I guess we'll need to hard code eg. for 'Debugged-by',
> >>>>>>> 'Requested-by' etc.
> >>>>>>>
> >>>>>>> These are the complete lists of non-standard signatures:
> >>>>>>>
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/non_standard_signs.txt
> >>>>>>>
> >>>>>
> >>>>> Can you share which non-standard-signatures would be
> >>>>> handled/transformed with edit distance 2 and which would not in a
> >>>>> similar format to non_standard_signs.txt (so, ordered by frequency).
> >>>>>
> >>>>> We can then consider those that remain and find a good next strategy
> >>>>> for the most frequent non-standard signatures.
> >>>>>
> >>>>
> >>>> Non standard signatures handled with edit distance 2:
> >>>>
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/less_than2/signs_freq.txt
> >>>>
> >>>> Non standard signatures with edit distance greater than 2:
> >>>>
> https://github.com/AdityaSrivast/kernel-tasks/tree/master/random/non_standard_signature/more_than2
> >>>>
> >>>
> >>> I think this mail probably got missed. I'll summarize it a bit for
> >>> simplicity:
> >>> With edit distance approach and threshold as 2, we're able to handle
> >>> 39 out of 109 'distinct' cases of non-standard signature. In this 39,
> >>> the maximum count of non-standard signature is 19 for 'Reviwed-by:'; 9
> >>> for 'Reviewd-by:' and other common mispellings.
> >>> Complete List:
> >>>
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/less_than2/signs_freq.txt
> >>>
> >>> However, still we are unable to account for 70 non-standard signatures
> >>> which occur more frequently (eg 'Debugged-by:', which has occurred 61
> >>> times; 'Requested-by:', 48 times; and so on).
> >>> Complete list:
> >>>
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/more_than2/signs_freq.txt
> >>>
> >>> I think for these cases we'd need to make some file (as is used for
> >>> TYPO_SPELLING), or hash.
> >>> What do you think/suggest?
> >>>
> >>
> >> Yes, I agree.
> >>
> >> Goal 1: Try to map all the non-default signatures to their "standard"
> >> counterpart as much as possible.
> >>
> >> Goal 2: Introduce a few very little signatures to handle those cases
> >> that really cannot be mapped to a non-default signature.
> >>
> >> Provide good rationales that you can defend and provide documentation
> >> for when checkpatch shall explain the fix it proposes.
> >>
> >> Here an example for the first ten cases:
> >>
> >> 1)Debugged-by: 61 -> Codeveloped-by:
> >>
> >> Rationale: Debugging is part of Software Development; so
> >> Codeveloped-by is perfectly fine, even if the contributor did not
> >> create code.
> >>
> >> (alternatively: maybe a new Assisted-by would do here.)
> >>
> >> 2)Requested-by: 48 -> Suggested-by:
> >>
> >> Rationale: In an open-source project, there are "no requests", just
> >> "suggestions" to convince a maintainer to accept your patch.
> >>
> >> 3)Co-authored-by: 43 -> Codeveloped-by:
> >>
> >> Rationale: clear. Codeveloped-by and Co-authored-by are synonyms.
> >>
> >> 4)Originally-by: 39
> >>
> >> Maybe something like this deserves to be a new tag. There is a
> >> significant difference to codeveloped-by. But that needs discussion.
> >>
> >> 5)Analyzed-by: 22
> >>
> >> Rationale: Analyzing is part of Software Development; so
> >> Codeveloped-by is perfectly fine, even if the contributor did not
> >> create code.
> >> (alternatively: maybe a new Assisted-by would do here.)
> >>
> >> 6)Bisected-by: 20
> >>
> >> Difficult...
> >> (maybe a new Assisted-by would do here.)
> >>
> >> 7)Improvements-by: 19 -> Codeveloped-by:
> >>
> >> 8)Generated-by: 17 -> Reported-by: ?
> >>
> >> What does generated-by actually mean?
> >>
> >> 9)Noticed-by: 11 -> Reported-by:
> >>
> >> 10)Inspired-by: 11 -> Suggested-by:
> >>
> >> Maybe you can come up with a list for the next twenty and then we
> >> discuss them with Joe Perches and then a larger group?
> >>
>
> This is the list for next 20:
>
> 11)Original-patch-by: 11 -> co-developed-by / Originally-by (a new
> signoff)
> Rationale: I checked mailing list for one of these signoffs.
> Link1:
>
> https://lore.kernel.org/linux-perf-users/20190221122306.1511-1-jonas.rabenstein@studium.uni-erlangen.de/
> Link2
> <https://lore.kernel.org/linux-perf-users/20190221122306.1511-1-jonas.rabenstein@studium.uni-erlangen.de/Link2>
> :
>
> https://lore.kernel.org/linux-perf-users/20190307174433.28819-32-acme@kernel.org/
>
> Here it seems like someone who started working on the patch but
> couldn't complete it, but still has
> significant contribution in the patch.
> Maybe signing off as codeveloper suffices the purpose. I'm not sure though
>
> 12)Diagnosed-by: 11 -> Maybe 'Reviewed-by' or 'Acked-by'
> Rationale: Observed a few mailing lists, eg here:
> https://lore.kernel.org/lkml/20190609164128.000227333@linuxfoundation.org/
> But could not decide as the user is not adding it along the mails, but
> seems like a maintainer.
>
> 13)Based-on-a-patch-by: 8 -> Similar to 'Originally-by'
>
> 14)Verified-by: 8 -> Tested-by
> Rationale: Used by a single user. On reading, mailing list, it seems
> that 'Tested-by' tag might be a suitable alternative.
> Link:
>
> https://lore.kernel.org/lkml/CA+jURcugFhSt9GGRZELQUCnupOf2Ns96Ao5ZruWfVtq=z_7ytw@mail.gmail.com/
>
> 15)Okay-ished-by: 8 -> Acked-by
> Rationale: Used by a single user. On reading, mailing list, it seems
> that 'Acked-by' tag might be a suitable alternative.
> Link:
>
> https://lore.kernel.org/lkml/f06e74e9a38b83ec273196bce727295b828c5870.1507769413.git.rgb@redhat.com/
>
> 16)Based-on-patch-by: 7 -> Similar to (13) Based-on-a-patch-by
>
> 17)Root-caused-by: 6 -> Maybe 'Fixes:' followed by the commit it is
> fixing.
> Rationale: Going through mailing list, it comes up added with the
> patch. So I couldn't be sure
>
> 18)Original-by: 6 -> Similar to '(4)Originally-by'
>
> 19)Acked-for-MFD-by: 6 -> Acked-by:
>
> 20)Reviewed-off-by: 5 -> Reviewed-by:
>
> 21)Based-on-patches-by: 5 -> Similar to (13)
>
> 22)Analysed-by: 5 -> Co-developed-by/Reviewed-by
> Rationale: Similar to '(5)Analyzed-by'
>
> 23)Based-on-work-by: 5 -> Not sure. Maybe 'Suggested-by'
>
> 24)Proposed-by: 5 -> Maybe 'Suggested-by'
> Rationale: The tag comes up added with the patch,and the user is also
> given the tag 'Signed-off-by', but does not seem to participate in the
> conversation.
> Maybe he is a maintainer, who suggested the patch.
> mailing list:
> https://lore.kernel.org/linux-nvme/20200501212545.21856-3-sagi@grimberg.me/
>
> 25)Reported-and-bisected-by: 4 -> Two different tags: 'Reported-by:'
> and 'Bisected-by'
>
> 26)Fixed-by: 3 -> Co-developed-by
> Rationale: I observed one of these commit conservations here:
> https://lore.kernel.org/lkml/1b45ffd1-99bb-4ac1-fb65-0de3e42c1c0a@amd.com/
> It seems like there was some bug with this patch, which was fixed by
> the user. I guess Co-developed-by should go well as alternative.
>
> 27)Pointed-out-by: 3 -> Suggested-by
> Rationale: For commit 87bd4c26a6c8 ("clocksource/drivers/tegra: Lower
> clocksource rating for some Tegra's"), this warning occurs, where
> the patch is also 'Acked-by' Peter De Schrijver. So, it seems like he
> is a maintainer who must have suggested these changes
>
> 28)Suggestions-by: 3 -> Suggested-by
>
> 29)Celebrated-by: 3 -> Might be suggested to remove
> Rationale: This tag is used for a single commit 3 times, seems like a
> tag used for celebration of a particular patch
> Link:
>
> https://lore.kernel.org/lkml/CANRm+CyonYOzGdXo+D8gr8n04=f=S92QH-HxETKnoGGxhMFREA@mail.gmail.com/
>
> 30)Pointed-at-by: 2 -> Suggested-by
> Rationale: One of these tags is named for Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>, who is probably a maintainer.
> Here, the user might just want to acknowledge him for his suggestion,
> so 'Suggested-by' seems appropriate.
>
> What do you think?
>

I will provide some detailed comments in a few days, okay?

I suggest you start creating the patch that fixes tags with the low edit
distance.

Once that patch is good and accepted, we continue with the work on this
list.

Lukas


> Thanks
> Aditya
>

--000000000000bb3e4e05b4667505
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Mi.=
, 18. Nov. 2020 at 11:12, Aditya &lt;<a href=3D"mailto:yashsri421@gmail.com=
">yashsri421@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">On 18/11/20 2:24 am, Aditya wrote:<br>
&gt; On 17/11/20 11:12 pm, Lukas Bulwahn wrote:<br>
&gt;&gt; On Tue, Nov 17, 2020 at 7:03 PM Aditya &lt;<a href=3D"mailto:yashs=
ri421@gmail.com" target=3D"_blank">yashsri421@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 13/11/20 11:55 pm, Aditya wrote:<br>
&gt;&gt;&gt;&gt; On 13/11/20 8:56 pm, Lukas Bulwahn wrote:<br>
&gt;&gt;&gt;&gt;&gt; On Fri, Nov 13, 2020 at 4:00 PM Aditya &lt;<a href=3D"=
mailto:yashsri421@gmail.com" target=3D"_blank">yashsri421@gmail.com</a>&gt;=
 wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; On 13/11/20 8:05 pm, Aditya wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; On 12/11/20 1:34 am, Lukas Bulwahn wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; On Wed, Nov 11, 2020 at 3:13 PM Aditya &lt=
;<a href=3D"mailto:yashsri421@gmail.com" target=3D"_blank">yashsri421@gmail=
.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Hi Sir<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I have analyzed the checkpatch report =
for BAD_SIGN_OFF(over<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; v4.13..v5.8) for non-standard signatur=
e and generated reports for it.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Some mistakes are more frequent than o=
thers, whereas some mistakes<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; even have a frequency of 1.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Non-standard signatures occurring with=
 their frequency:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://github.com/AdityaSr=
ivast/kernel-tasks/blob/master/random/non_standard_signature/non_standard_s=
igns.txt" rel=3D"noreferrer" target=3D"_blank">https://github.com/AdityaSri=
vast/kernel-tasks/blob/master/random/non_standard_signature/non_standard_si=
gns.txt</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Complete warning messages:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://github.com/AdityaSr=
ivast/kernel-tasks/blob/master/random/non_standard_signature/warn_msgs.txt"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/AdityaSrivast/kern=
el-tasks/blob/master/random/non_standard_signature/warn_msgs.txt</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Should I implement the fix similar to =
TYPO_FIX, where we have a<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; separate file for common misspellings =
and corrected words? Or should I<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; make a hash of these misspellings in <=
a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">checkp=
atch.pl</a> file as well?<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Also should I include all these misspe=
lled words in it? Or omit words<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; below certain frequency?<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I think the best way would be to compute s=
ome kind of edit distance to<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; the known signature tags and if this edit =
distance is below a certain<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; threshold, suggest that signature tag as t=
he fix. We can then evaluate<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; to determine the best suitable threshold. =
The edit distance between<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; the different tags are so large that this =
should always work as<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; intended.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Then, we can look into these other creativ=
e tags and propose suitable<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; existing tags for the more frequent ones t=
hat are non-standard. Or in<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; the case, none of the existing ones fit we=
 can start the discussion on<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; proposing some new standard ones.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; I have generated a list of non-standard signat=
ures and their fixes on<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; the basis of edit distance.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; This is the common list of non standard signat=
ures and fixes (in<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; detail):<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://github.com/AdityaSrivast/ke=
rnel-tasks/blob/master/random/non_standard_signature/min_dists.txt" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/AdityaSrivast/kernel-tasks=
/blob/master/random/non_standard_signature/min_dists.txt</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; As I observed, I think, we can consider &#39;&=
lt;=3D2&#39; as the threshold edit<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; distance.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; List for non-standard signature and their prop=
osed fix with edit<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; distance&lt;=3D2 :<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://github.com/AdityaSrivast/ke=
rnel-tasks/blob/master/random/non_standard_signature/less_than_3.txt" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/AdityaSrivast/kernel-t=
asks/blob/master/random/non_standard_signature/less_than_3.txt</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; I have also generated lists for 3 and 4 edit d=
istance separately for<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; reference:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Equal to 3:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://github.com/AdityaSrivast/ke=
rnel-tasks/blob/master/random/non_standard_signature/equal_3.txt" rel=3D"no=
referrer" target=3D"_blank">https://github.com/AdityaSrivast/kernel-tasks/b=
lob/master/random/non_standard_signature/equal_3.txt</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Equal to 4:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://github.com/AdityaSrivast/ke=
rnel-tasks/blob/master/random/non_standard_signature/equal_4.txt" rel=3D"no=
referrer" target=3D"_blank">https://github.com/AdityaSrivast/kernel-tasks/b=
lob/master/random/non_standard_signature/equal_4.txt</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; For the rest I guess we&#39;ll need to hard co=
de eg. for &#39;Debugged-by&#39;,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &#39;Requested-by&#39; etc.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; These are the complete lists of non-standard s=
ignatures:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://github.com/AdityaSrivast/ke=
rnel-tasks/blob/master/random/non_standard_signature/non_standard_signs.txt=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/AdityaSrivast/ker=
nel-tasks/blob/master/random/non_standard_signature/non_standard_signs.txt<=
/a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Can you share which non-standard-signatures would be<b=
r>
&gt;&gt;&gt;&gt;&gt; handled/transformed with edit distance 2 and which wou=
ld not in a<br>
&gt;&gt;&gt;&gt;&gt; similar format to non_standard_signs.txt (so, ordered =
by frequency).<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; We can then consider those that remain and find a good=
 next strategy<br>
&gt;&gt;&gt;&gt;&gt; for the most frequent non-standard signatures.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Non standard signatures handled with edit distance 2:<br>
&gt;&gt;&gt;&gt; <a href=3D"https://github.com/AdityaSrivast/kernel-tasks/b=
lob/master/random/non_standard_signature/less_than2/signs_freq.txt" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/AdityaSrivast/kernel-tasks=
/blob/master/random/non_standard_signature/less_than2/signs_freq.txt</a><br=
>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Non standard signatures with edit distance greater than 2:=
<br>
&gt;&gt;&gt;&gt; <a href=3D"https://github.com/AdityaSrivast/kernel-tasks/t=
ree/master/random/non_standard_signature/more_than2" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/AdityaSrivast/kernel-tasks/tree/master/ra=
ndom/non_standard_signature/more_than2</a><br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I think this mail probably got missed. I&#39;ll summarize it a=
 bit for<br>
&gt;&gt;&gt; simplicity:<br>
&gt;&gt;&gt; With edit distance approach and threshold as 2, we&#39;re able=
 to handle<br>
&gt;&gt;&gt; 39 out of 109 &#39;distinct&#39; cases of non-standard signatu=
re. In this 39,<br>
&gt;&gt;&gt; the maximum count of non-standard signature is 19 for &#39;Rev=
iwed-by:&#39;; 9<br>
&gt;&gt;&gt; for &#39;Reviewd-by:&#39; and other common mispellings.<br>
&gt;&gt;&gt; Complete List:<br>
&gt;&gt;&gt; <a href=3D"https://github.com/AdityaSrivast/kernel-tasks/blob/=
master/random/non_standard_signature/less_than2/signs_freq.txt" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/AdityaSrivast/kernel-tasks/blo=
b/master/random/non_standard_signature/less_than2/signs_freq.txt</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; However, still we are unable to account for 70 non-standard si=
gnatures<br>
&gt;&gt;&gt; which occur more frequently (eg &#39;Debugged-by:&#39;, which =
has occurred 61<br>
&gt;&gt;&gt; times; &#39;Requested-by:&#39;, 48 times; and so on).<br>
&gt;&gt;&gt; Complete list:<br>
&gt;&gt;&gt; <a href=3D"https://github.com/AdityaSrivast/kernel-tasks/blob/=
master/random/non_standard_signature/more_than2/signs_freq.txt" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/AdityaSrivast/kernel-tasks/blo=
b/master/random/non_standard_signature/more_than2/signs_freq.txt</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I think for these cases we&#39;d need to make some file (as is=
 used for<br>
&gt;&gt;&gt; TYPO_SPELLING), or hash.<br>
&gt;&gt;&gt; What do you think/suggest?<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Yes, I agree.<br>
&gt;&gt;<br>
&gt;&gt; Goal 1: Try to map all the non-default signatures to their &quot;s=
tandard&quot;<br>
&gt;&gt; counterpart as much as possible.<br>
&gt;&gt;<br>
&gt;&gt; Goal 2: Introduce a few very little signatures to handle those cas=
es<br>
&gt;&gt; that really cannot be mapped to a non-default signature.<br>
&gt;&gt;<br>
&gt;&gt; Provide good rationales that you can defend and provide documentat=
ion<br>
&gt;&gt; for when checkpatch shall explain the fix it proposes.<br>
&gt;&gt;<br>
&gt;&gt; Here an example for the first ten cases:<br>
&gt;&gt;<br>
&gt;&gt; 1)Debugged-by: 61 -&gt; Codeveloped-by:<br>
&gt;&gt;<br>
&gt;&gt; Rationale: Debugging is part of Software Development; so<br>
&gt;&gt; Codeveloped-by is perfectly fine, even if the contributor did not<=
br>
&gt;&gt; create code.<br>
&gt;&gt;<br>
&gt;&gt; (alternatively: maybe a new Assisted-by would do here.)<br>
&gt;&gt;<br>
&gt;&gt; 2)Requested-by: 48 -&gt; Suggested-by:<br>
&gt;&gt;<br>
&gt;&gt; Rationale: In an open-source project, there are &quot;no requests&=
quot;, just<br>
&gt;&gt; &quot;suggestions&quot; to convince a maintainer to accept your pa=
tch.<br>
&gt;&gt;<br>
&gt;&gt; 3)Co-authored-by: 43 -&gt; Codeveloped-by:<br>
&gt;&gt;<br>
&gt;&gt; Rationale: clear. Codeveloped-by and Co-authored-by are synonyms.<=
br>
&gt;&gt;<br>
&gt;&gt; 4)Originally-by: 39<br>
&gt;&gt;<br>
&gt;&gt; Maybe something like this deserves to be a new tag. There is a<br>
&gt;&gt; significant difference to codeveloped-by. But that needs discussio=
n.<br>
&gt;&gt;<br>
&gt;&gt; 5)Analyzed-by: 22<br>
&gt;&gt;<br>
&gt;&gt; Rationale: Analyzing is part of Software Development; so<br>
&gt;&gt; Codeveloped-by is perfectly fine, even if the contributor did not<=
br>
&gt;&gt; create code.<br>
&gt;&gt; (alternatively: maybe a new Assisted-by would do here.)<br>
&gt;&gt;<br>
&gt;&gt; 6)Bisected-by: 20<br>
&gt;&gt;<br>
&gt;&gt; Difficult...<br>
&gt;&gt; (maybe a new Assisted-by would do here.)<br>
&gt;&gt;<br>
&gt;&gt; 7)Improvements-by: 19 -&gt; Codeveloped-by:<br>
&gt;&gt;<br>
&gt;&gt; 8)Generated-by: 17 -&gt; Reported-by: ?<br>
&gt;&gt;<br>
&gt;&gt; What does generated-by actually mean?<br>
&gt;&gt;<br>
&gt;&gt; 9)Noticed-by: 11 -&gt; Reported-by:<br>
&gt;&gt;<br>
&gt;&gt; 10)Inspired-by: 11 -&gt; Suggested-by:<br>
&gt;&gt;<br>
&gt;&gt; Maybe you can come up with a list for the next twenty and then we<=
br>
&gt;&gt; discuss them with Joe Perches and then a larger group?<br>
&gt;&gt;<br>
<br>
This is the list for next 20:<br>
<br>
11)Original-patch-by: 11 -&gt; co-developed-by / Originally-by (a new<br>
signoff)<br>
Rationale: I checked mailing list for one of these signoffs.<br>
Link1:<br>
<a href=3D"https://lore.kernel.org/linux-perf-users/20190221122306.1511-1-j=
onas.rabenstein@studium.uni-erlangen.de/Link2" rel=3D"noreferrer" target=3D=
"_blank">https://lore.kernel.org/linux-perf-users/20190221122306.1511-1-jon=
as.rabenstein@studium.uni-erlangen.de/<br>
Link2</a>:<br>
<a href=3D"https://lore.kernel.org/linux-perf-users/20190307174433.28819-32=
-acme@kernel.org/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel=
.org/linux-perf-users/20190307174433.28819-32-acme@kernel.org/</a><br>
<br>
Here it seems like someone who started working on the patch but<br>
couldn&#39;t complete it, but still has<br>
significant contribution in the patch.<br>
Maybe signing off as codeveloper suffices the purpose. I&#39;m not sure tho=
ugh<br>
<br>
12)Diagnosed-by: 11 -&gt; Maybe &#39;Reviewed-by&#39; or &#39;Acked-by&#39;=
<br>
Rationale: Observed a few mailing lists, eg here:<br>
<a href=3D"https://lore.kernel.org/lkml/20190609164128.000227333@linuxfound=
ation.org/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/lk=
ml/20190609164128.000227333@linuxfoundation.org/</a><br>
But could not decide as the user is not adding it along the mails, but<br>
seems like a maintainer.<br>
<br>
13)Based-on-a-patch-by: 8 -&gt; Similar to &#39;Originally-by&#39;<br>
<br>
14)Verified-by: 8 -&gt; Tested-by<br>
Rationale: Used by a single user. On reading, mailing list, it seems<br>
that &#39;Tested-by&#39; tag might be a suitable alternative.<br>
Link:<br>
<a href=3D"https://lore.kernel.org/lkml/CA+jURcugFhSt9GGRZELQUCnupOf2Ns96Ao=
5ZruWfVtq=3Dz_7ytw@mail.gmail.com/" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lore.kernel.org/lkml/CA+jURcugFhSt9GGRZELQUCnupOf2Ns96Ao5ZruWfVtq=3Dz=
_7ytw@mail.gmail.com/</a><br>
<br>
15)Okay-ished-by: 8 -&gt; Acked-by<br>
Rationale: Used by a single user. On reading, mailing list, it seems<br>
that &#39;Acked-by&#39; tag might be a suitable alternative.<br>
Link:<br>
<a href=3D"https://lore.kernel.org/lkml/f06e74e9a38b83ec273196bce727295b828=
c5870.1507769413.git.rgb@redhat.com/" rel=3D"noreferrer" target=3D"_blank">=
https://lore.kernel.org/lkml/f06e74e9a38b83ec273196bce727295b828c5870.15077=
69413.git.rgb@redhat.com/</a><br>
<br>
16)Based-on-patch-by: 7 -&gt; Similar to (13) Based-on-a-patch-by<br>
<br>
17)Root-caused-by: 6 -&gt; Maybe &#39;Fixes:&#39; followed by the commit it=
 is<br>
fixing.<br>
Rationale: Going through mailing list, it comes up added with the<br>
patch. So I couldn&#39;t be sure<br>
<br>
18)Original-by: 6 -&gt; Similar to &#39;(4)Originally-by&#39;<br>
<br>
19)Acked-for-MFD-by: 6 -&gt; Acked-by:<br>
<br>
20)Reviewed-off-by: 5 -&gt; Reviewed-by:<br>
<br>
21)Based-on-patches-by: 5 -&gt; Similar to (13)<br>
<br>
22)Analysed-by: 5 -&gt; Co-developed-by/Reviewed-by<br>
Rationale: Similar to &#39;(5)Analyzed-by&#39;<br>
<br>
23)Based-on-work-by: 5 -&gt; Not sure. Maybe &#39;Suggested-by&#39;<br>
<br>
24)Proposed-by: 5 -&gt; Maybe &#39;Suggested-by&#39;<br>
Rationale: The tag comes up added with the patch,and the user is also<br>
given the tag &#39;Signed-off-by&#39;, but does not seem to participate in =
the<br>
conversation.<br>
Maybe he is a maintainer, who suggested the patch.<br>
mailing list:<br>
<a href=3D"https://lore.kernel.org/linux-nvme/20200501212545.21856-3-sagi@g=
rimberg.me/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/l=
inux-nvme/20200501212545.21856-3-sagi@grimberg.me/</a><br>
<br>
25)Reported-and-bisected-by: 4 -&gt; Two different tags: &#39;Reported-by:&=
#39;<br>
and &#39;Bisected-by&#39;<br>
<br>
26)Fixed-by: 3 -&gt; Co-developed-by<br>
Rationale: I observed one of these commit conservations here:<br>
<a href=3D"https://lore.kernel.org/lkml/1b45ffd1-99bb-4ac1-fb65-0de3e42c1c0=
a@amd.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/lk=
ml/1b45ffd1-99bb-4ac1-fb65-0de3e42c1c0a@amd.com/</a><br>
It seems like there was some bug with this patch, which was fixed by<br>
the user. I guess Co-developed-by should go well as alternative.<br>
<br>
27)Pointed-out-by: 3 -&gt; Suggested-by<br>
Rationale: For commit 87bd4c26a6c8 (&quot;clocksource/drivers/tegra: Lower<=
br>
clocksource rating for some Tegra&#39;s&quot;), this warning occurs, where<=
br>
the patch is also &#39;Acked-by&#39; Peter De Schrijver. So, it seems like =
he<br>
is a maintainer who must have suggested these changes<br>
<br>
28)Suggestions-by: 3 -&gt; Suggested-by<br>
<br>
29)Celebrated-by: 3 -&gt; Might be suggested to remove<br>
Rationale: This tag is used for a single commit 3 times, seems like a<br>
tag used for celebration of a particular patch<br>
Link:<br>
<a href=3D"https://lore.kernel.org/lkml/CANRm+CyonYOzGdXo+D8gr8n04=3Df=3DS9=
2QH-HxETKnoGGxhMFREA@mail.gmail.com/" rel=3D"noreferrer" target=3D"_blank">=
https://lore.kernel.org/lkml/CANRm+CyonYOzGdXo+D8gr8n04=3Df=3DS92QH-HxETKno=
GGxhMFREA@mail.gmail.com/</a><br>
<br>
30)Pointed-at-by: 2 -&gt; Suggested-by<br>
Rationale: One of these tags is named for Greg Kroah-Hartman<br>
&lt;<a href=3D"mailto:gregkh@linuxfoundation.org" target=3D"_blank">gregkh@=
linuxfoundation.org</a>&gt;, who is probably a maintainer.<br>
Here, the user might just want to acknowledge him for his suggestion,<br>
so &#39;Suggested-by&#39; seems appropriate.<br>
<br>
What do you think?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I will provide s=
ome detailed comments in a few days, okay?</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">I suggest you start creating the patch that fixes tags w=
ith the low edit distance.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Once that patch is good and accepted, we continue with the work on this =
list.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Lukas</div><div di=
r=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Thanks<br>
Aditya<br>
</blockquote></div></div>

--000000000000bb3e4e05b4667505--

--===============3026376520477862509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3026376520477862509==--
