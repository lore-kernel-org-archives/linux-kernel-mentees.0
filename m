Return-Path: <SRS0=5uhS=GP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFD9C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Jan 2021 05:36:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C26FB22CBE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Jan 2021 05:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C26FB22CBE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 68B3785EA5;
	Tue, 12 Jan 2021 05:36:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id re7mbkpp7Tif; Tue, 12 Jan 2021 05:35:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F211C85B11;
	Tue, 12 Jan 2021 05:35:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D978FC0893;
	Tue, 12 Jan 2021 05:35:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 071ECC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 05:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EEEB786DDB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 05:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xDgFkj9JQEhH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 05:35:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9DC9186DD6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 05:35:55 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id q75so883845wme.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Jan 2021 21:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=infsUzcQD9HxOkN+jdrDdnPokylOgvFOWttWTEFSans=;
 b=lpjTMWIZ05M7KZnBAKlJTWQ1Lw7Rw+zIDoKC9AIgj/bMc9OLt1Al7P6niz6slCKE0x
 zyyoBLdl149W+ei2Ghfi3s3uQVtB+wvhcAnkbhieuu4iBiGZ7rjb7VxXS+t0rt30bjWk
 XTnuqajv4aJ1++lU4L+VMPd9ayUbwVN3H6E0FpHgVzK0Tg96CaZYpuibIuOhuOPyWMdm
 h/w4Py3/hxxyIIJLrbHhiAL3uGtdkUh9aGfdVz5ZS2cpVATJ+H4MYBrvBQ/enU45eNDK
 j8IkhuMvqkhUMpxQfha7oi01dWv/qgTxPMadzpOy8WtKrwJ4Gd3ypYWSw1MiCXeYkhpC
 +8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=infsUzcQD9HxOkN+jdrDdnPokylOgvFOWttWTEFSans=;
 b=n7L9mJQSMcGETlnlOf3PJWwLtzkBc3CAVrg7b9Iz7a1VGAPq883ZSZUI8sIECP41EZ
 yFCJ2GnOY2VYcROrBK7KI55Q2TFKgMD7MsW4EEJXr6odgTdTjaYZTaEersSzdIrevJpZ
 Tn4T/0SDZzL8vNAGewp7okxmEshtTrrUcpppbbET+jhbcBt8XwQuvtj7PffPzLaPsaoy
 8TJrgoKC0Iu3rOJZP54XDuFHELsnm+u2YNp497YLa+70nMsXUvfiIX87TDxQNwJ/EV9x
 mUcdiQfRWd1RqGSLoSebGatv7AlWxQPjq/PgdS8z+MYc62UBY+rjUUIK5SCc2tdfzHyT
 6oJA==
X-Gm-Message-State: AOAM532rFPfmr38HlA0wYi1UsOn85xJr8KfwLqYr61D70UZDNLPLn676
 Fq605rsIbK3COREp49JzL2m1V/2uUhTFHQC5qfg=
X-Google-Smtp-Source: ABdhPJw/DaFPiEJL3SFoIgPpae4B3zPM8Hx56KIFUFyNMTSLE3VO7d/8j/DiHL7PtoWVb7vTOffdET32s9gLIS+nUYM=
X-Received: by 2002:a05:600c:4ed0:: with SMTP id
 g16mr1759580wmq.176.1610429753895; 
 Mon, 11 Jan 2021 21:35:53 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMzydtFqJ_ZRoF0HQugTBYHZZ56ws9AdUq6TmGL-m5JP3Q@mail.gmail.com>
In-Reply-To: <CAKXUXMzydtFqJ_ZRoF0HQugTBYHZZ56ws9AdUq6TmGL-m5JP3Q@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 12 Jan 2021 11:05:43 +0530
Message-ID: <CABJPP5DH1YfT2aQ5ejK4_VJZy-XJG8Jib+FJjHq3PD3XagP=+Q@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] comment on checkpatch
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

On Tue, Jan 12, 2021 at 10:38 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> https://lore.kernel.org/linux-next/20210111230029.GM4728@sirena.org.uk/T/#m355576186555c4b6e85dbb9a1b3fe3d5e80f6e9f
>
> Aditya, Dwaipayan, Have a look. checkpatch already handles this, right?
>
Hi
The following Fixes line in commit log emits no warning:
   Fixes: Use packed mode for 32 bits per word transfers to increase

Neither does a fixes with mismatched commit description:
   Fixes: e4da63cda51f ("networking: packet_mmap: fix old config reference")

which should have been infact:
   Fixes: e4da63cda51f ("docs: networking: packet_mmap: fix old config
reference")

I could work on this if Lukas and Joe are okay with it.

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
