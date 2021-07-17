Return-Path: <SRS0=s3T2=MJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D5FC636C9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 14:01:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A496611C0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 14:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A496611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3163415AF;
	Sat, 17 Jul 2021 14:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rCaZkEGySxOX; Sat, 17 Jul 2021 14:01:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7B6B4414C7;
	Sat, 17 Jul 2021 14:01:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5462FC001D;
	Sat, 17 Jul 2021 14:01:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97A40C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 14:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 790A883E52
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 14:01:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HETh-Ehka1hi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 14:01:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE5EE83E49
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 14:01:31 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id d12so13059067pgd.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 07:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=sjs5BIuLJak6pm+yHi8hS0ZO0fg4x85PgrTYNSEt31M=;
 b=dL8r4RPHbzOXjbxT5ziaYK2+V6VQr0Ivq0f4+h2aN4M+Xf1+gGDQjbc5wvResbp2Pa
 Jq+/fnRKo8hZbl6QRg0WX9ScZR7Izq2Hm5YKVEnNIxXT341OwyzPBBnIWcJdmWKWgBDs
 5yH8rE1VCmD/D4kSWaqfv8+lZR9/NKL6BUCNKoZ7JloldWL042+Vtzi5yEMaWMbsdGoi
 g6wF0i0vmvOvfYb+dwaepVxwCYYCtXpVCHfIb5xzEUSs2NYFbFwIQ/UZ2Mpucc9zYuF5
 DZpSX+8hz+iQ9KJ4yxxze/v66J80KlJ3xKceTvZ3JM4aaTAHBDXpseUJ8mHBjdqldcaj
 EP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=sjs5BIuLJak6pm+yHi8hS0ZO0fg4x85PgrTYNSEt31M=;
 b=tas/hLqvEXwO0nT0ef0PTt+YBPYkCDXwuOiZHsmkcPNrZh5g0cMl8lhsKSyqqqyb5N
 gLekhajbc/bRhLhAqarY1j7gCGuQb60XrrUbK02fd6hlMALVR9Gju4WXv8dfM1NXs6Hp
 NtBeMeiHa/9akpSoJc7sps+DoZPdsh8uwFXqLnArkrYDdhEpEnxRCI1tYS8IJqX+Vpqi
 ue/HPJIENNueD0v7AMbja4W+wPUpm7E8vCmjjBS2npNdBpnvLMPBAjHMP1gwN8OnCjrB
 SHA6SJtnoiact6PMNSa7ZijeH2h9kSlFNDbdTN5wCJ/2+BEsNBPSbLBd3crjIePyCZXe
 EbqQ==
X-Gm-Message-State: AOAM5311T7fJs8Zk+1XX3eGRLMmMNIxWQKtmD1M6foVpk53+2ixJcBta
 4snS4dfFOoCKYAXOQxU0xng=
X-Google-Smtp-Source: ABdhPJwmd2EKqOKKHufPWOH3l7yJlaEphpj3k7iIMDFBKArA/rTgBT9BHQMg8IHtZQ3gDqtm414kLA==
X-Received: by 2002:a62:ed06:0:b029:32c:a800:ba47 with SMTP id
 u6-20020a62ed060000b029032ca800ba47mr15533218pfh.56.1626530491317; 
 Sat, 17 Jul 2021 07:01:31 -0700 (PDT)
Received: from msi ([103.83.246.86])
 by smtp.gmail.com with ESMTPSA id f3sm14105736pfk.206.2021.07.17.07.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 07:01:30 -0700 (PDT)
Date: Sat, 17 Jul 2021 19:31:26 +0530
From: Parvathy H <parvathyhiyer@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: Mining Maintainers mentorship program - mentee Selection tasks
Message-ID: <20210717140126.GA4378@msi>
References: <20210717045910.GA4410@msi>
 <CAKXUXMyTGFP5X2r6=oqC0N-9va5O-2FbcYfaBYzH2Lb5dmWozA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKXUXMyTGFP5X2r6=oqC0N-9va5O-2FbcYfaBYzH2Lb5dmWozA@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat, Jul 17, 2021 at 08:35:31AM +0200, Lukas Bulwahn wrote:
