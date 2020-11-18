Return-Path: <SRS0=ImFK=EY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17ADC5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 20:52:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12C02246C2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 20:52:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7mEYJXq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12C02246C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7F3F58517E;
	Wed, 18 Nov 2020 20:52:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7KLZsZ5f73ss; Wed, 18 Nov 2020 20:52:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 20D5F85124;
	Wed, 18 Nov 2020 20:52:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10184C0891;
	Wed, 18 Nov 2020 20:52:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F6CEC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 20:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9A33B204A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 20:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O-1qqXDfXZpC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 20:52:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by silver.osuosl.org (Postfix) with ESMTPS id 6646020341
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 20:52:53 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id v20so3858474ljk.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 12:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nMc5uiI5eZzBhbuytw1AZBYaSdLgIJONP3ItXWrU8VQ=;
 b=l7mEYJXqS/wM7V3LjJdAcBUBJ6232rcpViwTQEOZjXyqUNoUUKRPw+1FbhnvpZiMYz
 DIHEgUMMKZNEYPs+aWts7iFeuoNFB8q1UiQDJHP8vFwTcUBDWRpt7ygWcGJwhXZBIgtT
 Q0lFCFv/zEcaevQ2PFo9bSngJnXjbzmWivfH29lNIxSGbv8EmuF86qw5nVUt6OetAGeq
 +BPhl3y3X3ABDff+ujbJOSGzdusEJfwOtJ45P8QK4nEpf2mdb9rU8SN67MVe4r+YOGM2
 CmPDV6E2TSMy46cwttMdUqpNp+hSFO/Zw/QFGKjLN8oFKizzTTz3eMEAUcIfDU7M+TNv
 ZNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nMc5uiI5eZzBhbuytw1AZBYaSdLgIJONP3ItXWrU8VQ=;
 b=E1wKPRp1CJ2BrnuoCvuK1fQ+vDw23YfPMuZD22Za6E/6d2dmY1o0fha+xN2OCyyt0W
 UWN5xv2eecaivd1+GWx5AQtNYFmFMf/fLTmUImLmoKSK5Nytb4ltdkLzVlDqsbnYInIi
 2vOtCsK+hHKWIaRv079F9QRVYtQfi0vQzUJsns+8PMVfpmhxCyv1XN4lA49wFi7bEVlX
 WBSngBKrKQzFtR6yKcp2Usrfs3wxoa5HHwpXMA/wuYozjEVwxmelLk94aR4hrx/QwbxV
 Rhs4AI8pLhy1TgNOgLVE66/Tgoca9rHmy4RCDSEXnmBIO43FaZIb4YcYUxWmgcTEz7H4
 aTog==
X-Gm-Message-State: AOAM532D4uPNihBYqWgiUFdwATg1flr3b6PfU8V/MUrJaFjnS8b1tnW4
 rVlC22N1r3UEygrZrhnXDchQyn9bzkDRjhsRcVY=
X-Google-Smtp-Source: ABdhPJy9Vbb/fkGXh32qruhjyVCcLHvkl2RzeBKkvqMKzv7LQfwz//aOcWhTHMddJSVx6pTBT5a2EIKhaY/gogpxOME=
X-Received: by 2002:a2e:8e6c:: with SMTP id t12mr4855520ljk.441.1605732771379; 
 Wed, 18 Nov 2020 12:52:51 -0800 (PST)
MIME-Version: 1.0
References: <20201118124035.96976-1-dwaipayanray1@gmail.com>
 <457730448c84136be089748bea69abd2254e3832.camel@perches.com>
 <CABJPP5CqKjY3_mfkJEsHX_8Zc7q1TRCgA4T54sTEZBiKgPS+OQ@mail.gmail.com>
 <754e240d1c88274ce2d94a5b6dbcfff1cc8c9508.camel@perches.com>
 <CABJPP5CHofzA46FHe3eJrgjQBTcaoCkR=dc29xxK80oFZJVfoQ@mail.gmail.com>
 <12b44d3a477de314320dc9d26b26576875525f27.camel@perches.com>
 <CABJPP5DTBkuzEjs28wufdnOXf61-T=wtoZWiTya_idXfJ92eNQ@mail.gmail.com>
 <c69f32af186d672c9370750985914b889f6a5b14.camel@perches.com>
In-Reply-To: <c69f32af186d672c9370750985914b889f6a5b14.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 19 Nov 2020 02:22:20 +0530
Message-ID: <CABJPP5DiUXErqQCuiWz1ALXQ7+2O4tVOMLQJTZHkCz_GqdM2Qg@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add --fix option for
	OPEN_BRACE issues
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

> > > The difference here is that you are dealing with a $stat context and
> > > the existing --fix entries are just for single line fixes.
> > >
> >
> > Hi,
> > Ya I understand that. Though I am dealing with $stat content,
> > I am also directly accessing $rawlines here.
> > So I think that should have the proper patch line format, starting
> > with + or - or so.
> >
> > So in this case if the error is triggered, checking for /^+/ should be done
> > becase it would be wrong to fix the others with /^[- ]/
> >
> > Is there something else that I am not getting here?
>
> $stat does not include lines that are skipped if the lines start with -
>
> Patch context may be:
>
> line    content
>
> 1               func(...
> 2       -            original arguments);
> 3       +            changed);
>
> where $stat does not include the 'original arguments' changed line
>
>         func(...,
>              changed);
>
> but the $rawlines[] entries are consecutive.
>
> Anyway, this needs to be handled very carefully if handled at all.
>
> I think it's easier to avoid handling these cases and let the
> patch submitter fix it manually if appropriate.
>

Thanks. I get your point now. It seems it's much more complex than
I thought it to be. I will avoid working on this one then.

Thanks & Regards,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
