Return-Path: <SRS0=aL4C=EB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631FCC4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Oct 2020 16:50:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1BB0221FC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Oct 2020 16:50:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMUcIEan"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1BB0221FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 45CEC87191;
	Mon, 26 Oct 2020 16:50:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PeMf4RC3B+hK; Mon, 26 Oct 2020 16:50:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 108C687178;
	Mon, 26 Oct 2020 16:50:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF6F4C0859;
	Mon, 26 Oct 2020 16:50:19 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2838C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 16:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BAE7485FAC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 16:50:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jo+OnvKIdiQz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 16:50:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C8988864C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 16:50:10 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id p16so8956511ilq.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 09:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y93c9mB06dsyWfdvzsP2g5YCbqXZAHH8RJ/PBt72Grk=;
 b=EMUcIEan5vvhvJy1rfeqhaABbBiZEKfZSZTmqcOPwrxmg9GDN0/d4Xc8VfoRoVvqml
 MFaUJMGwjQtukvsLc4MiC/vBfP7KHv2vvKkAwz62CAe3MSU5GHn5lTuj0l4C8/LhxRG5
 YRo6nffLDpWHMqgZpSEBVEo0zt8aqeCPQ9SFDxKjkbZ04PsHRtCxA5tPRggkexIDQHLq
 05Nm7zilImGXrp78hY2XgN5ey1ln4vTXQB9ozbhWyVYIpJY12gwfGy3mqBrz3WteihgB
 jH0dDfrZB81Gr92delSv1qZc5BtgjCWiPZP09BP540WmgPNx9bNJ+Dy60h+T2ma+LHnH
 fstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y93c9mB06dsyWfdvzsP2g5YCbqXZAHH8RJ/PBt72Grk=;
 b=RSY8nH7e4z55C1+L07sXaSLkiWKe8q1gvZozDo7uRNcabQm2Ta4CbZYQuyQawRLblo
 t7S9n010s5NUstvCDQS5dfRy7I1RpoFeOqmRIkdWuvzPhVKSXp4oC9wKVv/ZdjjjT+pE
 UqNnjE8XB4Qwe/BBm18bhHrs30Uhrg9pJuA7bE2NCfea8cIJ1WaBYad7lQXoQsBt2G/t
 hQUM5TrbfB4UWI0gH2bMUOQx3SShqv0UH3CNFH26NpaPbkS3uVdH9G6AZe2tBlP1HxHx
 v24qsi1triLV6WIGwIk2V96B9NKo57VrRXXi/4i1ym0sgScfcq8ekC6Um95yi+jrSfw/
 clZw==
X-Gm-Message-State: AOAM5319FRrPVwnawUMeRiFcsmd7iER4SYgDj62ewvhIl77bt0l2erI/
 c13upX3dLDaahCPgFIs1m/v/SxJjpB7GIW6iNMs=
X-Google-Smtp-Source: ABdhPJyRr/cXpkQ0Lfs8LFEqq7aqeJHSbkW6LX0iIGGWrdWCVslS9QKlhaUXHXR0C1gErGqgRnYXxoxgONqbyGk/2FA=
X-Received: by 2002:a92:de43:: with SMTP id e3mr10158269ilr.62.1603731010097; 
 Mon, 26 Oct 2020 09:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <f5a91092-8bb2-5cae-6911-3f1d4150d627@gmail.com>
In-Reply-To: <f5a91092-8bb2-5cae-6911-3f1d4150d627@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 26 Oct 2020 17:49:59 +0100
Message-ID: <CAKXUXMzVn8qe7wOmo==r2z74X7VnhFnOpAdAUtJJcRNr==9Wog@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Mentee Proposal Feedback
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

On Mon, Oct 26, 2020 at 10:11 AM Aditya <yashsri421@gmail.com> wrote:
>
> Hi Sir
> I have made a proposal based on your suggestion for interactive
> checkpatch.pl. Do I need to add more than one task in it? Actually, it
> was exceeding the 1.5 page limit as you mentioned so I decided to ask
> and get a feedback on this.
>
> Link of proposal:
> https://docs.google.com/document/d/1GpyLzJwDkH06azgThZMnaFKvn8bwo6UI10em8weWjcE/edit?usp=sharing
>

I added comments in the Google Doc.

We further would need to determine if you are applicable or not from
the terms and conditions of the program.

Also, we would need to identify which work you can realistically
commit to. If you want we can clarify these points in a quick video
chat.


Best regards,

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
