Return-Path: <SRS0=ah7H=DX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFEDDC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Oct 2020 10:33:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AAB4207F7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Oct 2020 10:33:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qHGTdiYq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AAB4207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9096D2E40A;
	Fri, 16 Oct 2020 10:33:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RX1OI7dueIrn; Fri, 16 Oct 2020 10:33:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0F9BB20515;
	Fri, 16 Oct 2020 10:33:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04496C07FF;
	Fri, 16 Oct 2020 10:33:55 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8D7FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 10:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A323A88BFF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 10:33:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lK4XvgBZVnEb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 10:33:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 91CF988B6E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 10:33:52 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id r4so3161574ioh.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KPjQ8/sVJF55NxLIwl536urcYhnpqPQ7Y8UThLXrFiQ=;
 b=qHGTdiYqhBY4aEHP/hmN1RYplxm9qH6OJ+IEQ+ukXEvy2+vb60QACk4ldyiz8kdNVQ
 /s2WUX0OSM53LcO3Uvgxw7U37l5vGXqRrZyR2apAQFx9N09/m/V6U2HvtDLth3Fucrqv
 SzZR7RN1dvCcfldMz9TqZk5fVqybs9kyQ0yjfTQb5IaDmB71nqITVxCrm3xCFvr+Tu6Y
 dO1U4/JeTlOEAJJRFp33+KHXw2n1ZnTeHMZ0SxcHHsY5gYYy6wr60yR7JsUwz6ZSCuuF
 /i0QQOsWGTIQXXNvuPaYnMzbvmh2tVexhr87ZLnxPc/6xoLJJiPbA66IA0vw4TKSh3up
 FAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KPjQ8/sVJF55NxLIwl536urcYhnpqPQ7Y8UThLXrFiQ=;
 b=Yo5582k++nKk8ubmf8VDEUkrdRk2DG9p42xrgiA75AnxBq29m/zSO9kIrySPMrlUhh
 TrW3s8Wnd/3Wv4WCtsvYm8BKVorPY5htpf8CqZ+pVRxdreMhZDymLMd8MN7lj6nm7rQ1
 JyI5T4nY9E1cGCaj5vpZYAjH/eti0jeedlWhuSosDXFxw3JuGMB8aq6fBQQn59b5ADVC
 lkIRq4JmVbBwQkg5M12O+5fqxtiy9yyRXrdzm1WYqK0XGrwWI4xJvCzJpFChhdu//kvc
 PFJADLHwYqpucr/bgtZG+1aTkHyTdI+U1UFsBFT+A32Rbw0+gwf5v4KiEvJxgbLqdmiP
 QjfA==
X-Gm-Message-State: AOAM533CTgc38o13I4isecg+mj4xSWFryxCSvPiPQwAHPZzwd2Nr0HG3
 Ih6ENBQzoG+BwwZ5DiumrfZ8RJrfiPsRxpswexJMvltqFbw=
X-Google-Smtp-Source: ABdhPJwubKOzhnor5X0jnlVhWgl4rucQ5i8ry8H+3bjyEQ+NhqcMSD3yQSiTuruiIgu0LshkKeDJyTVw2h/9W+nBSXE=
X-Received: by 2002:a02:6d61:: with SMTP id e33mr2026952jaf.14.1602844431874; 
 Fri, 16 Oct 2020 03:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20201013120129.1304101-1-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2010140734270.6186@felia>
 <049e1657-f895-a175-9108-314b0628d6aa@gmail.com>
 <CAKXUXMx64+XGnpKt-9VFNZLb8=hALWQxB1=A6O+4DpR+YaKrEw@mail.gmail.com>
 <CABJPP5AS_kuE73nZ50h5WY4xW2sRZuanQBu0aNJrSrYkb8ccZQ@mail.gmail.com>
In-Reply-To: <CABJPP5AS_kuE73nZ50h5WY4xW2sRZuanQBu0aNJrSrYkb8ccZQ@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 16 Oct 2020 12:33:37 +0200
Message-ID: <CAKXUXMxi=t-donL4D+sJVD0dxvAO7pRkCMCGRWr=1FV=6t4ieA@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
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

On Fri, Oct 16, 2020 at 12:24 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> On Fri, Oct 16, 2020 at 3:41 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > >
> > > Lukas, Ayush didn't follow up with next iteration of patches for
> > > GIT_COMMIT_ID related issues. And I had discovered a bug in his
> > > implementation. Is it okay if I look into the issue?
> > >
> >
> > Dwaipayan already wanted to pick up the work on the GIT_COMMIT_ID issues.
> > So, he is working on that already.
> >
> > > >
> > > > Just one bigger project example: Comparing clang-format suggestions on
> > > > patches against checkpatch.pl suggestions are fine-tuning both of them to fit to
> > > > the actual kernel style.
> > >
> > > I'm not familiar with how clang-format tool is used in the kernel
> > > repository. But I would like to know about it more and how I can
> > > contribute here. If there are any tasks that would help me get a
> > > direction please mention.
> > >
> >
> > This is probably much more interesting to get involved in...
> >
> > Some background information is in the kernel documentation; some
> > further information can be found on this presentation,
> > https://www.youtube.com/watch?v=FFjV9f_Ub9o, starting at 2:09.
> >
> >
> > You can start with running clang-format on the kernel sources just to
> > get a first feeling on what the tool does and where it completely
> > changes the code, and especially those cases where it changes code
> > that was perfectly okay before, we should do something to
> > adjust/configure clang-format.
> >
> > Mid term goal: If we find a directory that needs no changes with
> > clang-format (after configuring), then it would be worth informing the
> > maintainers that clang-format works for them.
> >
> > Lukas
>
> Hi Lukas, Hi Ujjwal,
> This seems pretty interesting to me. I could help out with the
> evaluation work as well considering the kernel source is very
> vast.
>
> So currently if we run both checkpatch and clang-format on the
> kernel sources and notice substantial differences between the two,
> which one is preferable? Or do we just go with intuition and take
> whatever the kernel programming style generally suggests?
>

Basic assumption probably needs to be:

Both tools are wrong ;) and first intuition is maybe the best guess,
and still wrong ;) Only the maintainer really knows the preferred
style...

But when we start looking at it, we will adjust tools and ask
maintainers about their preferences and then we simply document those
preferences and create patches for kernel documentation. This
contributes directly to the maintainer entry profiles (something that
is still not very common, though...).

Getting a good overview on what both tools report will give some
interesting initial insights into this topic.

Let us get all the ongoing work on kernel patches done and then start
looking into this...

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
