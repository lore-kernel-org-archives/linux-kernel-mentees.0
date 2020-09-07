Return-Path: <SRS0=YKtx=CQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B39C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 07:10:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35D08206D4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 07:10:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qrau/mC/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35D08206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 68557204B4;
	Mon,  7 Sep 2020 07:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id whx7FOvlGg0P; Mon,  7 Sep 2020 07:10:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2268420494;
	Mon,  7 Sep 2020 07:10:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CB1BC0052;
	Mon,  7 Sep 2020 07:10:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11860C0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 07:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 06D7D870BB
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 07:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f15eecLUviZL
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 07:10:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2C12E870AE
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 07:10:22 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id w5so3706571ilo.5
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 07 Sep 2020 00:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dbI7/bzPK9vYneEE4VO3gdsqULGYidgunYYjS9+ZOAI=;
 b=Qrau/mC/spEpAFr2NB7UHMp3agWElkilarSRUevF4QQvDZuMjiCsbwt619iKN1sWLG
 L6tWjofqZWmnJlZsAte6aXkmCCWzWQOLgj94T9SJt+YM0aPcz/59v0qXWPpC9EezDqzR
 SxSq4OnzZEgcgJA2LT9QofhoxEYnRya9WImv/SwFR2F1Duqi+oRz5H3daUpvM8PGsy5E
 8Dw1GNOnO9F/qsVUkC73QiNIr+NPkXeI64TQjvAoZaNt0cI5TyTUL8B34hInBHJ70QQT
 92rBUFSmScfyw/0Nkf1IqgnMGZW57mY5TMyg8pkZaC8ghEQ23U54TWrX9po5PIh94Z91
 SXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dbI7/bzPK9vYneEE4VO3gdsqULGYidgunYYjS9+ZOAI=;
 b=HXWNUQ8yfoT3RG/c4sQRUdEd0ERALBKrgf020NmiCpuirt3BMEJm1yI3gU7IakOC8Z
 7urQqg9FyI+/S4azeOcid0O4SuTU5ciXW0cPEllMLBREVoWubq1tu0wE9uBheqIjpNLh
 +s/XvDJcI1EItUgUi3XOZiJbniSEMd3CaLL7fRxgQZ9r9kWX4Xu648SE6Xq5bbNKFpX4
 cdzYyed/UznA/sgbGj+hnl0HBnBuL4KyAVqpfXrK3eD4RS8U+xWl5rIfT+34pAfha6OT
 jK0Idxy15cC+w2Ej5nnx9lrXY7teUSKZFvXRIxXM12xQreJmxL+U7ieub5EoBkpYJ2W8
 gwnQ==
X-Gm-Message-State: AOAM532TCrE/ic+bhPVwohujqGeLqyRmy//XG48P/YjpDIMTlE01mxj3
 8khEFGpsoCxn3paaQWV/3N8D9OO+aLDO590b0k4=
X-Google-Smtp-Source: ABdhPJy5xKhbnbrQTGTE7+Ou6si51ykNFG8WElWgtBzQQJSUW1CpSyjUJwL9Yfi3V337nCNVCtJmN8ERTftGH++Tiq8=
X-Received: by 2002:a92:6b0b:: with SMTP id g11mr660224ilc.62.1599462621285;
 Mon, 07 Sep 2020 00:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200803075841.6bp4pcx3av2ow72s@mrinalpandey>
 <alpine.DEB.2.21.2008031251410.8346@felia>
 <20200804155640.x3kzgqfsmmkj5z2b@mrinalpandey>
 <alpine.DEB.2.21.2008042131530.4346@felia>
 <20200809072240.lvuuwscinkfqpwxo@mrinalpandey>
 <20200820044241.4ivtq5co6cm4aze6@mrinalpandey>
 <alpine.DEB.2.21.2008221014310.12792@felia>
 <20200824082325.4prwz56p2ppgfojl@mrinalpandey>
 <alpine.DEB.2.21.2008241052310.2932@felia>
 <20200825045358.hygtrkm6qxyiwjft@mrinalpandey>
 <20200906042724.p6gbirsugnvslmh7@mrinalpandey>
In-Reply-To: <20200906042724.p6gbirsugnvslmh7@mrinalpandey>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 7 Sep 2020 09:10:10 +0200
Message-ID: <CAKXUXMyh1eVusXc+2DAN9H9WfyXHkTuCuhaiG8dfM54Km+rW4A@mail.gmail.com>
To: Mrinal Pandey <mrinalmni@gmail.com>
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Improve SPDX license
 identifier check for script files
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

> I was wondering how should I go about the original patch? Should I keep
> both the checks or just the executable one and let be the patch as it is
> as further cleanup can lead to better performance as we have already
> seen with the evaluations.
>

Kees Cook and Andrew Morton pointed out that a tool may not rely on
the executable flag. So, checkpatch.pl may not rely on the executable
flag; the patch we created here is misdesigned, now we know that.

> Also, I have completed all the tasks related to this project on Community
> Bridge's site. What are the next steps of mentorship? By when can I
> expect the results sir/ma'am?
>

Mentorship can begin by October 1st. We need to develop a project plan
for the mentorship, you are in the lead to write that. We need a
project plan for the mentorship to start.

In the process of the checkpatch.pl patch creation, we identified that
we can check if we find any invocations that rely on the executable
flag. This could be a first set of tasks to do in the mentorship.

Maybe, you can find another aspect to look into the checkpatch.pl
evaluation? Maybe the check for the line of the SPDX-Identifier was
not the best case to start with, because it is more complex than
initially thought.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
