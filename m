Return-Path: <SRS0=YUr9=HD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3675FC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Feb 2021 17:01:41 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84F0A64EA1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Feb 2021 17:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84F0A64EA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2758686758;
	Mon,  1 Feb 2021 17:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nwtnHw-vbyn8; Mon,  1 Feb 2021 17:01:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EB83D861C1;
	Mon,  1 Feb 2021 17:01:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0959C0174;
	Mon,  1 Feb 2021 17:01:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33180C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Feb 2021 17:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 21CD7868C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Feb 2021 17:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C14U5s3mnyHs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Feb 2021 17:01:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5700D868C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Feb 2021 17:01:36 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id f2so20481329ljp.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 01 Feb 2021 09:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9D9BjQCsP/BBIIM4bFem5G7Ivu76rlT1kOYtUbgHA9U=;
 b=OBG6OcX195i3qCdWRo3LO225VOEQZbfV2XFNhFqRSKDIYuI7GKge1Ixfdq91BOkkCN
 msEi9S2B3bIrjyNikLHfBTpoGGuq6KH6GxRSEQcMz+9vnq4jNQ4mxYHpqdbqrXv4iE1B
 +XsRnwh+RRaElaSxHF7pc79kmawuWFgU5QxpHim1bm5ctRmF6zkR5YiI5Fk6lhieEsO8
 JzdU8RsxTV8MdLY5/57mSOnN2umS2UNQSan5kd38R276ANmdY3xUtJJuXEJVN000MdAA
 4SAqeGtEc0TUXBG9+3bYV+1e9GOz8TmEAMyH6IS4cQKu3owYCW3v6ldmBsBzWpdjzEW6
 r0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9D9BjQCsP/BBIIM4bFem5G7Ivu76rlT1kOYtUbgHA9U=;
 b=TItd1KpPQuU7A645uPikCXWBHr8eAHMs/p3J7pFkI0fqjK3NCfl2Tc5nMoWQuJiSUk
 jw2vSw6qdwR5G05J3fxsPAKQGkkaTOlGfx/CfbIdD3LujAde099WKyINx454Gtzpir/p
 qSg4R+NNS8YnMFmh64AKAO8a+3yHNQnOkwgtzxEdpBnKrL25ffB3b4B6htqpD8PLZUGv
 C+4RW7Izq7XRreg8rcfd3tpMJIjiGu8D3xxrkeQkAKafvqbXt21jMai87veQJ/Hz6XIm
 bfIhIKf1Crc3DiAjQTpiEuz6ipgMQLoylEXBMQ7t3OSMsNVonSRHsp51ORsERlNuq+VQ
 5GQQ==
X-Gm-Message-State: AOAM533K88daYXUf5CnCAOoXy2tKpIBE35npYL6DjZIhZqWlQtqUQg6v
 kZ9P8mYqeK207bepK1NBVkJmYWrx5/qb4CSyQ7U=
X-Google-Smtp-Source: ABdhPJwbihW7q+v0w8MC26mCCXinKx9e4nlaayM1Qm04O4/K+BQt+9v55XEH3B5zESt/9GCAp3yx9bg44b51/FE3jb8=
X-Received: by 2002:a2e:9789:: with SMTP id y9mr10555804lji.482.1612198894409; 
 Mon, 01 Feb 2021 09:01:34 -0800 (PST)
MIME-Version: 1.0
References: <CABJPP5AxB8-kafFEpsMydg8eMx8bH5ooT5g7r0fKWV2T2Hjtng@mail.gmail.com>
 <YBguQ/dENrfvtptJ@kroah.com>
In-Reply-To: <YBguQ/dENrfvtptJ@kroah.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 1 Feb 2021 22:31:33 +0530
Message-ID: <CABJPP5Ba9pDJco16R0CfcpXZedT7vPx_Md9QTRX=y_guQcwLww@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] Patches from the future - can checkpatch
	help?
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

On Mon, Feb 1, 2021 at 10:07 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Feb 01, 2021 at 10:04:01PM +0530, Dwaipayan Ray wrote:
> > Hi,
> > on linux-next,
> > $ git log --pretty=format:"%h%x09%ad" | awk '$6>2021 {print $1}'
> > gives:
> > 4a2d78822fdf
> > 12ca45fea91c
> > 09f2724a786f
> >
> > These are patches from the year 2085, 2037 and 2030 respectively.
> >
> > Would a checkpatch rule be helpful for these or are they too
> > isolated to waste runtime on?
>
> Dates come from your email client, not the patch itself, how is
> checkpatch going to catch this?
>

I was hoping that the maintainer could catch it before merging it
into his tree. Dates being a trivial thing might slip human eyes,
but checkpatch might detect it there.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
