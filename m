Return-Path: <SRS0=uYLy=EV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE86C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 20:18:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E913223AB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 20:18:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGGPjPZf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E913223AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E9D0486A1C;
	Sun, 15 Nov 2020 20:18:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ffEubHjvT+tt; Sun, 15 Nov 2020 20:18:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3973886A16;
	Sun, 15 Nov 2020 20:18:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C7EDC0891;
	Sun, 15 Nov 2020 20:18:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94A7AC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 20:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7D5B62035B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 20:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OwX2pLwdfRHf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 20:18:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 1C47F2002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 20:18:10 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id n5so13267269ile.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 12:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7+Xy8sD6nFJMfW4iVw1pjLAVMDPxwTeO3b5S6+Yoh34=;
 b=iGGPjPZf4U1CivlFnAqMcgOBtNIb9i1mfy4AkH+H9OLdRvBAdLZFPxoeUF2jSP9FT3
 UidcZ8hF/CHfMm1LF8hp69RERBkF0K9Gqh8oJIbl5eukWfr+DbPCdCOE33vQn9NUuEws
 9f4WMAm1WOtBl9Aw6EIRuTcHhDeL1L9Y7ymej3DoPJ3aSMEZkTDmj28QgCn/zb1sHBGH
 /0CchwmZGuA+PAZBwKiP5OBWxk5EBldRyN+Ll4C2YwJ0Qr2XHPxJAsCR01B2yHzkLEEG
 JOMutM+nuZ8FeJNhNiRBPWFlJq/63SkdPXyfYTfGmkDtaL4T2YLKIrtXv7M4May515fv
 TEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7+Xy8sD6nFJMfW4iVw1pjLAVMDPxwTeO3b5S6+Yoh34=;
 b=QqEuq2WVdmmt31dOYuUxYdwS102DjevbPUjugwbYTZQIos7t6jJmSpgkm0sJTas8Dk
 ksqYWGhPQ+ELdCkET5bL04EdNcephSKwnbtnlKvipLH2rMzcOY9CAHi4JHwZYEw8/tOT
 EiVSbF1QFTlPx/QcPv+UprXKnNPw0tuAfMY5YJcCDLyalpNAb2hK8SrELJyqGG8BWhZ7
 E+2y5gDWg6DPXyxLdkBlNoRPOvdJ0WNCEdTPnjpGVzOvYkSqJFlTfJ9MPXvQQm6esSHF
 r2O7s/nr7iNfxpZjXzK3UbETkiYwiRnMBj8JnihkZ5AAP86MFBj4oRtDUICQFDt9ybWe
 2/lw==
X-Gm-Message-State: AOAM532S84XlaB1nEOIAhoVrByX9ly1OwfL46uRAS9OhLXe2fFJtN+yz
 b0uMK4tdIm6R+BLS3hxopNJlaYMXCciHBzm1AeS02S3fUmdIaw==
X-Google-Smtp-Source: ABdhPJxsT+4xfzIK31vrMNht9292VLYoV3/ANG/i4+vh432eAf1SpxAgZR+mqmpqAPD34Kt5kig4vJXgOc6Ee+tV4qU=
X-Received: by 2002:a92:35c7:: with SMTP id c68mr6259128ilf.251.1605471489360; 
 Sun, 15 Nov 2020 12:18:09 -0800 (PST)
MIME-Version: 1.0
References: <20201112195840.5094-1-yashsri421@gmail.com>
 <CAKXUXMwREFprvpSnz++U18-HCQ8k9rw8z0swUvEsTDfu2EAN6g@mail.gmail.com>
 <7eb65dfe-5059-5513-1dc0-37364adb23d4@gmail.com>
In-Reply-To: <7eb65dfe-5059-5513-1dc0-37364adb23d4@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 15 Nov 2020 21:17:58 +0100
Message-ID: <CAKXUXMwpgPLHc81JoB3TVFjaArMRkfHPZd_8F2xkGVeUeYFhbA@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: avoid
 COMMIT_LOG_LONG_LINE warning for signature tags
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

On Sun, Nov 15, 2020 at 6:00 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 15/11/20 8:55 pm, Lukas Bulwahn wrote:
> > On Thu, Nov 12, 2020 at 8:58 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
> >>
> >> Currently checkpatch warns us for long lines in commits even for
> >> signature tag lines.
> >>
> >> Generally these lines exceed 75 characters limit because of:
> >
> > ... exceed the 75-character limit because of:
> >
> > [yes, English is strange ;)]
> >
> >> 1) long names and long email address
> >> 2) some comments on scoped review and acknowledgement, i.e., for a
> >> dedicated pointer on what was reported by the identity in 'Reported-by'
> >> 3) some additional comments on CC: stable@vger.org tags
> >>
> >> Exclude signature tag lines from this class of warning.
> >>
> >> A quick evaluation on v5.6..v5.8 showed that this fix reduces this
> >> warning by a frequency of 17.
> >>
> >
> > frequency is the wrong word here. It is simply "count" here.
> >
> Okay.
>
> > Also how many warnings were there before and how many after?
> >
> > The count of 17 does not tell you much on the relative impact of the change.
> >
> >
>
> So, before this patch, COMMIT_LOG_LONG_LINE had frequency of 1896 and
> after the patch, it becomes 1879 (over v5.6..v5.8). Should I add this
> information in commit message as well
>

And I repeat: "frequency" is the wrong word; this is NOT a frequency.

Just write:

There were 1896 COMMIT_LOG_LONG_LINE warnings in v5.6..v5.8 before
this patch application and 1879 afterwards.

You are using the word frequency wrongly. It is probably best to just
remove that word from your vocabulary for now.

Send a new patch with a corrected description and I will review.


> >> A quick manual check found all the dropped warnings related to signature
> >> tags.
> >>
> >
> > What did the quick manual check found?
> > Do you mean the quick manual check found all ... to be false positive
> > that should not have been warned about?
> >
>
> Yes, all the dropped warnings are prefixed by signature tags.
> Generated list:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/signature_tags/dropped/summary.txt
>
> > Other than that, it looks good.
> >
> > Lukas
> >
> >> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> >> ---
> >>  scripts/checkpatch.pl | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> >> index ac7e5ac80b58..f2369ac29d50 100755
> >> --- a/scripts/checkpatch.pl
> >> +++ b/scripts/checkpatch.pl
> >> @@ -2961,8 +2961,8 @@ sub process {
> >>                                         # file delta changes
> >>                       $line =~ /^\s*(?:[\w\.\-]+\/)++[\w\.\-]+:/ ||
> >>                                         # filename then :
> >> -                     $line =~ /^\s*(?:Fixes:|Link:)/i ||
> >> -                                       # A Fixes: or Link: line
> >> +                     $line =~ /^\s*(?:Fixes:|Link:|$signature_tags)/i ||
> >> +                                       # A Fixes: or Link: line or signature tag line
> >>                       $commit_log_possible_stack_dump)) {
> >>                         WARN("COMMIT_LOG_LONG_LINE",
> >>                              "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
> >> --
> >> 2.17.1
> >>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
