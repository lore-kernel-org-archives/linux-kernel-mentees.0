Return-Path: <SRS0=0tBj=GW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_50,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79785C433E9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 19 Jan 2021 18:59:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3CC6216FD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 19 Jan 2021 18:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3CC6216FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1EAFD854E0;
	Tue, 19 Jan 2021 16:33:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cd1-JojgWpbQ; Tue, 19 Jan 2021 16:33:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 150FB854D7;
	Tue, 19 Jan 2021 16:33:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF67CC08A1;
	Tue, 19 Jan 2021 16:33:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D09A0C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Jan 2021 16:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B6BA985B48
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Jan 2021 16:33:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zHVN5W7vNGPn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Jan 2021 16:33:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2BEDB8591D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Jan 2021 16:33:05 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id d13so37532898ioy.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Jan 2021 08:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KRn6EkczY/WdE7kAhmUNkoKihFbtogdlvkgWwgnxsac=;
 b=lrGCVgJu8I4GxSJ9+G9UMj/h4tvcMBELrmuOeEQC7k8nFCXLonLzh0JRGA64lInHhr
 8D2jUKf/t8u1JgjeSaoC9l2sXjHV1l+qVU9cetb+jwOSc4imhK2F7WbU3pnFMmZRIC3C
 VtZjs5jDVxDH3olkyj6Ym31Xi+ERbxZoik4xmlNdvfnJmutZNng856mArFBzWcNoSuSj
 A/Gcyw76UOYkQTS0tjUQLZApELmTugt3ZmArjEdJEaCdtVo6oUOMMA8mOhr7VICi9Cei
 XgR1iWvLYNymUPKwlCXp/09vyEfEXpFeTxusMc9qE1rQUY71J9JctbmimCxYVENpaDIf
 gU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KRn6EkczY/WdE7kAhmUNkoKihFbtogdlvkgWwgnxsac=;
 b=nCK+NR1wSs0cZx02p12ssmAc7F0K6PLv30ccjFcYLWVIU+BYlG2+1Cwi8OsSWxhphZ
 ouTfggV5ZRczyWO7606TCp/g4eQTNaoGbhLXAaYxkqKP8LUOf3l0cl3lmVM3rBj4P/PK
 5AfUy/1SNsonyz/x2GgmUYRMfvCjBhl5TQF+995p6XP9YihvB1pzP50R0Vd09A3VTLm5
 5eoPB3rwiY2ZFgSTg2r2ue8RZzMSVH1i0xIn7Jn+SXeI8xx0zeP8R8rgni8pjzI5y6qx
 06FH9gTji6iqKgM4K7ZJmLY795EJmtFUQcXZ8NFPhEDaqfEoYMgw3/yZHSXPD/NLsW7y
 mPHA==
X-Gm-Message-State: AOAM530LBvDq+wlNq7yyXUUNjeHQOwtIfs9Jby2zOXNZpNgvy22Qe0Fv
 cElHhGxubbLkpOVQIpzKjJN0R4ZN2VuQWTyr8Ko=
X-Google-Smtp-Source: ABdhPJyZ6JhYuEcb1VVWrUa2uBilz9zmcoKLaAtQp4hD10qMw+6kM4OoQaVtmbnhYpxaOT45zS03Ckc38Iv6YcNv9sE=
X-Received: by 2002:a05:6e02:1aa8:: with SMTP id
 l8mr4135943ilv.251.1611073984523; 
 Tue, 19 Jan 2021 08:33:04 -0800 (PST)
MIME-Version: 1.0
References: <9000f3ce-0ac2-cc8c-48f8-31ffaac8bd6d@gmail.com>
 <20210118191351.1446-1-yashsri421@gmail.com>
In-Reply-To: <20210118191351.1446-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 19 Jan 2021 17:32:53 +0100
Message-ID: <CAKXUXMz9GeAMNS-f_NrZ3pSFqSUCB2qJ1f28R4HVrmcD7EymNg@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add warning for
 avoiding .L prefix symbols in assembly files
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

On Mon, Jan 18, 2021 at 8:14 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Local symbols prefixed with '.L' do not emit symbol table entries, as
> they have special meaning for the assembler.
>
> '.L' prefixed symbols can be used within a code region, but should be
> avoided for denoting a range of code via 'SYM_*_START/END' annotations.
>
> Add a new check to emit a warning on finding the usage of '.L' symbols
> in '.S' files, if it lies within SYM_*_START/END annotation pair.
>
> Suggested-by: Mark Brown <broonie@kernel.org>
> Link: https://lore.kernel.org/lkml/20210112210154.GI4646@sirena.org.uk/
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---

Okay, send it out to the initial discussion group (with the standard
CCs for mentees and checkpatch) and lkml. Then we see.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
