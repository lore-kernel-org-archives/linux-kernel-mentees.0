Return-Path: <SRS0=5uhS=GP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E25C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Jan 2021 06:03:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AB1D222F9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Jan 2021 06:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AB1D222F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6784887033;
	Tue, 12 Jan 2021 06:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IaHUN+lzKPpp; Tue, 12 Jan 2021 06:03:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 409298702B;
	Tue, 12 Jan 2021 06:03:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F432C088B;
	Tue, 12 Jan 2021 06:03:36 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F8AAC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 06:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 26A9E8682D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 06:03:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y228rrV8CDz8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 06:03:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9076D86814
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 06:03:33 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id n4so1670456iow.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Jan 2021 22:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ywx01bqXnHeGjeb0KMvaspuwnD/mVoMWHaT3+9GRNwQ=;
 b=pyWtyNo48fUrjdA3kRCiYz7P5byONNSSvAk27TwXQ1D9oWxGw0KD8AKvw5g0XeL9WY
 oPrAcTpvTcco8/7rM1RZPAc1922UwQJblE48OFErJ/3N2/KHvGeZOVtj//+sFiWEW0LQ
 t3e3o8TL1aW+8hqCpgyyt3ItxsEL/867jNzEAF3nEAITfiJzZpX9iexgFVAkAl4HvYap
 kOwWhoEz8JKTYpzICKiZRk9TLVEP1aq/05qUTVMTpSD7gVHBq0qIVjxsDitVp9Es+htA
 VFHef/CbGyVfKg8EFmVvEgxJu2rmWbRDXV67Bv54LRhvII3F4r8paBI4NVDoYVbKdn5L
 GODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ywx01bqXnHeGjeb0KMvaspuwnD/mVoMWHaT3+9GRNwQ=;
 b=oEpQBPPOIu/HL+IgyIPDFTNErfcwSchsrUSAshsEDE1Z73njKMkqs39Jk2JqkE1LiA
 bz2RZMWsc3nys9kt4dW3qvdWFucpO3ZNsDlrg3Om2XYb/1ebPT9IDfGUo2WmhaDbVXJd
 IkjXn1t2CBCm/IEn5pYFP6amM0WrisCGOXzxa2wU2Wms9QqBaRv3xvGdcZFPEBOjJo1K
 HNvOb3PpbLNCcy+PYUA/K631/pC6DQHBFwpoB6BvNsGkv62mayUMYlug1mRoJAjL02U4
 NRjVK9/Khw+POQYzgY7xtThpfCNOM1XXfXYT0uASS+s6upV5uUtVTZ1rSjJKmK8hZ6MY
 Q5RQ==
X-Gm-Message-State: AOAM531Q3p84CidRHkGxclHa0ASNyuomarfCyC4ZQ3jMp2/arO8r7LoQ
 uxAPaLQLs+Tx+5yLG+QZiyaGYEg1dr5y/9EbdlM=
X-Google-Smtp-Source: ABdhPJxFOyULhJBl6AS/U7MOkOWBZBCvE2LKxMwskihsaoxfl1LSbRZEymgKfGrdG2kcMdjo7ocUmgbGycjKju7+oAs=
X-Received: by 2002:a6b:6d1a:: with SMTP id a26mr2160175iod.158.1610431412766; 
 Mon, 11 Jan 2021 22:03:32 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMzydtFqJ_ZRoF0HQugTBYHZZ56ws9AdUq6TmGL-m5JP3Q@mail.gmail.com>
 <CABJPP5DH1YfT2aQ5ejK4_VJZy-XJG8Jib+FJjHq3PD3XagP=+Q@mail.gmail.com>
In-Reply-To: <CABJPP5DH1YfT2aQ5ejK4_VJZy-XJG8Jib+FJjHq3PD3XagP=+Q@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 12 Jan 2021 07:03:21 +0100
Message-ID: <CAKXUXMz3Or6=ji+Ye7nBx8+Me_j4Xhbkv+eBgW+guW5smXD0-Q@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
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

On Tue, Jan 12, 2021 at 6:35 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> On Tue, Jan 12, 2021 at 10:38 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > https://lore.kernel.org/linux-next/20210111230029.GM4728@sirena.org.uk/T/#m355576186555c4b6e85dbb9a1b3fe3d5e80f6e9f
> >
> > Aditya, Dwaipayan, Have a look. checkpatch already handles this, right?
> >
> Hi
> The following Fixes line in commit log emits no warning:
>    Fixes: Use packed mode for 32 bits per word transfers to increase
>
> Neither does a fixes with mismatched commit description:
>    Fixes: e4da63cda51f ("networking: packet_mmap: fix old config reference")
>
> which should have been infact:
>    Fixes: e4da63cda51f ("docs: networking: packet_mmap: fix old config
> reference")
>
> I could work on this if Lukas and Joe are okay with it.
>

Sounds good to me. Although I always thought checkpatch already has
such a check... we do check commit sha ("description"); so checking
Fixes can reuse that checking.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
