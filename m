Return-Path: <SRS0=Pn+h=MV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DBCC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 15:02:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B82560EB5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 15:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B82560EB5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0717483AA2;
	Thu, 29 Jul 2021 15:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yIPE8D_Gq0Wm; Thu, 29 Jul 2021 15:02:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2082983A96;
	Thu, 29 Jul 2021 15:02:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DDFB2C001C;
	Thu, 29 Jul 2021 15:02:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF5ADC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 15:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF68883AA2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 15:02:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZS2OF2EH8a2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 15:02:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F025583A96
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 15:02:28 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id q15so10740022ybu.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 08:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WCjHACFD6VPbyFhl9ZvXF2b3FbnGlco4hU51O28uCqc=;
 b=thmplKK1+cc38BWAIFDx/FAwzYGYFJDafm7vmH03a7+UaxHnsANBIkkNkWQ4voBkbS
 4T/IKKSrfk9IehLF8NkrAuVK2fPclQ9kHfKGU34P3geT8eXGkUCyvZGmYX6Yhn4MW0Ev
 /MPhJnI6j5pQLxoOA97xMyUAlZL4/ErGAAPpFDYibyRVSMGm8CFwsYpFpB4mnDLw7PQE
 TCSvWjhBXTmqfXx8PD7HD0IDdtqX1320bSwpk/LiQdJ2o1DtmSItZypii0bl+d7R57vt
 arKtorfYjAZvxC1uZK0a/kuB45NiYFkvy+EQiFZ0rvcv/rZnAU3262WWN6ZuOXB0r5SM
 g76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WCjHACFD6VPbyFhl9ZvXF2b3FbnGlco4hU51O28uCqc=;
 b=WW7MeO/zZZfSzkPES52g6PJp75q39TxJp10jrlcK+vQIYxuL79pG/X38eO3LhZbWCs
 6mIKxEPSXqq8yRweulTRGAqTNtV/ATEDozaOarTNlA9fwz6yMe5V+UKSsQbWehJVX5LS
 4RsA8V2ZBl5SxQ3gk9N9JcZei7rZ5UspOCqLSML5c48sIGnkAnfic8/YijeqJSDiEPtY
 JUX76Q90Zy/gX6Sod+08OqYoZIfP1j0tttSQLRheflWCzviEiT3GngZtMZlMoZaeOz5f
 ijX9u7NxHUGtqGgt2Uz8oKyHg1hDFKTs5RyBTjDFfnTYiT4xnZ8+FSsBV4Hi5uRmP3Ia
 U3tQ==
X-Gm-Message-State: AOAM532Q5T8PhtaZo91dtXKpyjszcSeUZYR/nq+Rm+uQi6Ts4ZxRJftW
 5Fjm6Dee8oXpzLrTwC6QRT0YrGHZEzfKsAWjHycJS+Ka+mY=
X-Google-Smtp-Source: ABdhPJzfTyVJM0rZtpqpbRq7LwPW2HfQLR4H3jbWY1e3t+LzZyhFUqAhAHtG7IeNYH7+zaaKFGG0PAcfHAIa6mlJwJU=
X-Received: by 2002:a25:d290:: with SMTP id j138mr7588264ybg.151.1627570945351; 
 Thu, 29 Jul 2021 08:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <295b8f8c-4264-9f32-6723-9d2d574021ac@infradead.org>
In-Reply-To: <295b8f8c-4264-9f32-6723-9d2d574021ac@infradead.org>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 29 Jul 2021 17:02:13 +0200
Message-ID: <CAKXUXMwAAs_MBzo32oh8UYBZpyrAT-tRPaNRLEQ3c3SfyVAK6Q@mail.gmail.com>
Subject: Re: patch suggestion: Kconfig symbols
To: Randy Dunlap <rdunlap@infradead.org>
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

On Tue, Jul 27, 2021 at 2:21 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi,
>
> Running scripts/checkkconfigsymbols.py reports several hundred (maybe thousand)
> Kconfig symbols that are used questionably. Lots of these are false positives
> but lots of the remainder could use some cleaning up.
>
> One example:
>
> DSCC4
> Referencing files: arch/mips/configs/gpr_defconfig, arch/mips/configs/mtx1_defconfig, drivers/net/wan/Kconfig
> Similar symbols: SCC, DMASCC, CRC4, CRC64
>
> There is no longer a Kconfig entry for DSCC4 (it has been deleted, but some
> references to it were not deleted) -- and this is not a typo
> of one of the "Similar symbols" listed here.
>
> So all of these references to DSCC4 can be (should be) deleted.
> And of course, Cc: the GENERIC HDLC (WAN) DRIVERS maintainer on such a patch.
>
>
> False positive example:
>
> XCHOFFLD_MEM
> Referencing files: drivers/scsi/qla2xxx/qla_mbx.c
> Similar symbols: OF_PMEM, CXL_MEM, CXL_PMEM
>
> The Referencing source file does this:
> #define CONFIG_XCHOFFLD_MEM     0x3
>
> which is legitimate, so no change is needed.
>
>
> Comment example:
>
> IA32_SUPPORT
> Referencing files: arch/x86/include/asm/ia32.h
> Similar symbols: MEDIA_SUPPORT, EDAC_SUPPORT, IOMMU_SUPPORT, USB_SUPPORT, I2C_PARPORT, NIOS2_FPU_SUPPORT, NIOS2_CDX_SUPPORT, NIOS2_BMX_SUPPORT, MEDIA_USB_SUPPORT, MEDIA_SDR_SUPPORT
>
> The Referencing file has:
> #endif /* !CONFIG_IA32_SUPPORT */
>
> and this #ifdef block was begun with
> #ifdef CONFIG_IA32_EMULATION
>
> so the comment on the #endif line is incorrect.
> This could be fixed but it's not a big deal just to leave it as is.
>
> So there is lots here that could be done, but there are also lots of
> false positives here that don't need to be touched.
>

Thanks, Randy. Before giving the tasks to potential mentees, I first
had a look for myself and investigated as well. As you have seen, I
could already quickly remove HAVE_IDE, see
https://lore.kernel.org/lkml/20210728182115.4401-1-lukas.bulwahn@gmail.com/.
I am preparing another larger patch set for ./arch/x86 fixes to see
the reception of such a larger clean-up before handing such tasks to a
mentee.

There are a few "real false positives" and a few "just fixing
comments", but it is not too bad...  In the end, there are some issues
that have been 'broken' (= working differently than intended or
fulfilling no purpose) for months or years and not being noticed. So,
the tool does serve some basic purpose of detecting some issues. Of
course, the resulting commits are "trivial patches", which brings back
Greg KH's general concern (on the ksummit mailing list) how to deal
with such work (e.g., verify the effect of the patch) when done by
potentially less trustworthy developers.

At least here on the linux-kernel-mentees, those patches would be
gated by some general mentor review and testing.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
