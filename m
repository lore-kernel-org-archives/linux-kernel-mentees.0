Return-Path: <SRS0=ah7H=DX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A069C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Oct 2020 10:24:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97AA5205F4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Oct 2020 10:24:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/qIbxVW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97AA5205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0171A88BFF;
	Fri, 16 Oct 2020 10:24:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j--TV5ejX7Ab; Fri, 16 Oct 2020 10:24:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E7356888D6;
	Fri, 16 Oct 2020 10:24:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DADB2C07FF;
	Fri, 16 Oct 2020 10:24:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D47EEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 10:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BBB7F88BFF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 10:24:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h1e4x5faO2eo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 10:24:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 12602888D6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 10:24:41 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id m22so1953237ots.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 03:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EOwGSPAwygwzteuK4LJESmCCc1j1Q/kwZoHRO9fVeJU=;
 b=Z/qIbxVWW6Nx9CDJ5nEJ8T5fXgV6wMRxRi0Jc4IOfByTf/Ah9lRFbmAvOZCpq7WKKz
 QcCQE3B8khJUOukBy9/vMktuS51Qhw9ARepqYLtS/8E92Akmr8bSznXx21NUQNjTi/pW
 9vZWnDQ/IFQmFnz6S8B2CbDgIw9TF91HKFzdsGVp5Uvuej3JlLQ6iXehAKcIgvz30hIn
 Q9RudFA/Q7MVF5NjkZ0nZ29mrQ18YAZTgek+wQ4FKjKMK2gQDX5cQNQ04gWEmmg/hepm
 wj+qfopFtHQREZD3Ub4TMvvn2MesIbe9/s82FJcW0/J6EPQpR/ncH7koj7u192BJQybq
 vTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EOwGSPAwygwzteuK4LJESmCCc1j1Q/kwZoHRO9fVeJU=;
 b=gZHjHDjUT8sWpJwGt0OFAJpXJvm0mq8BWdtGGQFu6Jnsp7csqN1xv+VU8ZwN1Yh1CK
 IaW067u6rMzJuGcmkrX2L8oDVaxoZSp5gcGdtXotro6AyJwWOhpn/xfnojw8YObP20YL
 YOLdcHBs7reY35Cf2BgqlLqdW/IR5+owpT5OUosiks3z0rj2HWHOfl3OvDdy3y4rJUxq
 qektAwwDFvlKHJRuwqHpj7EJA+X1pXl+UJXgYxdFOS8WGoPrCQNumiL1xMcs6ve8RKTM
 iK6kDhNCsGqFtLWod4+ku8Cb2QpNED4kzrP2CkKJjnDhuStFXTSKBEgc/O9JTGoGOqXL
 PEPQ==
X-Gm-Message-State: AOAM532xtbNDEFsPPs6kmFVAGlVOYN27c/bOq2rVzXK5u5mu80GC9v89
 tyfONSYuniWPm1LvitpfeB4JrNmBpTioQfN+yKI=
X-Google-Smtp-Source: ABdhPJzvD7BW+iecb4e9Hop0dTiiAY1Xjmr6I6Jq130LrR5ii+rFjD09Pn4/emJaIeduJa9AY5ik95siRGqYRrb2HVs=
X-Received: by 2002:a9d:6c4b:: with SMTP id g11mr1941288otq.265.1602843880118; 
 Fri, 16 Oct 2020 03:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201013120129.1304101-1-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2010140734270.6186@felia>
 <049e1657-f895-a175-9108-314b0628d6aa@gmail.com>
 <CAKXUXMx64+XGnpKt-9VFNZLb8=hALWQxB1=A6O+4DpR+YaKrEw@mail.gmail.com>
In-Reply-To: <CAKXUXMx64+XGnpKt-9VFNZLb8=hALWQxB1=A6O+4DpR+YaKrEw@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 16 Oct 2020 15:54:13 +0530
Message-ID: <CABJPP5AS_kuE73nZ50h5WY4xW2sRZuanQBu0aNJrSrYkb8ccZQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Subject: Re: [Linux-kernel-mentees] [RFC PATCH v2] checkpatch: add shebang
	check to EXECUTE_PERMISSIONS
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

On Fri, Oct 16, 2020 at 3:41 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> >
> > Lukas, Ayush didn't follow up with next iteration of patches for
> > GIT_COMMIT_ID related issues. And I had discovered a bug in his
> > implementation. Is it okay if I look into the issue?
> >
>
> Dwaipayan already wanted to pick up the work on the GIT_COMMIT_ID issues.
> So, he is working on that already.
>
> > >
> > > Just one bigger project example: Comparing clang-format suggestions on
> > > patches against checkpatch.pl suggestions are fine-tuning both of them to fit to
> > > the actual kernel style.
> >
> > I'm not familiar with how clang-format tool is used in the kernel
> > repository. But I would like to know about it more and how I can
> > contribute here. If there are any tasks that would help me get a
> > direction please mention.
> >
>
> This is probably much more interesting to get involved in...
>
> Some background information is in the kernel documentation; some
> further information can be found on this presentation,
> https://www.youtube.com/watch?v=FFjV9f_Ub9o, starting at 2:09.
>
>
> You can start with running clang-format on the kernel sources just to
> get a first feeling on what the tool does and where it completely
> changes the code, and especially those cases where it changes code
> that was perfectly okay before, we should do something to
> adjust/configure clang-format.
>
> Mid term goal: If we find a directory that needs no changes with
> clang-format (after configuring), then it would be worth informing the
> maintainers that clang-format works for them.
>
> Lukas

Hi Lukas, Hi Ujjwal,
This seems pretty interesting to me. I could help out with the
evaluation work as well considering the kernel source is very
vast.

So currently if we run both checkpatch and clang-format on the
kernel sources and notice substantial differences between the two,
which one is preferable? Or do we just go with intuition and take
whatever the kernel programming style generally suggests?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
