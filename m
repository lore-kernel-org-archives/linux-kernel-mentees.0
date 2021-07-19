Return-Path: <SRS0=VrTg=ML=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AB8C07E9B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 19 Jul 2021 13:26:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E237A6115B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 19 Jul 2021 13:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E237A6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A330540298;
	Mon, 19 Jul 2021 13:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id juGD-DOVEMtq; Mon, 19 Jul 2021 13:26:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EB4DD40292;
	Mon, 19 Jul 2021 13:26:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7A53C001A;
	Mon, 19 Jul 2021 13:26:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 279BBC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 13:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 243658379C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 13:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cQcolEhst31s
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 13:26:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D74E83794
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 13:26:10 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id 21so16490645pfp.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 06:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qQcFH+0ncUnrHhMju2S+XpWcziwN0FHPIpIEETWhWNA=;
 b=AsJJDLycyenlsce3xVPZvSYbp6F5f/Hp6eic0MOJjslTzfhOGY+zXhINm+kghiR5U6
 /TA3mA1ynsBszHxX7rOC433wKHEMaEdPi75SnIQqbGK9vTwUC4fnZALpPdl0sa2Hf9MC
 XUixj8fD6fgAnh+8wj1LfyidsxrrQdqoAuFLtXFUI1idxHe19dP9ZPnQgnktLDGlQn6y
 hT3QAsubbU9Me5Pgm9qykygBTTbEYqdLQhj+wxaByCnvrD4FhhrFTMrOHexqEXY2zfQ5
 8ARhLs+XjIp9fsUhSjWrUyidlbeJ+UCNDAeFlH0zz9wKqgbcoRKnUFrIWaHDV83YJn2x
 eweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qQcFH+0ncUnrHhMju2S+XpWcziwN0FHPIpIEETWhWNA=;
 b=fkU1Twn84+d82crRQUfReEreqWe4UDREoizBXZ5ts/sp+/qlGvw2aXoc75FiZUnQT6
 8cfcrQccpk5Ve1bwnCHIpWoV5pniOD3AUeohLnlYonblhmUitd6oBDKHwCP3EIl32Sw0
 bNydCCI48ldd70joSr309d+H4A68NITtExQdyPFOQLI/cMAi1pEasP68dgSadUagPH+J
 eAqKS5XCmRo9QgCxpjZpRM9zxJ8R4w5mcMjNzlQTFM0mG7Ke0AyinZBDtI8Or9bxt/kq
 TC/bHB3dsHhocIzRmxLvDEWyWVHDQFRBOAicwPwik9TisyodpLA70DD3CX9VysYAyCgN
 5HfQ==
X-Gm-Message-State: AOAM530WctkXai8qQoxNCn/lcHa0JLxVnEqQpyWGlAlKQGlzBdxylm29
 fhZFEvgEXtuN8oa7PPQNyFrAOz+H4Wqb9XsA
X-Google-Smtp-Source: ABdhPJy/j4iCUVs/G6DMMtqeSuLsBV/+W8jo8wZGy/3vm24hALw4t9ZPvW+0vTmi0PZZx+AzuqS58Q==
X-Received: by 2002:a65:6a09:: with SMTP id m9mr25451991pgu.149.1626701168663; 
 Mon, 19 Jul 2021 06:26:08 -0700 (PDT)
Received: from ?IPv6:2402:8100:30a6:3af9:e826:98fb:137:e491?
 ([2402:8100:30a6:3af9:e826:98fb:137:e491])
 by smtp.gmail.com with ESMTPSA id o10sm20417707pfu.131.2021.07.19.06.26.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 06:26:08 -0700 (PDT)
Subject: Re: Linux Kernel: Mining for Maintainers
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <97dc8d5f-ebeb-c12e-d214-7c5591f1f4db@gmail.com>
 <CAKXUXMzmn2fvM50Q7edAKk5gQzJs47gxOzyM4LuaaJKxcnbXPg@mail.gmail.com>
