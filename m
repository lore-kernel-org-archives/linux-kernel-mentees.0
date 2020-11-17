Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33CEC2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 18:42:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 268DF223C7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 18:42:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SL8UgfyG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 268DF223C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8B45F84CF3;
	Tue, 17 Nov 2020 18:42:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L+4Rrl-EUNJu; Tue, 17 Nov 2020 18:42:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D1FA08471C;
	Tue, 17 Nov 2020 18:42:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B74A9C0891;
	Tue, 17 Nov 2020 18:42:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5359FC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 18:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3935E87016
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 18:42:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h4yV5mUUti0E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 18:42:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 31E7C87006
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 18:42:19 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id s24so22210001ioj.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YA9h/Jo//o1qO+IFxpmuStw3rka5Fd1SNXuetHGuzc8=;
 b=SL8UgfyGIUW6LG4hPPLc3K5ppIouSe0eNlsgvYL+YYAKjDZ2bIA5SwOmT4taI4uB9t
 WcH5AOj9/4V2hm+LX04YgQJr6p/kTcaHtXzeFDIZWQBZvGIh260Rmt/bPBSHAT22ozUS
 TJKcOB3Q8LCTp4efFYSiFLIexO8fUkBsAmsQ5L4wcu5zzoQZ6CCGgczAh014ngzZtjVf
 ottYFxalDXafY2yh1Y4cfzvlvxTB8tKlRzF8rGgr2cpRKhTRc7KXVp7LQKPi2IFwC17q
 RLUxIs1taJzrc/LmcZurilOMtZufKHHktGjAagOp4Ik8hMGHC22YvRBtn4EHROmn0WH8
 pNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YA9h/Jo//o1qO+IFxpmuStw3rka5Fd1SNXuetHGuzc8=;
 b=J6LRcLSXoxCb9SvTXANTqYnd3EDmYootIMm3KB9O6133DwBW6Ad7dqwL3AimyhuRZT
 oTsGW3Aea1+Lsf23uFnila+kTEPPd3RUChLr8/TC9tq1WG7oL5FMV/XVf+H1uY3zsH9N
 yqefbRcCYXSNcVCJ0X3mb6gzMTZmIknHGHa8KiVDqked2q4AqAo1TBBEypWIQfvPa+S7
 f8Q1wjB6Eb/p5sTgJYXKh3XvG7kiNZGbl+Bnn77toucdUKFNvJtrKSXNzgiQ3h5qNudU
 unHxoDytDiskCYu2xVw5EfTi+c7XofvVxod7Rrh5EYIYCvBvB1fX5xtyzlPqyCy70+a1
 dqYA==
X-Gm-Message-State: AOAM533W6G8ErnsvjODkTMUPOOoxpevQwL9ohFbKak147gKe7f97hZUX
 rWYMRzqvMuAzCUW0z97qtTh89mXsfw5opuVmDlE=
X-Google-Smtp-Source: ABdhPJwpSOsXC02mHItTVlt1uPdHrYGWHk5l49QNHzBLeXiJDOxFMkKTtqgy/0GCgUcJ7dDUbpLyRYJZMsAn9R3Iuq0=
X-Received: by 2002:a6b:d80c:: with SMTP id y12mr12357435iob.183.1605638538244; 
 Tue, 17 Nov 2020 10:42:18 -0800 (PST)
MIME-Version: 1.0
References: <50c8be3c-fceb-255b-43ba-1ce8284ab410@gmail.com>
 <CAKXUXMw2=4E8XpZFx04pkBmvwDSpcCedxE2ndX4DX5DTek_06g@mail.gmail.com>
 <ed152561-0932-65e2-fc86-3540fc456b09@gmail.com>
 <483df3b1-219c-129e-2c88-5411e012a9e1@gmail.com>
 <CAKXUXMx4-2-=XkXkvUcx6GuNmwfkSyYbOWc04uXkFgnHxsNNvQ@mail.gmail.com>
 <31eeb998-0f1a-5ae2-fd0a-62fd1cf3349b@gmail.com>
 <bde0d09e-39fb-234c-c7b3-42d859414794@gmail.com>
