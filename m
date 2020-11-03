Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FADC2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 10:41:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AA4C206F1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 10:41:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M31gnnfH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AA4C206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ADC3986113;
	Tue,  3 Nov 2020 10:41:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8lqCL0wRDi_p; Tue,  3 Nov 2020 10:41:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 493718610F;
	Tue,  3 Nov 2020 10:41:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30A21C0889;
	Tue,  3 Nov 2020 10:41:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C289AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 10:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AABDF204EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 10:41:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zqC1YIeY8H-o
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 10:41:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 90FA22038A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 10:41:29 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id g7so15667718ilr.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 02:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LJX0KjLw/H8QtBirGKBRgBtQb+fYquYM2kZvlN1vfeo=;
 b=M31gnnfHr4nS35M2fTDImCp6gZ3unx0S2FKy4N8i1kHp7R7chDxQTbVNDWoFSIRZI5
 Uqn/5X38hUNJmnA47+vhC+fLPtqmNnaU+qQvE4xXH0hr6jmVCBCzbMrRaE15KNSE5si4
 PR8x4LSqXI1ukf2JgS8LeXoArey7LmiJetWBQq1UXxyIm6kIWevH49161EG/au26yCu/
 yFnyZvDxu8QD6ZW8pTiCWq/tt5t+9HseTLYiQbJQXBNIWzWBv60Ed2qfpeO4xshQLACy
 BHJdTn8iTFX1Tw0PcryTwnW/Wx9oz+kMc3jbEiYjyW1GrHidfjGP549lFfe//NjQiC++
 uB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LJX0KjLw/H8QtBirGKBRgBtQb+fYquYM2kZvlN1vfeo=;
 b=b0WqWidwMrOuRexNF2LebOokGMxLSHteS/OHT9TmyTfw7cStAJzi2ZfOiwSNNcHzLT
 pgX+eXY7ybYZgdshQTIjO3oPF2/dvNksgcHzCNc+edfpMk14AXmqBHDshIXODrtLJJRA
 SGshEdgC2MoCOihVjhHicu+IJcJeaiRH5th8gkTkNpKXoRGgGZ84mFXGG0Toqu1K1LSx
 e0My711tTp/x0W+2pklpuKGQk5eZQOvFiYQQQ4QCAle1csx2qsXiOcBgbbtAsDc6TJiO
 M5d0DGCaN4U8sQqyj0oq2mnFUR2Dp184reVuOhPYlXOgDVx3zrFKllHd4uAIqPZKg/3D
 1EhA==
X-Gm-Message-State: AOAM533R/OXFUOf0P4EeU606qncecea4tiRZiew5oI5b6fKvA6UV6wBL
 p4AZQhqrTHSx5Rdwa4aIhhHmHI82qdsZaK0nF1o=
X-Google-Smtp-Source: ABdhPJzfJvmG6Agexz9s5vvuOG+b9my3ztA/nROWvuxkC2A0g1ZxD7Xl4woC0uNkpzTJdIEfUB3Wd1nZQ/yarg90nSI=
X-Received: by 2002:a92:35c7:: with SMTP id c68mr2241047ilf.251.1604400088782; 
 Tue, 03 Nov 2020 02:41:28 -0800 (PST)
MIME-Version: 1.0
References: <20201031132556.10379-1-yashsri421@gmail.com>
 <alpine.DEB.2.21.2011020808040.11801@felia>
 <0c7aec7d-3ec6-882f-062f-3b7683f8b594@gmail.com>
 <1a4d2f16-fd08-197b-3e6c-b433e84ebcba@gmail.com>
In-Reply-To: <1a4d2f16-fd08-197b-3e6c-b433e84ebcba@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 3 Nov 2020 11:41:14 +0100
Message-ID: <CAKXUXMzTH1LevRH1w1opyVUN4d4tv0U-m6cL---DTByOdn-1Kw@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	COMMIT_LOG_LONG_LINE
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

On Tue, Nov 3, 2020 at 9:38 AM Aditya <yashsri421@gmail.com> wrote:
>
> > On 2/11/20 12:55 pm, Lukas Bulwahn wrote:
> >>
> >> Or to prioritize another issue and possiblity for fix rules.
> >>
> >> You can see that there are potentially some good options for fixes around
> >> the tags and sign-offs Dwaipayan has investigated.
> >>
>
> Sir, I am working on BAD_SIGN_OFF, which occurs in multiple variants,
> for eg.
> 1) WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to
> attribute nominal patch author '"Zhang, Jun" <jun.zhang@intel.com>'
>

I think the fix here might be to drop the Co-developed-by: line, right?

Can you confirm this fix on your evaluation?

> 2) WARNING:BAD_SIGN_OFF: email address '"Matthew Wilcox (Oracle)"
> <willy@infradead.org>' might be better as 'Matthew Wilcox (Oracle)
> <willy@infradead.org>'
>

I think Dwaipayan and Joe are discussing the proper handling of
quotes. I suggest to understand the resolution that Dwaipayan and Joe
are working out before thinking about a fix for this option. They
might decide that only a few specific cases should be warned about or
not at all in case of quote mismatches.

> 3) WARNING:BAD_SIGN_OFF: Duplicate signature
> etc.
>

I do not see the fix option for this case 3; the duplicate signatures
are mostly due to the integration Signed-off-by trail.

> Should I answer all these variants in one patch?
>
> Thanks
> Aditya
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