From: Piyush Thange <pthange19@gmail.com>
Message-ID: <57cbe2bf-9ebb-5b68-21fe-13aeead74708@gmail.com>
Date: Mon, 19 Jul 2021 18:55:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMzmn2fvM50Q7edAKk5gQzJs47gxOzyM4LuaaJKxcnbXPg@mail.gmail.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 18/07/21 10:17 am, Lukas Bulwahn wrote:
> On Sat, Jul 17, 2021 at 1:20 PM Piyush Thange <pthange19@gmail.com> wrote:
>>
>> I am interested in the Mining Maintainers mentorship program and I would
>> like to work on the tasks for the mentee selection.
> 
> The zeroth task is to learn suitable netiquette for the communication with
> the kernel community. Below are some basic rules and pointers for this
> mentorship. More information on kernel netiquette is also at
> https://people.kernel.org/tglx/notes-about-netiquette.
> 
> First, please do not top-post.
> 
>      A: Because we read from top to bottom, left to right.
>      Q: Why should I start my reply below the quoted text?
> 
>      A: Because it messes up the order in which people normally read text.
>      Q: Why is top-posting such a bad thing?
> 
>      A: The lost context.
>      Q: What makes top-posted replies harder to read than bottom-posted?
> 
>      A: Yes.
>      Q: Should I trim down the quoted part of an email to which I'm replying?
> 
> Second, please always CC: linux-kernel-mentees@lists.linuxfoundation.org.
> 
> Third, set up your email client according to the kernel community rules.
> Here is some information to that:
> 
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text
> https://www.kernel.org/doc/html/latest/process/email-clients.html
> 
> Generally more information on submitting patches and responding on
> replies is at https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> 
> Once the zeroth task is understood, you can now move on to the first task:
> 
> First, download the kernel git repository and compile the kernel with
> the x86-defconfig build configuration.
> 
> There is a file called MAINTAINERS in the root directory of the git
> repository. Read the introduction at the beginning of the MAINTAINERS
> file and understand the content in the file and its organisation.
> 
> Explain in your words: What is stored in the MAINTAINERS file?
> 
> Now, search for specific MAINTAINER entries; Please answer: Who are
> the maintainers and reviewers of the following sections?
> 
> DVB_USB_GL861 MEDIA DRIVER
> FREESCALE USB PHY DRIVER
> HYPERBUS SUPPORT
> I2C-TINY-USB DRIVER
> IMON SOUNDGRAPH USB IR RECEIVER
> INTEL PRO/WIRELESS 2100, 2200BG, 2915ABG NETWORK CONNECTION SUPPORT
> NVM EXPRESS DRIVER
> PS3VRAM DRIVER
> PWM FAN DRIVER
> UNSORTED BLOCK IMAGES (UBI)
> 
> Please let us know about your answers and always send your responses
> to the linux-kernel-mentees mailing list. After that first exercise,
> exercises 2 and 3 will follow.
> 
> 
> Best regards,
> 
> Lukas
> 

Greetings,

I've compiled the mainline kernel using defconfig.

------------------------------------------------------------------------------

**What's stored in the MAINTAINERS file?**

The MAINTAINERS file contains the information for patch submitter
and the rules to be followed by them. There are basically 7 tips to be 
followed.
The first two tips cover the testing of a patch and getting it reviewed by
people.
The next two cover the compilation of changes made by the developer and make
them available for testing purpose.
The fifth tip is one of the important where a submitter need to check the
formatting style for the code using script ``checkpatch.pl`` & get the
maintainer for the patch using script ``get_maintainer.pl``.
The inclusion of Sign is must.
The next two tips contains the authority of a patch and
sending it to related maintainer.

Next are the descriptions assigned to section entries which are used further
for providing the information about the Maintainer, Reviewer, Status, 
SCM and so on.
eg. M:	Maintainers
     R:	Reviewers

------------------------------------------------------------------------------

**Below is the list for the Maintainers & Reviewers.**

DVB_USB_GL861 MEDIA DRIVER
M:	Antti Palosaari <crope@iki.fi>

FREESCALE USB PHY DRIVER
M:	Ran Wang <ran.wang_1@nxp.com>

HYPERBUS SUPPORT
M:	Vignesh Raghavendra <vigneshr@ti.com>

I2C-TINY-USB DRIVER
M:	Till Harbaum <till@harbaum.org>

IMON SOUNDGRAPH USB IR RECEIVER
M:	Sean Young <sean@mess.org>

INTEL PRO/WIRELESS 2100, 2200BG, 2915ABG NETWORK CONNECTION SUPPORT
M:	Stanislav Yakovlev <stas.yakovlev@gmail.com>

NVM EXPRESS DRIVER
M:	Keith Busch <kbusch@kernel.org>
M:	Jens Axboe <axboe@fb.com>
M:	Christoph Hellwig <hch@lst.de>
M:	Sagi Grimberg <sagi@grimberg.me>

PS3VRAM DRIVER
M:	Jim Paris <jim@jtan.com>
M:	Geoff Levand <geoff@infradead.org>

PWM FAN DRIVER
M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

UNSORTED BLOCK IMAGES (UBI)
M:	Richard Weinberger <richard@nod.at>

-------------------------------------------------------------------------------


Regards,

Piyush T.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
