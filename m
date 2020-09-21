Return-Path: <SRS0=KrtX=C6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4EBCC43465
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Sep 2020 14:00:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26A60206C9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Sep 2020 14:00:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxZrmBhL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26A60206C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9D8BB86109;
	Mon, 21 Sep 2020 14:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iPGtTTpPNrY6; Mon, 21 Sep 2020 14:00:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 450D586108;
	Mon, 21 Sep 2020 14:00:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D886C0889;
	Mon, 21 Sep 2020 14:00:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B7B7C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 14:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 76F1E867A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 14:00:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MW5Z3XIGZyzf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 14:00:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C0658866D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 14:00:27 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id q21so12396540ota.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 07:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uHZQ2Xwd0fxYJfnKQqjK2gq9A35dvgUim/YuiG0Izqw=;
 b=RxZrmBhL6yezQb6NMuFyaEFoFPUimSKuvzhB55d0/Y6+ztlk13ABsglIgd6HyvTQ9n
 XVcsxB9Z7rY+NMo6wQXE/SVDR6FpGD47NxjFEIQJzwOWnr7MH+4XoBuesZ5EQY8GOiHR
 wRYo7g08vMedAOPmaAjPUUjylopB09how8NuTI1t3toIBW273JWWPAQH2v32kyZ0feyt
 UNcKBvVI2wL7OgGtixJHv+jWwN3Y8+Mgu6nFilkTFFmJfSl6y6HfYcmsl64g/wVWosof
 phudP8QOa/WlF65r5+c8apTPFxTPJJQ9ugVLgXUjVnGC9jYM5pmfDLpPVLyL3Y0Wek1p
 p9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uHZQ2Xwd0fxYJfnKQqjK2gq9A35dvgUim/YuiG0Izqw=;
 b=W9ywoJleEaAaO/BzEhI4vbdMC1JS1sAKInK+OwoTDfB8CZufBiQYp7+5RmPXaJN80U
 I25z9NLj20mNH7iuXGPRnhuRfPWjsj2M8QAq5Am0cjeCOYLMnRaN+dBIVPdppQTb53z/
 EEYjQ7UD3WrRDivyxRWmYb+0EfFC/qHXf8QPoj4Nrr8TBVoMo0h5Ugnrzoy05NBN9X4M
 Ss99AigXsatUyx5mzkYt/FIVQFGjQUClXuVMj6h67POjrYmyjl3G33xiq9lGZnE20hhh
 044yDHqYnv8D0+C1KsTwXWBqau+U3UNTYYmCOtz7olzV91gWGc7eJi7hIG6piaNvbnJU
 jRWg==
X-Gm-Message-State: AOAM5314DEPVeGphMUEA9AKO1nxxxAOBFzBGh1xheL7TStThFh9K+CZa
 +f/xoPtWBjyPjA7z51y2ghXgvLBVRLSHAvZ76yo=
X-Google-Smtp-Source: ABdhPJw6oKhiYzvnL7l6kuxIQ0aSoD09FImS9qum4ywbvzY1qIY472WLRqiJj8FmWTD4/aiGzaPFYv80ZI9/UI7c+Hc=
X-Received: by 2002:a05:6830:c4:: with SMTP id
 x4mr33207275oto.30.1600696826758; 
 Mon, 21 Sep 2020 07:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5AVLBwACOwZQKhMoOgUF9ZiO6OoZt0+TkQQHoeUD8igYw@mail.gmail.com>
 <alpine.DEB.2.21.2009211515030.19489@felia>
In-Reply-To: <alpine.DEB.2.21.2009211515030.19489@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 21 Sep 2020 19:30:07 +0530
Message-ID: <CABJPP5BAyvZQBKZV69bA-_QMLcGM_W-1ua9OPbmmjFncBzLsCA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl improvement:
 NO_AUTHOR_SIGN_OFF warnings for users with multiple emails
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

> This sounds like a plan.
>
> I expect that this task would roughly take you 40 hours of work to get
> a first patch ready to the state for review at lkml.
>
> Please use the linux-kernel-mentees mailing list for early versions of
> your work before that.
>
> Then, I expect another 40 hours of work to get all reviewers/maintainers
> happy and get it towards final acceptance.
>
> I suggest that for the first mentorship milestone, we also add to have
> some basic documentation and some patches directed to the developers
> we can already see with special setups, e.g., Daniel Vetter, with suitable
> entries in .mailmap for them. They can then ack those .mailmap patches and
> integrate them.
>
> Let us aim to have 10 patches for those most regular developers sent out
> and at least one being accepted.
>
> Would you agree to that for the first milestone?
>
> If so, please state here and provide all needed information in the
> community bridge system. Then, we will proceed in the system, such that
> you get an official go and you can start fleshing out these patches.
>
>
> Lukas

Definitely, I agree with the first milestone.

I will fill up the details on Community bridge and let you know once
done.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
