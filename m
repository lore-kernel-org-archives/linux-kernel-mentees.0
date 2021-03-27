Return-Path: <SRS0=wVNV=IZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5568C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 27 Mar 2021 15:09:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 660A5619B4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 27 Mar 2021 15:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 660A5619B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F00914019B;
	Sat, 27 Mar 2021 15:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xoIn_j36J8cq; Sat, 27 Mar 2021 15:09:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D39340139;
	Sat, 27 Mar 2021 15:09:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A224C000C;
	Sat, 27 Mar 2021 15:09:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52151C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Mar 2021 15:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38CB8403E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Mar 2021 15:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IIebFMlQOSHi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Mar 2021 15:09:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12DA5403C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Mar 2021 15:09:01 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id u9so10737143ljd.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Mar 2021 08:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6dFLpvdQ63oGQH/Y1Y7HIjdiLte8iS5wNqqexWOM37U=;
 b=sIzqTCZezScA0dkCem3V7aPXa1GkeIWT3wlWK6PSpmIe6lNkzsCfPIuUB9VO3sE6qm
 0oTPQVJXmmcRb64+CNmM31aJ7FTX/34NFq5JMu5tQBPSn8JaX+U7WKe8pzgZ5kU/LZNI
 mRGDUblD4PDbBQnyxVwfOz57EC1nItxQ3sHUzBd8fBBqu7z9kx2DQnVu75D/axFRpIUO
 rU88DyA7/wuGh/+hIthsk9gsgwTS/bzAkq+ZCaR6RaBEiyJmAYtbKvyM4QBF/I5aDJha
 6KmIuzLVMsZsJS71fKMIMy5LrA2E4i4Gk33vn+TSCODzinUJap3ugfHnPPYBcMWXkZ7x
 m22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6dFLpvdQ63oGQH/Y1Y7HIjdiLte8iS5wNqqexWOM37U=;
 b=VvmDY3gmxuBPbq4XhUv42B+/qUoVkIZ31Wy8IC2Ndy109VzOu4GdrlV8N2ZPg9qetL
 IVcNBP/XirxWx87hZYo0lELXR4ETEdwI4KH3gLaHOBrnubAktsaGGpzVlIfXtsqHipQy
 n/lkoiI0XxqLqfQr/3fDA8hn9LxDZJFw9rgkYDl1c4wW+QICNa6GbRc1DrZZtvifaFAt
 Lajj7RxFiY6ClxmbqVLv9IMq5OX7os+vVikozdwrT3ski9nszEVcT5rqLYw1Pfrx4M2j
 2sLpZ+Cd1PwD3taML+l63yoGFxcZKpZgo1HUUdRNt4XkD/Y6VG6Dj7FoMDCqYHzLBHmL
 xFWw==
X-Gm-Message-State: AOAM530EklBripfkgGBXbiQaTzgA+SUnWGN2jTm0IwKaLRLGh5a+7A/L
 RIM9Kg8tMMKZE6sTb/s4FTMTEIltBsOS1K2Uiy4=
X-Google-Smtp-Source: ABdhPJzv61wYNi7AvmEmmTQV9cVnqQHgylCIDVafveBSwVWokylWeFVKvn3m+HRqnI3wIJhq5Pzvs0tpL5KFsMgYImE=
X-Received: by 2002:a2e:96c3:: with SMTP id d3mr12770313ljj.284.1616857739773; 
 Sat, 27 Mar 2021 08:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5Amu7dr=i1moc4eK2+WEhQky5V5HsweiOPzxaxGTitZdg@mail.gmail.com>
 <CAKXUXMwiFQc+A0A+FCu7c1_i3EW_CezRv_0oNu=9Fm8SMbhxnw@mail.gmail.com>
 <CABJPP5CoSQV93h+hCMae=b6aaDK4WrphRALx_drw5mm8UF2OjQ@mail.gmail.com>
 <CAKXUXMzxadmV3MZ1bm90nGBdjybo3XSuFmw66i=zn4Km6rG=pw@mail.gmail.com>
In-Reply-To: <CAKXUXMzxadmV3MZ1bm90nGBdjybo3XSuFmw66i=zn4Km6rG=pw@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 27 Mar 2021 20:38:50 +0530
Message-ID: <CABJPP5ABofsA77QQSEAxqQa21DaW6OZQwhyWCfe4RWO-gOqHJQ@mail.gmail.com>
Subject: Re: Mentorship report first draft
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
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

On Thu, Mar 25, 2021 at 1:30 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Sat, Mar 20, 2021 at 5:04 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > On Sat, Mar 20, 2021 at 7:33 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> > >
> > > Dwaipayan, see my comments below inline.
> > >
> > > Fix those minor issues, give the report to somebody else for another
> > > review (and get some more comments), and then I think we are all good
> > > to publish this.
> >
> > Sure I will fix them. How are we going to publish it? We just share the link it
> > is hosted on or something else?
> >
>
> We can of course share it as a link; I will check if there is a blog
> to publish this on for the LF mentorship program.
>
> Otherwise, I think https://people.kernel.org/read might be a good place as well.
>

Either way is nice I think.
Please let me know what I can do next.

Thanks!
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
