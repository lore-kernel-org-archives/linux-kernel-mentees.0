Return-Path: <SRS0=Fc4Z=M5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37538C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 19:56:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBCBE61050
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 19:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBCBE61050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83B8540373;
	Fri,  6 Aug 2021 19:56:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I4OsdM-l9Hy6; Fri,  6 Aug 2021 19:56:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 66A56403A9;
	Fri,  6 Aug 2021 19:56:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 37E7BC0010;
	Fri,  6 Aug 2021 19:56:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4BCBC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 19:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FFB3607DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 19:56:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xVoZeWzk2y2L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 19:56:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA5E3607CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 19:56:50 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id bq29so20139102lfb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Aug 2021 12:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ML3Ovw7rkwIeKQGASRMQTPjBqTK6FHK2AqQi2n9iRg=;
 b=o1NT+5+9SVUdSsBizld5D2mDBUYrGsSgrHlRN/Pusicnq/LlDkQmoJpSVQLeJER4cX
 RnLLVeQ7UFhVQ1n9gcIFig89+LELX6O/Ojo5RK3HgXgGvSIYvP6exEH9pNTU4qD3RwCq
 QF4UwILd41GFF89pPFgx3HHb8MKRaoXt59IAbWruLClYzZfPv81mYYYnObqXpuHU3Wz+
 6D0PLhDOFxDaEDIou1dG4nE8B40i5+JD3qk8wXmq8tnuBDWH5A1sAiKxhEkSkvEWIlCP
 Ro2iGxaWVMnio4rZukwNpSh7rqD0XloJTdFcqk3vidcv0rxuiihaL5XvHD3fp7SEjfyn
 UJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ML3Ovw7rkwIeKQGASRMQTPjBqTK6FHK2AqQi2n9iRg=;
 b=hRNmKqdquTyOSKvqbpVwypTO+m9wFZWx3wkUVflzmWqVb214uEer+zX7J+R//8FWMK
 FbRB3wmjmUESN12+fYNCv7hFS2SPVtCFocFQCedyxRpCG0pExNKhASVVrXKddc1048+k
 yetCSbftLud+hh3XwDV7qG0RElVbtX8lIy0wrKLaAHhyPlgVFQZFD1fzcFRk/wSuxfJ7
 Z6glzw7OlFt+5IpE+UL+xeRnuM6hGXzzzapsqQCN9MC1j4T/cFhXV6AhDAnwGfhwAp/6
 LbAjwLU4wsXWYafM7gh/tih9W+3/DZ+RVPLpp4XhhUzi32hhBAC8bz8u1n9ZG7vqttXt
 SMxg==
X-Gm-Message-State: AOAM532iFUFWRTj1d81X1Q9sQxH/Z2f4J8DKOyokY7DFVeek3FmSVwI7
 kcv0rhDXfx5ECpjDlm6Lvq+lkAFL8NvQL9XH9Fc=
X-Google-Smtp-Source: ABdhPJzcU8Q+H2OXzq3JdRiHvLU2LnqlKEARpBDMW1JatQYd5nvAYAUmG3BX5oGfMhsP4l3e1MfdpioZSkUB2AeRRGA=
X-Received: by 2002:a05:6512:ac3:: with SMTP id
 n3mr9247801lfu.433.1628279808469; 
 Fri, 06 Aug 2021 12:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5Ba4D40OKVDk4RopcX5zx3SFWvOBKLOCfhc1gjw4-4JMA@mail.gmail.com>
 <20210804153134.2794-1-utkarshverma294@gmail.com>
 <CABJPP5C42kH19aMt6dtK0auypE0HWen4YWMZDdC1xgVdFOGc-w@mail.gmail.com>
 <20210806134617.GA6736@uver-laptop>
In-Reply-To: <20210806134617.GA6736@uver-laptop>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 7 Aug 2021 01:26:36 +0530
Message-ID: <CABJPP5BCdB7CdV4q9vw7tz=8ZOWry+aoyiqpzoXqriY2-ONEhw@mail.gmail.com>
Subject: Re: [PATCH v3] Documentation: checkpatch: Add SYMBOLIC_PERMS message
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

On Fri, Aug 6, 2021 at 7:16 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
>
> On Thu, Aug 05, 2021 at 07:21:50PM +0530, Dwaipayan Ray wrote:
> > On Wed, Aug 4, 2021 at 9:02 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
> > >
> > > Add a new message type SYMBOLIC_PERMS under the 'Permissions'
> > > subsection. Checkpatch documentation that recommends the user to use
> >
> > Did you mean: Checkpatch recommends the user to use octal
> > permission bits...?
> >
>
> No.
> This patch adds documentation that explains to the user why octal
> permission should be used. So in the commit description, which explains
> my patch I wrote, "Checkpatch documentation that recommends the user ...."
>
> If it's sounding vague, then should I change the commit description to:
>
> "Add a new message type SYMBOLIC_PERMS under the 'Permissions'
>  subsection. Users should use octal permission bits instead of their
>  symbolic macro names."
>

I think it reads better that way. Please make the change.

Cheers,
Dwaipayan
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
