Return-Path: <SRS0=RhO4=ER=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E602C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 19:54:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DAC9207F7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 19:54:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFvZVzr0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DAC9207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7537086C8F;
	Wed, 11 Nov 2020 19:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jjT8_MPPjFHi; Wed, 11 Nov 2020 19:54:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 00FB486C77;
	Wed, 11 Nov 2020 19:54:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4C7CC088B;
	Wed, 11 Nov 2020 19:54:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36211C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 19:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2070087596
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 19:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uMOj6cz0-23M
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 19:54:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 742E387571
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 19:54:42 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id s10so3575575ioe.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 11:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T372uDFK2yxCFV5VTyTh0Bwvd/3Yn64gIuWnALo4gsM=;
 b=iFvZVzr08DozS0pgLZgGK+qXq6+H/lOuxTQQXEcVK8vUTouIUgR9MzCd7pnVfHMFzk
 7BiTZ1uPukrg+Pz+w1p5zCL09XOpCmTHx5vHXrHh/g0fGxLCtRVOFD/NPftIKbp0dmO9
 4VZ5JUS9vXoLtPyy7oWykMmUCYKmfHETCZNflNNTWPmu7GP8+V1ePt7jN0HJsPUcj2J2
 +f0immF36L1LUSMqt6MoNIzERGZs5kkTlaUUqjXrC7bnxYqpSgVy8JAY3dEM8zRvUNUq
 UthbsviMZKLPhmbG+eF7ISQLkpFbujs/b2+jCo9QjqeKyjT3XfPrw7Zq9cA+Q8MzP8ES
 PqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T372uDFK2yxCFV5VTyTh0Bwvd/3Yn64gIuWnALo4gsM=;
 b=GWL+OtWq8Xd5GVpoNv0++T+ILISsmmxZBSszs8ASVIXWzdmfCI1jeto4aPtIlCMXaG
 nYti4Sih8qTeQnkbZ9mHzQETQ9cJ7mLJEdQZAxuhIMHSPjsidoegm70sf8ZSgZGZ/cEZ
 ymyJaLc09b3K8KWXN3YS/hcJR+5ZGfRPvv7Wsre7b2qvxVwmZP9hQqIDAelpo7YWj1e2
 gZ+qoeCqcfC6AOY41DaLJ68o523RqlQMfFTgzx3C595Gn1+G3E4E8xL2P2J2EB/3E6D1
 gLZGiSh+xGwSytzwPxLQKjUNE+lZ0UFbBV3LqWoQKLfbc2HaLEmF5bW/4dqh8OTpMV1T
 pFkQ==
X-Gm-Message-State: AOAM533bON9qkSIIrbeXuPL5pexDi1ARflzyFr+gbPq25L53ccFjQXRO
 snnAFz5SRvSnPtDzjMyUjvRtpIDoDtMYdmcdFks=
X-Google-Smtp-Source: ABdhPJyrfkeSvHtRoevgsMN3Xcwrd2GzJpxxjUemdRfXetdP+tkQEYomPH3/F+CuYiHFXfkGwGqlHw3Nxvf1dqQdU7I=
X-Received: by 2002:a5e:820d:: with SMTP id l13mr11432596iom.102.1605124481709; 
 Wed, 11 Nov 2020 11:54:41 -0800 (PST)
MIME-Version: 1.0
References: <20201111191954.398-1-yashsri421@gmail.com>
 <CAKXUXMyxx=ncsSU1aTVo4bYrYf0hVr8195OU-MUKMT1Zv1K5jw@mail.gmail.com>
 <c93472a8-2fc1-5a74-dbe3-dc85c92175b5@gmail.com>
In-Reply-To: <c93472a8-2fc1-5a74-dbe3-dc85c92175b5@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 11 Nov 2020 20:54:33 +0100
Message-ID: <CAKXUXMzLOZYsptUUVQK0CF-FGPhHfJJwEepvA-0eBrL45HhMcw@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: avoid
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

On Wed, Nov 11, 2020 at 8:35 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 12/11/20 12:56 am, Lukas Bulwahn wrote:
> > On Wed, Nov 11, 2020 at 8:20 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
> >>
> >> Currently checkpatch warns us for long lines in commits even for
> >> signature tag lines.
> >>
> >> E.g., running checkpatch on commit 4bbdfe25600c ("IB/opa_vnic: Properly
> >> clear Mac Table Digest") reports this warning:
> >>
> >> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> >> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> >>
> >> This is an example of false positive. Provide a fix by excluding
> >> signature tag lines from this class of warning.
> >>
> >> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> >> ---
> >>  scripts/checkpatch.pl | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> >> index ac7e5ac80b58..1d257b1f4a4f 100755
> >> --- a/scripts/checkpatch.pl
> >> +++ b/scripts/checkpatch.pl
> >> @@ -2963,6 +2963,8 @@ sub process {
> >>                                         # filename then :
> >>                       $line =~ /^\s*(?:Fixes:|Link:)/i ||
> >>                                         # A Fixes: or Link: line
> >> +                     $line =~ /^\s*(?:$signature_tags)/ ||
> >> +                                       # signature tag line
> >
> > Can you simply add this check to the expression above?
> >
> Yes, we can do it. But then the match will become case insensitive
> (because of presence of '/i'). Should I do it irrespective?
>

I see. Then keep it as is and start the evaluation.

Lukas

> Thanks
> Aditya
>
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
