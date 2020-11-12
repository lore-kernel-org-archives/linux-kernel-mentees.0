Return-Path: <SRS0=3uRj=ES=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7071C5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Nov 2020 18:00:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03F7B21D91
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Nov 2020 18:00:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pL6LKGwd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03F7B21D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 331052E22D;
	Thu, 12 Nov 2020 18:00:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9e5NWFjnFby; Thu, 12 Nov 2020 18:00:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C1A952E1F6;
	Thu, 12 Nov 2020 18:00:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96AECC088B;
	Thu, 12 Nov 2020 18:00:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0ABCCC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 18:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 016BF87236
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 18:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ryQE8eSsusFn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 18:00:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 52C2887214
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 18:00:21 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id s10so7001894ioe.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 10:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8NYKz4sArIyPiO9S7EjMnjtrWj7I3f/gJozqtXxXzhg=;
 b=pL6LKGwdHA9YLxNnwspNdoO8gVWXGIncR6ONj6LJsE6nj9Pvhm9gSgS/NkSHiQ4H2f
 m/xxMTWSt6t0lc0dQfqpy1Ixq/fK+fuB7ow6BiEmAlewGvpBpKRZ242L9tVR7jqhIZVN
 Rh8zNOax6XGn9AS+eleasbX4zadBTL5XsaWkItNWyq51YH5/JAlEapssvpeNz6a30iaB
 /m5J+L/vtUwXyoAzXOoDC0kVatPPIEvUzTO5ZWdUG5DjQ/vEalMUsLbruQIHhuMODqON
 4qg6ogxc0uoeNIr+WJleO5Pe7IkjXJ8iaihKGBnum7ZF/xfDNdmZ170NW7eGcxT6ltVE
 D4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8NYKz4sArIyPiO9S7EjMnjtrWj7I3f/gJozqtXxXzhg=;
 b=RCiUBnOy508zfO50w1Jny20yyC4uZAPnaXW/bYOr9qZq3h9XR22KWFQG5LIy1DqrBC
 wXSaLmw8d2Yvf6D6bzqq0v+VlEvCWHwIZzwoyXvW32iz38M3VXZnWJXOiTwlaVx0pXPk
 oqHfN8OJa4FcBv3SKjBl+g7EfDSG5SdLs+1CW4oEOA3rnC2yLbbp4Av441qOFZs35epf
 bNPqnESsly9RINLxoJfAx72gqqvLx8M2cimnqdVo0MShXGgsTs5Qbl9FTdfdCQhUj5Cq
 o0BHwq3fqjYleDdfv2BAOl96j7AmYBVXgHZddYAISjefjzvEpnN/9lR8qL3UVHlLywh+
 3wgg==
X-Gm-Message-State: AOAM531Est2RFBtg4bKqtO7Ynsl9Ei2k/pGR3kbwv94o+MvTnzvIN+W3
 RC+DOMSlq4inu58HW2/6gXIQ1aJsEQXXQDmJE/s=
X-Google-Smtp-Source: ABdhPJxUcoyIW+Al0y9RyFGKQtYTVU3PS9HA4c8FH7koJkcntNFQNVt3oaSmghHMsajsXsNBuBvYNwCamwGeOJOkGeQ=
X-Received: by 2002:a05:6602:3353:: with SMTP id
 c19mr230837ioz.114.1605204020596; 
 Thu, 12 Nov 2020 10:00:20 -0800 (PST)
MIME-Version: 1.0
References: <20201111191954.398-1-yashsri421@gmail.com>
 <CAKXUXMyxx=ncsSU1aTVo4bYrYf0hVr8195OU-MUKMT1Zv1K5jw@mail.gmail.com>
 <c93472a8-2fc1-5a74-dbe3-dc85c92175b5@gmail.com>
 <155d1824-799f-8994-ec03-a1207928e8c7@gmail.com>
 <6a441b7a-a567-6579-be1c-849604191a07@gmail.com>
In-Reply-To: <6a441b7a-a567-6579-be1c-849604191a07@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 12 Nov 2020 19:00:13 +0100
Message-ID: <CAKXUXMz91sBHATfjO7NksF4qb7fiGqp5jpfyuiJCihoeG79P-w@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Thu, Nov 12, 2020 at 6:35 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 12/11/20 10:10 pm, Dwaipayan Ray wrote:
> >
> > On 12/11/20 1:05 am, Aditya wrote:
> >> On 12/11/20 12:56 am, Lukas Bulwahn wrote:
> >>> On Wed, Nov 11, 2020 at 8:20 PM Aditya Srivastava
> >>> <yashsri421@gmail.com> wrote:
> >>>> Currently checkpatch warns us for long lines in commits even for
> >>>> signature tag lines.
> >>>>
> >>>> E.g., running checkpatch on commit 4bbdfe25600c ("IB/opa_vnic:
> >>>> Properly
> >>>> clear Mac Table Digest") reports this warning:
> >>>>
> >>>> WARNING: Possible unwrapped commit description (prefer a maximum
> >>>> 75 chars per line)
> >>>> Reviewed-by: Niranjana Vishwanathapura
> >>>> <niranjana.vishwanathapura@intel.com>
> >>>>
> >>>> This is an example of false positive. Provide a fix by excluding
> >>>> signature tag lines from this class of warning.
> >>>>
> >>>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> >>>> ---
> >>>>   scripts/checkpatch.pl | 2 ++
> >>>>   1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> >>>> index ac7e5ac80b58..1d257b1f4a4f 100755
> >>>> --- a/scripts/checkpatch.pl
> >>>> +++ b/scripts/checkpatch.pl
> >>>> @@ -2963,6 +2963,8 @@ sub process {
> >>>>                                          # filename then :
> >>>>                        $line =~ /^\s*(?:Fixes:|Link:)/i ||
> >>>>                                          # A Fixes: or Link: line
> >>>> +                     $line =~ /^\s*(?:$signature_tags)/ ||
> >>>> +                                       # signature tag line
> >>> Can you simply add this check to the expression above?
> >>>
> >> Yes, we can do it. But then the match will become case insensitive
> >> (because of presence of '/i'). Should I do it irrespective?
> >>
> >> Thanks
> >> Aditya
> >>
> > I think the check might be better as case insensitive because:
> >
> > $ git log --format=email -100000 | grep "^CC:" | wc -l
> > 773
> >
> > $ git log --format=email -100000 | grep "^Cc:" | wc -l
> > 59475
> >
> > $ git log --format=email -100000 | grep "^cc:" | wc -l
> > 95
> >
> > All three cases were used for Cc: ...
> >
> > Thanks,
> > Dwaipayan.
> >
>
> Thanks Dwaipayan. You seem to be correct. I just observed, we are
> already using '/xi' flags with $signature_tags values itself. So, case
> insensitive part seems already covered.
>
> I think I can modify the changes to include this check in the previous
> if-block itself as Sir had suggested initially. This shouldn't change
> our evaluation as well.
>
> Sir, should I make the changes as you suggested initially or should we
> proceed with it?
>

Make it case-insensitive and include it in the condition above.

Please write Lukas not Sir; that simply confuses me.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