> On Sat, Jul 17, 2021 at 6:59 AM Parvathy H <parvathyhiyer@gmail.com> wrot=
e:
> >
> > I am interested in the Mining Maintainers mentorship program and I woul=
d like towork on the tasks for the mentee selection.
> >
> =

> Thanks for your interest.
> =

> For the mentee selection, please work on the following exercise:
> =

> First, download the kernel git repository and compile the kernel with
> the x86-defconfig build configuration.
> =

> There is a file called MAINTAINERS in the root directory of the git
> repository. Read the introduction at the beginning of the MAINTAINERS
> file and understand the content in the file and its organisation.
> =

> Explain in your words: What is stored in the MAINTAINERS file?
> =

> Now, search for specific maintainer entries; Please answer: Who are
> the maintainers and reviewers of the following sections?
> =

> DMA BUFFER SHARING FRAMEWORK
> DRM DRIVER FOR ARM PL111 CLCD
> HARMONY SOUND DRIVER
> IOC3 ETHERNET DRIVER
> KASAN
> KFIFO
> MAILBOX API
> MAN-PAGES: MANUAL PAGES FOR LINUX -- Sections 2, 3, 4, 5, and 7
> SQUASHFS FILE SYSTEM
> THANKO'S RAREMONO AM/FM/SW RADIO RECEIVER USB DRIVER
> TIPC NETWORK LAYER
> =

> Please let me know about your answers and always send your responses
> to the linux-kernel-mentees mailing list.
> =

> After that first exercise, exercises 2 and 3 will follow.
> =

> =

> Lukas


Hi,

WHAT is stored in the MAINTAINERS file
_______________________________________

MAINTAINERS file contains information about maintainers and some tips for t=
hose who want to submit patches.

First part of the file gives some general gudelines to follow while submitt=
ing patches is provided in the MAINTAINERS file.

In the next part, decriptions used and their meaning is given.

In the next part, the list of maintainers corresponding to different sectio=
ns are given. This part contains information like maintainer's mail ID, mai=
ling-list, status (whether the area has a maintainer or not, or is it an ob=
selte subsystem etc), files and directories wildcard patterns etc. This inf=
ormation is listed under the relevant section name.

Maintainers and reviewers of given sections
___________________________________________

DMA BUFFER SHARING FRAMEWORK
        Maintainers:
        1. Sumit Semwal <sumit.semwal@linaro.org>
        2. Christian K=F6nig <christian.koenig@amd.com>

DRM DRIVER FOR ARM PL111 CLCD
        Maintainers:
        1. Emma Anholt <emma@anholt.net>

HARMONY SOUND DRIVER
        Individual maintainer/reviewer detail not mentioned
        Mailing List: linux-parisc@vger.kernel.org

IOC3 ETHERNET DRIVER
        Maintainers:
        1. Ralf Baechle <ralf@linux-mips.org>
KASAN
        Maintainers:
        1. Andrey Ryabinin <ryabinin.a.a@gmail.com>
        Reviewers:
        1. Alexander Potapenko <glider@google.com>
        2. Andrey Konovalov <andreyknvl@gmail.com>
        3. Dmitry Vyukov <dvyukov@google.com>

KFIFO
        Maintainers:
        1. Stefani Seibold <stefani@seibold.net>

MAILBOX API
        Maintainer:
        1. Jassi Brar <jassisinghbrar@gmail.com>

MAN-PAGES: MANUAL PAGES FOR LINUX -- Sections 2, 3, 4, 5, and 7
        Maintainers:
        1. Michael Kerrisk <mtk.manpages@gmail.com>

SQUASHFS FILE SYSTEM
        Maintainers:
        1. Phillip Lougher <phillip@squashfs.org.uk>
THANKO'S RAREMONO AM/FM/SW RADIO RECEIVER USB DRIVER
        Maintainers:
        1. Hans Verkuil <hverkuil@xs4all.nl>

TIPC NETWORK LAYER
        Maintainers:
        1. Jon Maloy <jmaloy@redhat.com>
        2. Ying Xue <ying.xue@windriver.com>

Thanks & Regards
Parvathy
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
