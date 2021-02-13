Return-Path: <SRS0=TF4G=HP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE40C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 13 Feb 2021 08:46:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 904A264DE0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 13 Feb 2021 08:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 904A264DE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5D70187674;
	Sat, 13 Feb 2021 08:46:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gtBPulf3FC5i; Sat, 13 Feb 2021 08:46:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E692387676;
	Sat, 13 Feb 2021 08:46:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5EACC0174;
	Sat, 13 Feb 2021 08:46:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 566A1C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 08:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3D3F887676
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 08:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S-NSgT4L-zec
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 08:46:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DB27987674
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 08:46:40 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id v30so2859198lfq.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 00:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O1Ue8ikiW7FqJfE93hccywoD0pd3A9l7rHLkBTkCWxo=;
 b=ouyc0mWlcTqC0jufaWbRQFxs/6PpwaqNhf4e3jDL3vgnTmVcS02mSue5H1FWGkJjSr
 xKHy0eJvYqIQbY2UQKOrD699LQhGNXdpCWqEh27Kvu3sAcK/zjp5CooCMOYRX4Zr6oTu
 xSa72MoLMOO5eFatcHj0/aLyHV8+dx0u0bLWKOL30ZMqaYsluzzHGB6w2/vcHs+dcVvH
 5i4j50vl8IQ0c07H/D8uNij48pCJsI+k71EpezV1vKvmC/LgAfggzDX76uhaM8C/QmWH
 A6iyl7XTsu8bS048bhx6knmuFgUY1wiR/zE7Tk8G002acEsj7jCSl8yZO2tMHIXjQDes
 Qj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O1Ue8ikiW7FqJfE93hccywoD0pd3A9l7rHLkBTkCWxo=;
 b=FMx218KGE/TGvTA0/Y7WVxZhgjpvlEYkvTMssqqAll15tfm0ecQ04tdbQ+cnNEfDm3
 VY23pjb1Gq0VmqscVSFvzHD0Sxa8f0WZkBkXnQ5AkST2pT6E3xrlmn6BFMXjZkmuXGY2
 /VlUxkkcFfiVd5zL3ThDCFkPapp7CWMiYUjCz3fDWygvBfUx0KqGvifbRvacH/2OrcLI
 acAcFICvnmG9WgEOFq/jp6q/5rNAvf/4arqLjhpWZNfpAAOPKCsBRPuGXRSlK+iI6ikv
 9LRI+YrHv+hbAsKKvt6TAmgeMk/zHSt/tHVTe8C0XWU5+Q9FlrtdTxThIK7DalPnrMa6
 dmIQ==
X-Gm-Message-State: AOAM5331jU2UaRzr0/9sCmkl0GAkhD+76SRqEMtQH7V2Liipd00Zwzaa
 OfAKi53bEx2sLK/jN8f2VHejzRka6l91L/kOZIw=
X-Google-Smtp-Source: ABdhPJzViUcu4OGFQTf0K7X+k9RqsjM5xtFRfpg3thbdmzro/TCDPoAGRJm9dIoDwY4k+k4feghoW/7ZB7J/e2xDvwk=
X-Received: by 2002:a05:6512:358d:: with SMTP id
 m13mr3699203lfr.238.1613205999053; 
 Sat, 13 Feb 2021 00:46:39 -0800 (PST)
MIME-Version: 1.0
References: <CABJPP5APW9xEXO-gTnY99gUJH9+Mza0kxhHA-b7eEjBGQmu69w@mail.gmail.com>
 <CAKXUXMz5KEJ=R4yBXGKN-ELSi=gXg7paKrKmqWjtrp_-Uo90iQ@mail.gmail.com>
In-Reply-To: <CAKXUXMz5KEJ=R4yBXGKN-ELSi=gXg7paKrKmqWjtrp_-Uo90iQ@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 13 Feb 2021 14:16:41 +0530
Message-ID: <CABJPP5DL5FpaJ5D_FyX=EU4QvHpTe=dH0FrFjRUFxoWEvh=Sgw@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: Re: [Linux-kernel-mentees] checkpatch docs: quick update
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

On Sat, Feb 13, 2021 at 1:10 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
>
>
> On Fr., 12. Feb. 2021 at 22:48, Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>>
>> Hi,
>> Uptil today, a total of 31 checkpatch types have been documented.
>> How many more do you think should be done before sending it
>> out again?
>
>
>
> Please always CC linux-kernel-mentees.
>
Oh sure! I thought it would be better as a personal mail.

> Let us send out a RFC v2 with what you created to Joe, linux-doc and lkml.
>
> I am still in strong favor to go through the rules and document them by "priority", e.g., by occurance they showed up on the last 100,000 commits.
>
> No need to delete the current documentation, just one thought on how to continue.

Yes I think that too. For the rest of the stuff right now, I will try
getting the most common
message types in first and then continue with the rest.

Thanks,
Dwaipayan.
>
> Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
