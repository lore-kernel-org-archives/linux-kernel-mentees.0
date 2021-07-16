Return-Path: <SRS0=Sa9D=MI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3581C12002
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Jul 2021 18:16:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77F55613F2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Jul 2021 18:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77F55613F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A0A14256A;
	Fri, 16 Jul 2021 18:16:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ky9uEGQVOIlt; Fri, 16 Jul 2021 18:16:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A9D6D42568;
	Fri, 16 Jul 2021 18:16:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ECBC3C0024;
	Fri, 16 Jul 2021 18:16:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76154C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 18:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56DFC4255E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 18:16:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uAUkYgeaE8ut
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 18:16:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77B7A4255B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 18:16:02 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id t186so16243832ybf.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 11:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iWAawrzfv66AoUs2JSARlO2qCEIlBS0czfzyeymt4wk=;
 b=VhNyVYou/0c88oyYeR5dUzY33hp+tAJw7viTsPLRuVxdpopNf9rqeUGW5VfEHAYUWW
 gwuUcTLGZ39rkGclrLyGAyqB8Ku31SWKpBPpRVDmBJdM/c8B/LxEiPlYwbJynomr2mH6
 dWMtPTgbdJ8WWZ9H6XePNFd2SHKIvcvHvdnvt+IUcPs9398W6mHRsUJKz8Skk2yl4JqO
 j2ssN/tEEIjs6ADukvqxMX5U/Jp5yc3ItBI1RVSAH4zwfdtfxuc9QJomB+dI9QuASnRN
 iSW4+uI8qvcmkJmRkkUjVsZPBYnerwRUArNtQl2RW0B087NeDAOiW52hOUkwfFCNQJvD
 HsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iWAawrzfv66AoUs2JSARlO2qCEIlBS0czfzyeymt4wk=;
 b=Pd7QaxmemwpDvAl2chrhbfGn3lwtwblN8VTO5FmpbKgUNoBVO/vNS4mxOODnKS4nW5
 65MsTgZWsRg9pHXJ2IfuuWBB2Wy1tlp24V1IJTq4LrREIIlCUzDtUOpDB48wPdz+nEXF
 NreJoNhw9eaz3Bc/1Wqnpmy54LPFM2Dx8BhdAXMUqeB1JlNtduwbreDarUSyfrFF4k3H
 +eZRMJi+eXhdB8ld4nYWCija6yv3wsfP8ZBQOWUgBnFvifrqouk7T9JVbbO81M0XwVts
 T7hoSqyXqoD8P/5VqRKMZUrFuhKN3hHPrYNDHp8tcpV3exdzdJv59OUBxAnT0nZg97kT
 EJbA==
X-Gm-Message-State: AOAM5337ESKoYriuZe52gKunE4RCnkXEh5c0flR9gwu03x0TwbIR2agH
 GOrGqG41tsnFytTgyNxMM1aay74XXTiCB8TfMSA=
X-Google-Smtp-Source: ABdhPJwwo/EgppiaDkVY7QbKMYYE+G8EhczRzQhDRxdLRD9xxrtuBjqlVwMmOicCGiyrq6e1r7WZB/WnMfxFBkaVl64=
X-Received: by 2002:a25:f30d:: with SMTP id c13mr14014674ybs.134.1626459361238; 
 Fri, 16 Jul 2021 11:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAHLqCyqH6wrkH4cugVFinF40_-Q=NH7CGtiAj5cwXm=drWBVcA@mail.gmail.com>
In-Reply-To: <CAHLqCyqH6wrkH4cugVFinF40_-Q=NH7CGtiAj5cwXm=drWBVcA@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 16 Jul 2021 20:15:50 +0200
Message-ID: <CAKXUXMxrEgfDHYjuMpFer6gEhnnoOFUeMQosF22rzbYzh9o32w@mail.gmail.com>
Subject: Re:
To: Subhasmita Swain <subhasmitaofc@gmail.com>
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

On Fri, Jul 16, 2021 at 7:07 PM Subhasmita Swain
<subhasmitaofc@gmail.com> wrote:
>
> I am interested in the Mining Maintainers mentorship program and I would like to work on the tasks for the mentee selection.

Thanks for your interest.

For the mentee selection, please work on the following exercise:

First, download the kernel git repository and compile the kernel with
the x86-defconfig build configuration.

There is a file called MAINTAINERS in the root directory of the git
repository. Read the introduction at the beginning of the MAINTAINERS
file and understand the content in the file and its organisation.

Explain in your words: What is stored in the MAINTAINERS file?

Now, search for specific MAINTAINER entries; Please answer: Who are
the maintainers and reviewers of the following sections?

AMD IOMMU (AMD-VI)
DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS
DRM DRIVERS
FUTEX SUBSYSTEM
I2C SUBSYSTEM
JAILHOUSE HYPERVISOR INTERFACE
KCOV
KCSAN
LINUX KERNEL MEMORY CONSISTENCY MODEL (LKMM)
NAND FLASH SUBSYSTEM
THE REST

Please let me know about your answers and always send your responses
to the linux-kernel-mentees mailing list.

After that first exercise, exercises 2 and 3 will follow.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
