Return-Path: <SRS0=+xMb=MK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0812AC636CA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jul 2021 04:42:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80E0F611BF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jul 2021 04:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80E0F611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A08183C02;
	Sun, 18 Jul 2021 04:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 59Xr3wnPJznp; Sun, 18 Jul 2021 04:42:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4895283BF8;
	Sun, 18 Jul 2021 04:42:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16564C0010;
	Sun, 18 Jul 2021 04:42:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF80FC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 04:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B65E783C02
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 04:41:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HrvIrvpbRUKa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 04:41:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D00E183BF8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 04:41:57 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id b13so21916112ybk.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 21:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kKMnKYgNqBVIHnQAYr2HV/K1dEBcd4y0fkBWPDZlZSk=;
 b=P4SaLHfav+58gmivlwKH6lvrVWJIX5A3OyF5YxUrFuKjaUJ950jw7vIq2p1iKR1AjO
 34Z4M17jFV/sDz4SWtb3L05w4X6p5VAEXz3lzKyCetfT0O7HtRuHz3Zq+L3zB16zDzk6
 TPBySCL3wp8qWyqI4e7sJE8sokRUtvQmgnBI6Ph/fBQmfpuWgFQGkiqlECafPoF7VFQx
 K9UvewUqqnVEnY4TUGUS3r/3L1F8IjyZ5N9X2sBP8YccxQtytDSkDGTHeCfGVyuSZRFc
 o7XYYP36NtscNdFFUaAvMgbGu3joM1g+2qPpzc2bL+NVn15j7wY6jZREx2hK3DCsL1TY
 oS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kKMnKYgNqBVIHnQAYr2HV/K1dEBcd4y0fkBWPDZlZSk=;
 b=pZostc/ZdtU3T5GGbabeQZJgzavewHCKF0K2Z2exU0W5/Ifv6kNwosawvhkehAjzaw
 FtQdI7qraoP9xFbK4++x644Y1/erNFTX0rdQ2fdpLhRLSayWbPVjN+KsLybnyycmo0Ke
 QUJElFG9FJxQErsSX+jzIv6mnoXSWVoNmUJrqMtGRZVMpoA2aJcqYEi2nP9wspGd9GzQ
 Pb/W3aBaK/ZXy0m4u5mQz/CNTcwbgv7kxtrYQRC/OA6wGpboZuDVaJTgRLifr9ObgA+U
 1E2Xc91yaU7ULq/Xj9sMxV8wPVNm0V+2GTVn9Bn6wNu3G4Qa5g1deoTxfLsTN5AcDcao
 EVJQ==
X-Gm-Message-State: AOAM531d14VZdcjP0VBR3ym2mahlmfPSaA71f1tbcRrF64uf/91R+Gzi
 Az2bRxlT8h5sgh5bPQ3s+WlOFx48ExLWiOjCrtY=
X-Google-Smtp-Source: ABdhPJxdL3QL4ZCr8ozfkQr2IRs4jwhsl1fFFGkXiTwJS6LwVY9dh6xy9zZcuscCUpyub6IF2CZffYgL0/byzG51psw=
X-Received: by 2002:a25:4095:: with SMTP id n143mr21775707yba.22.1626583316422; 
 Sat, 17 Jul 2021 21:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210717065427.GB4873@uver-laptop>
In-Reply-To: <20210717065427.GB4873@uver-laptop>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 18 Jul 2021 06:41:45 +0200
Message-ID: <CAKXUXMy9cTVSLYd4hFgq5xiTTwj=YPae8tJxyWM4rvsom5WH6A@mail.gmail.com>
Subject: Re: Linux Kernel: Mining for Maintainers Mentorship Tasks
To: Utkarsh Verma <utkarshverma294@gmail.com>
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

On Sat, Jul 17, 2021 at 8:54 AM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
>
> I am interested in the Mining Maintainers mentorship program and I would like to work on the tasks for the mentee selection.


The zeroth task is to learn suitable netiquette for the communication with

the kernel community. Below are some basic rules and pointers for this
mentorship. More information on kernel netiquette is also at
https://people.kernel.org/tglx/notes-about-netiquette.

First, please do not top-post.


    A: Because we read from top to bottom, left to right.
    Q: Why should I start my reply below the quoted text?

    A: Because it messes up the order in which people normally read text.
    Q: Why is top-posting such a bad thing?

    A: The lost context.
    Q: What makes top-posted replies harder to read than bottom-posted?

    A: Yes.
    Q: Should I trim down the quoted part of an email to which I'm replying?

Second, please always CC: linux-kernel-mentees@lists.linuxfoundation.org.

Third, set up your email client according to the kernel community rules.
Here is some information to that:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text
https://www.kernel.org/doc/html/latest/process/email-clients.html

Generally more information on submitting patches and responding on
replies is at https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Once the zeroth task is understood, you can now move on to the first task:

First, download the kernel git repository and compile the kernel with
the x86-defconfig build configuration.

There is a file called MAINTAINERS in the root directory of the git
repository. Read the introduction at the beginning of the MAINTAINERS
file and understand the content in the file and its organisation.

Explain in your words: What is stored in the MAINTAINERS file?

Now, search for specific MAINTAINER entries; Please answer: Who are
the maintainers and reviewers of the following sections?

EDAC-SBRIDGE
EROFS FILE SYSTEM
INTERRUPT COUNTER DRIVER
MARVELL MV643XX ETHERNET DRIVER
MSI LAPTOP SUPPORT
PCI DRIVER FOR ALTERA PCIE IP
SECO BOARDS CEC DRIVER
SOEKRIS NET48XX LED SUPPORT
TOPSTAR LAPTOP EXTRAS DRIVER
TTY LAYER


Please let us know about your answers and always send your responses
to the linux-kernel-mentees mailing list. After that first exercise,
exercises 2 and 3 will follow.


Best regards,

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
