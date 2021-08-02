Return-Path: <SRS0=D/cX=MZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFB0C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 10:43:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AE4860FA0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 10:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2AE4860FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF828403BA;
	Mon,  2 Aug 2021 10:43:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZhW-e5A_G6W2; Mon,  2 Aug 2021 10:43:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EFC824038D;
	Mon,  2 Aug 2021 10:43:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA2C6C001B;
	Mon,  2 Aug 2021 10:43:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6F07C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 10:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C71EB607F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 10:43:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4S3U5BpdsTUE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 10:43:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A354A607EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 10:43:02 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id w17so27698386ybl.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Aug 2021 03:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DDZq0JzDSDS5smc3tzhGg8WW9lJ+reeuCSfu7T6KCuo=;
 b=FkO26LhIMklLL+7ZyV2t1yDqnasoSbUGx/aQm3q0pvOlh2YmvwHNwsNnJ9ExSv8tWo
 E0rDfloWNinW5LL59qknpO7FSo7cuwFodDdMTj+MyEJj0miNmqpvCXM42f3GLyDiv1LL
 DRm0c3591SIW733BFi5oW13ZlkBqRN4aYCAVlm4CUGYZXQ/z6Ht1wqI7oaSY1O/abprQ
 niAWZ4gWUz5eGGzRykzjR1DiKeFx7E5MqJ0LkYD0b1RjcLWpUUuhkOw+w78jV3CuFaSq
 fvpXd2yvGYFRtTGjyVMIErj5HDKsJ0FQQ6aEZ/8TXs404dIX2jnzAeepOeb9CjVhmXAQ
 IGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DDZq0JzDSDS5smc3tzhGg8WW9lJ+reeuCSfu7T6KCuo=;
 b=N8EbSkLuni3Xfz7gpVP0t0XtjZ3Hq0Qj3nZm4tNpV20sBQklgkIXLrznjX7EG39lfn
 C4JfhI17KjLEZJB2xQi9QDLyi4NWJNTxuxXQxW3k4su7fPZGdCHNN8pS7Is3fUiGVuVk
 2Q4dnoemGmbrzZbRkDvcu1Q+JEwiB8/z4CLkTqjFJWRQybXf2ANwPecMHt3jza8NM+EK
 s9b4GJbJFzdwGeSILdsRuVq4SP7y6YBl/9ZFx8RiGrpRpj+EGFO+5oYKPbo7UJeNNTes
 aU36xXpTOLQY73l374G0UWDaD2iLHFJEk5Ev6kIVDUm3rHK7UWESdSRLlTK4qs5M0m2h
 iOng==
X-Gm-Message-State: AOAM533/LIMwwHo0RJUutYeTfZsgZWCmtIP4MDb0+XlhjZXRJcsMyHpG
 rfqnJobGZMPOioXNL/Qz/V7QoEIjBPZ11K2o9k8=
X-Google-Smtp-Source: ABdhPJwQug1rIHS3acMvzfycCIa/k67fAEFTqd9xS+KMOUMBlBE3K3xee6cmN/4+EqKHgzo6KUZkwThwpDLTmMJkt3c=
X-Received: by 2002:a25:505:: with SMTP id 5mr20277369ybf.157.1627900981431;
 Mon, 02 Aug 2021 03:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAMqN5U6TDXVsJy3YEw-QOY9saktrWpNELtNKnBW9VegdQG2x3Q@mail.gmail.com>
 <CABJPP5AUm4fmiNPem3S1pw-S89E70H4UoVyGRq_vmCef1B4Qvw@mail.gmail.com>
 <CAMqN5U4JBC20E=k8ssEgiohZ+8LDv+iPQdOMKYLaO4Ny1fg=nQ@mail.gmail.com>
In-Reply-To: <CAMqN5U4JBC20E=k8ssEgiohZ+8LDv+iPQdOMKYLaO4Ny1fg=nQ@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 2 Aug 2021 12:44:34 +0200
Message-ID: <CAKXUXMzKYVPY_ga0Z9rA9HY8CWzohwN825SMacP4r=TRhhF1Kg@mail.gmail.com>
Subject: Re: LFX Mentorship application
To: Vinesh Vilas Raut <vineshraut2017@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Dear Vinesh,

your email client seems to be broken. Your email does not meet the
requirements to work in the kernel community.

Please fix that first...

See your email contains this below:

Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>Results are categories bas=
ed on the type of Warnings or Errors<br><br>Format :<br>[Warnning/ Error me=
ssage]<br>[Explanations]<br>[code which get invoked]<br>[list of warnings/e=
rrors of same type]<br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Then, the first task is to run <a href=3D"http://check=
patch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a> on a few f=
iles below<br>
andshare the results:<br>

... and that is not readable for any human...

Good luck setting up your email client; then resend your email again.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
