Return-Path: <SRS0=iE2U=IX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D3BC433C1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Mar 2021 08:00:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8059861A13
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Mar 2021 08:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8059861A13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF2A540551;
	Thu, 25 Mar 2021 08:00:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5gTW6jIOUGAO; Thu, 25 Mar 2021 08:00:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0628940538;
	Thu, 25 Mar 2021 08:00:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC0B6C0011;
	Thu, 25 Mar 2021 08:00:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6CA1C0014
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Mar 2021 08:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0FDF4050B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Mar 2021 08:00:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 69uAEPbz-Cjo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Mar 2021 08:00:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06BA040179
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Mar 2021 08:00:04 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id z9so1400338ilb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Mar 2021 01:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p8WwokUlLytGqBPn3F765PoNzjgg69p10mG4gvrDgJQ=;
 b=AAKr//UtC44Vv5Qxm3/29aOirsCIY1qBeSXc1mNaSKIhXborqtFoSW9Lg5w2VfmO9o
 OGAFy2ugEWnB7n6W6hy/urRmM0hiVRmwuRwYJzF8HD52Fn88j8L+i/psbKpWtMlm3XFX
 u4kzinx1JLyS9HYcb7UJ+qRLn1H8CfR+lYrFstKPFoQ23HWfXvz4pWn2ib2PXrdXjdi/
 E98GBck4O7YNkxwyoN9d7RRwfe+Xml5TeTtdGmkCVUjkNhl8BsJy321jaiBao1FTJNlD
 gvwbojLyjP60iuLm5FlKN7q1AtYw0imbAcb9mJ1yJpRZpsuhIA087A7GJ3kXnTbDwA5u
 PtvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p8WwokUlLytGqBPn3F765PoNzjgg69p10mG4gvrDgJQ=;
 b=NrqI38UIjCMAmdsGqSxFHUQWsQHb0RjstthL/6jnDr+TYiAAHJTSFG825ciVYQi81P
 zmEA7VA7gdvVUCK6hz4s/Dmq2Wj3xk8Yzxclinb85j9ntMNx6PpMdYGxT/A8Y0EiTUGQ
 C3/b6VQjD2s33P5FbfzRsE//pRgv/2dfjbUudsz2Erk/T7TAHo68H8BIOHjpPVEsCOXH
 sZMuQoLDPJ+g7iXpXUq39Dvvb41GItjUpa1t3rF5ekoPw96vai+AHYALyUsJvvvzQrZ/
 CPpJKIoGBBXyc8M+27yD+81hieqcSMoEiY9M2Syk8eTTVhAQDcy71l05Mwo4gDWEhjh3
 TZKQ==
X-Gm-Message-State: AOAM533CSAgnWRVOqSKlCgANBPanwY79fL0wq15sYxJqmISOLAw/urwa
 laIE+v6RXaVC8CL0WaAQVszMAx8VKPYUfHOzJv0=
X-Google-Smtp-Source: ABdhPJyZJlzj3aWr52hYPbgsewnKIEEGCohiPi9wz3gfqOwjMmhX391OW6pVpQU0/h7nVN95mMq0bIm7Z6YPhmsjwvU=
X-Received: by 2002:a05:6e02:80a:: with SMTP id
 u10mr139909ilm.221.1616659204128; 
 Thu, 25 Mar 2021 01:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5Amu7dr=i1moc4eK2+WEhQky5V5HsweiOPzxaxGTitZdg@mail.gmail.com>
 <CAKXUXMwiFQc+A0A+FCu7c1_i3EW_CezRv_0oNu=9Fm8SMbhxnw@mail.gmail.com>
 <CABJPP5CoSQV93h+hCMae=b6aaDK4WrphRALx_drw5mm8UF2OjQ@mail.gmail.com>
In-Reply-To: <CABJPP5CoSQV93h+hCMae=b6aaDK4WrphRALx_drw5mm8UF2OjQ@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 25 Mar 2021 08:59:52 +0100
Message-ID: <CAKXUXMzxadmV3MZ1bm90nGBdjybo3XSuFmw66i=zn4Km6rG=pw@mail.gmail.com>
Subject: Re: Mentorship report first draft
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
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

On Sat, Mar 20, 2021 at 5:04 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> On Sat, Mar 20, 2021 at 7:33 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > Dwaipayan, see my comments below inline.
> >
> > Fix those minor issues, give the report to somebody else for another
> > review (and get some more comments), and then I think we are all good
> > to publish this.
>
> Sure I will fix them. How are we going to publish it? We just share the link it
> is hosted on or something else?
>

We can of course share it as a link; I will check if there is a blog
to publish this on for the LF mentorship program.

Otherwise, I think https://people.kernel.org/read might be a good place as well.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