In-Reply-To: <bde0d09e-39fb-234c-c7b3-42d859414794@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 17 Nov 2020 18:42:07 +0100
Message-ID: <CAKXUXMwsUYgg+oOADM3wrryr2Vob_Yo1YX-ms5eKCeCAx7HTpw@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Nov 17, 2020 at 7:03 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 13/11/20 11:55 pm, Aditya wrote:
> > On 13/11/20 8:56 pm, Lukas Bulwahn wrote:
> >> On Fri, Nov 13, 2020 at 4:00 PM Aditya <yashsri421@gmail.com> wrote:
> >>>
> >>> On 13/11/20 8:05 pm, Aditya wrote:
> >>>> On 12/11/20 1:34 am, Lukas Bulwahn wrote:
> >>>>> On Wed, Nov 11, 2020 at 3:13 PM Aditya <yashsri421@gmail.com> wrote:
> >>>>>>
> >>>>>> Hi Sir
> >>>>>> I have analyzed the checkpatch report for BAD_SIGN_OFF(over
> >>>>>> v4.13..v5.8) for non-standard signature and generated reports for it.
> >>>>>> Some mistakes are more frequent than others, whereas some mistakes
> >>>>>> even have a frequency of 1.
> >>>>>>
> >>>>>> Non-standard signatures occurring with their frequency:
> >>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/non_standard_signs.txt
> >>>>>>
> >>>>>> Complete warning messages:
> >>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/warn_msgs.txt
> >>>>>>
> >>>>>> Should I implement the fix similar to TYPO_FIX, where we have a
> >>>>>> separate file for common misspellings and corrected words? Or should I
> >>>>>> make a hash of these misspellings in checkpatch.pl file as well?
> >>>>>>
> >>>>>> Also should I include all these misspelled words in it? Or omit words
> >>>>>> below certain frequency?
> >>>>>>
> >>>>>
> >>>>> I think the best way would be to compute some kind of edit distance to
> >>>>> the known signature tags and if this edit distance is below a certain
> >>>>> threshold, suggest that signature tag as the fix. We can then evaluate
> >>>>> to determine the best suitable threshold. The edit distance between
> >>>>> the different tags are so large that this should always work as
> >>>>> intended.
> >>>>>
> >>>>> Then, we can look into these other creative tags and propose suitable
> >>>>> existing tags for the more frequent ones that are non-standard. Or in
> >>>>> the case, none of the existing ones fit we can start the discussion on
> >>>>> proposing some new standard ones.
> >>>>>
> >>>>
> >>>> I have generated a list of non-standard signatures and their fixes on
> >>>> the basis of edit distance.
> >>>>
> >>>> This is the common list of non standard signatures and fixes (in
> >>>> detail):
> >>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/min_dists.txt
> >>>>
> >>>> As I observed, I think, we can consider '<=2' as the threshold edit
> >>>> distance.
> >>>> List for non-standard signature and their proposed fix with edit
> >>>> distance<=2 :
> >>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/less_than_3.txt
> >>>>
> >>>> I have also generated lists for 3 and 4 edit distance separately for
> >>>> reference:
> >>>> Equal to 3:
> >>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/equal_3.txt
> >>>>
> >>>> Equal to 4:
> >>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/equal_4.txt
> >>>>
> >>>> For the rest I guess we'll need to hard code eg. for 'Debugged-by',
> >>>> 'Requested-by' etc.
> >>>>
> >>>> These are the complete lists of non-standard signatures:
> >>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/non_standard_signs.txt
> >>>>
> >>
> >> Can you share which non-standard-signatures would be
> >> handled/transformed with edit distance 2 and which would not in a
> >> similar format to non_standard_signs.txt (so, ordered by frequency).
> >>
> >> We can then consider those that remain and find a good next strategy
> >> for the most frequent non-standard signatures.
> >>
> >
> > Non standard signatures handled with edit distance 2:
> > https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/less_than2/signs_freq.txt
> >
> > Non standard signatures with edit distance greater than 2:
> > https://github.com/AdityaSrivast/kernel-tasks/tree/master/random/non_standard_signature/more_than2
> >
>
> I think this mail probably got missed. I'll summarize it a bit for
> simplicity:
> With edit distance approach and threshold as 2, we're able to handle
> 39 out of 109 'distinct' cases of non-standard signature. In this 39,
> the maximum count of non-standard signature is 19 for 'Reviwed-by:'; 9
> for 'Reviewd-by:' and other common mispellings.
> Complete List:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/less_than2/signs_freq.txt
>
> However, still we are unable to account for 70 non-standard signatures
> which occur more frequently (eg 'Debugged-by:', which has occurred 61
> times; 'Requested-by:', 48 times; and so on).
> Complete list:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/more_than2/signs_freq.txt
>
> I think for these cases we'd need to make some file (as is used for
> TYPO_SPELLING), or hash.
> What do you think/suggest?
>

Yes, I agree.

Goal 1: Try to map all the non-default signatures to their "standard"
counterpart as much as possible.

Goal 2: Introduce a few very little signatures to handle those cases
that really cannot be mapped to a non-default signature.

Provide good rationales that you can defend and provide documentation
for when checkpatch shall explain the fix it proposes.

Here an example for the first ten cases:

1)Debugged-by: 61 -> Codeveloped-by:

Rationale: Debugging is part of Software Development; so
Codeveloped-by is perfectly fine, even if the contributor did not
create code.

(alternatively: maybe a new Assisted-by would do here.)

2)Requested-by: 48 -> Suggested-by:

Rationale: In an open-source project, there are "no requests", just
"suggestions" to convince a maintainer to accept your patch.

3)Co-authored-by: 43 -> Codeveloped-by:

Rationale: clear. Codeveloped-by and Co-authored-by are synonyms.

4)Originally-by: 39

Maybe something like this deserves to be a new tag. There is a
significant difference to codeveloped-by. But that needs discussion.

5)Analyzed-by: 22

Rationale: Analyzing is part of Software Development; so
Codeveloped-by is perfectly fine, even if the contributor did not
create code.
(alternatively: maybe a new Assisted-by would do here.)

6)Bisected-by: 20

Difficult...
(maybe a new Assisted-by would do here.)

7)Improvements-by: 19 -> Codeveloped-by:

8)Generated-by: 17 -> Reported-by: ?

What does generated-by actually mean?

9)Noticed-by: 11 -> Reported-by:

10)Inspired-by: 11 -> Suggested-by:

Maybe you can come up with a list for the next twenty and then we
discuss them with Joe Perches and then a larger group?

Lukas

> Thanks
> Aditya
>
> > Thanks
> > Aditya
> >
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
