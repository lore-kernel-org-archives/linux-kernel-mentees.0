Return-Path: <SRS0=s3T2=MJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64D0C636C9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 16:36:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E5EB61159
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 16:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E5EB61159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0CEB605E4;
	Sat, 17 Jul 2021 16:36:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QG4p74TgBCcl; Sat, 17 Jul 2021 16:36:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 12AB8605D4;
	Sat, 17 Jul 2021 16:36:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D82A2C0010;
	Sat, 17 Jul 2021 16:36:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80F35C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 16:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C12983DF8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 16:36:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1YNEWrTli70v
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 16:36:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D3DD83DF1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 16:36:39 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id l11so3326201ljq.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 09:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SkMlw8sDK4x+Pk/GdYuX6GzVl2QVVd+N8oR1JTo6z20=;
 b=lXlSll397JkeosdmISy2omvTcAFmUA55/f3OQgK0ezzsN9nLMLl/Mb+Um31Bu50/Dq
 v8Sn0K2CJ2r9Hxuro9DKj42BhE7SFsZC3/wGcWNddh8GKK2ij/fhGRHt/gSAbNxRjgI6
 Ux3vrGcWbLS7J5GH56qf4U7YR6sMibG7E2VLYMikTv8y2wn0vWzHEC39kpY7Ji6+8mSA
 uK8IMGlFEZv0Omx3xKb1kVtk5qDzCvrE1l4N5IomoRXF22IwQ+NOkEN2ToR/RT2+EQxt
 0+YwUZw67ZDKyLwgoIBd5+33kUQxyRleFko4JkkDP8j2HQXJkB6xeCSDCVb0fOu4a5LL
 J9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SkMlw8sDK4x+Pk/GdYuX6GzVl2QVVd+N8oR1JTo6z20=;
 b=WjTRNdmAr5OlXomjugqAvZAkWxYp+dcp5ALzoRbiJtzNETJ7iLR1NvUT6LJWaWW6xy
 xGcoObsYjrojJBBxJqM32T6J4F/HnrNmR77x6MPVG4itP+BmUlXKylvAsZsrqKV/UQxC
 1kKS46KiZLL+r2vDq+7bVAlQP4mh3yM9L+p4RIaOeh5NezJSTXRXC25cIa82yo6/CGHX
 YttBL48J5dRfEGzI2IQIi8kmOsHJ3KywWGvE7MlB3KtCr85JwEbQYTfFNMc2QDf7+UOB
 ++FhI8R4pUB4idl9BDw8oWM6xe5BXetyfLwynw8OUlAQpUkjrUHmnE+hPAvpQm4piaYy
 zDzA==
X-Gm-Message-State: AOAM5321GA5BjPXIqF6NRKs41zvf7UBN1FQXkElRx0FUUGCoNhiHDFMe
 8OpbLnv22ym14+AGJWGlyTAAmSbMz/AAgMbie6Q=
X-Google-Smtp-Source: ABdhPJx17M1feKj/AoqbbTENq/gYwXHhgtc7onbaFIDAff3BpyWUNhlQfFwgxqToq+xl5QX/voZ0IqIJ4PfKS8YbeLg=
X-Received: by 2002:a2e:934b:: with SMTP id m11mr14597805ljh.284.1626539797697; 
 Sat, 17 Jul 2021 09:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAEQwXtiEpzO_8T7VC8dFp3tieV+1JpW1O7m0MTgw4vvdy09gsg@mail.gmail.com>
 <CABJPP5CgAFP8ejqjha62T9GEW2gau=-GC3CTO1s6eq=_ADsnOA@mail.gmail.com>
 <CAEQwXthguwDuB19NMEkfuftxta+wNvsTVzD+UbB=Pa4CM9fK7A@mail.gmail.com>
 <CAKXUXMy2djTKxXso_U-NVOJEU6XD-ZyfExyfB=pPJC-ws0sM4g@mail.gmail.com>
In-Reply-To: <CAKXUXMy2djTKxXso_U-NVOJEU6XD-ZyfExyfB=pPJC-ws0sM4g@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 17 Jul 2021 22:06:26 +0530
Message-ID: <CABJPP5AJm2A-OSGoYiOiuCxp79GgLn+FnKwRzyC9xG1t=+K7AQ@mail.gmail.com>
Subject: Re: Regarding LFX Mentorship Project
To: Ashutosh Sharma <b18010@students.iitmandi.ac.in>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Sat, Jul 17, 2021 at 9:46 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Sat, Jul 17, 2021 at 6:02 PM Ashutosh Sharma
> <b18010@students.iitmandi.ac.in> wrote:
> >
> > Hello,
> > I am enclosing my submission for assignment 1. For this assignment I went through the checkpatch documentation which I found on https://www.kernel.org/doc/html/latest/dev-tools/checkpatch.html and then I looked at the implementation of checkpatch and tried to understand what is happening by the comments.
> > Thanks
> > Ashutosh
>
> Ashutosh, you unfortunately failed on step 0 to learn suitable
> netiquette for the communication with the kernel community. Sorry, we
> will not answer your email and not continue to exchange with you until
> the suitable netiquette for the communication with the kernel
> community is followed. Please go back to step 0, consider the rules
> for communication with the kernel, check what you did wrong and
> improve all those issues and try sending your email properly again.
>

Same as what Lukas said. Please read the zeroth task and then attempt
again at the first task.

Also to add, your submission is wrong. See ./scripts/checkpatch.pl --help
to understand why.

Hint is in your output:
ERROR: Does not appear to be a unified-diff format patch

Thanks,
Dwaipayan.

> Our mentorship program is an offer to learn; so read the available
> documentation on communication with the kernel community, and give it
> another try. When you learn now at the beginning, your continued
> journey in the kernel community will be much more successful later on.
>
> Good luck.
>
> Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
