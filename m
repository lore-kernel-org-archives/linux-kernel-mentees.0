Return-Path: <SRS0=3x+R=FW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A94BC4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Dec 2020 16:38:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C92A9208C3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Dec 2020 16:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C92A9208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8047387948;
	Fri, 18 Dec 2020 16:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aQofvKEZAh35; Fri, 18 Dec 2020 16:38:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2667E87944;
	Fri, 18 Dec 2020 16:38:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E70EC1787;
	Fri, 18 Dec 2020 16:38:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3AA35C0893
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Dec 2020 16:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 160D120406
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Dec 2020 16:38:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cwDHL5h0p2ut
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Dec 2020 16:38:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by silver.osuosl.org (Postfix) with ESMTPS id A6E3A20401
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Dec 2020 16:38:20 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id o13so6995838lfr.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Dec 2020 08:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QP/2GjcDbL+eFt9zOJht0QDKBJPolEGP50v+rNvs7tU=;
 b=LVm9pbzlMJoualBWFdjPCZEu9Eh78zYGd7ZSjx6WEIIau8PumNq8EseoH0FDTrHubF
 LrkmM0F8aHPRVryod4HEoxYvtXaSw1IGemdtSJp9ETR4HJYdSU69GKq5795zlWZgaSDl
 1aGsE26l6i7mZdvP2X1jRacC02nVwDuABFM9zrT+TiEGBWQDhU3HKvT6pAM8X455l5v7
 dM4CyAuhnsCyDHVaPYfce6ioTijiKWtEfg10IgRqRHr+WbTFrRUt8qzcSHg1cYjXZ8gX
 LEo/fLaG/GFkNSnphQP8CbBLn+WYu4fYtbxq+Qu6AMyb2kR6WjsNRGe2m9uF6WnRhMhR
 tm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QP/2GjcDbL+eFt9zOJht0QDKBJPolEGP50v+rNvs7tU=;
 b=aI221V2/ScpNDGqXIFXR5Py9mYE57+EAFZIPHyP9RYJubfsCv/qScDrmbtlK92jmAQ
 73UwPbHlIfxR5QFIQzNkA1FcEb3mMz1v3wTiGiSVzZd4ILVrP8tZQPO9ds939WIcSPdb
 UBqhWLqdo/nbWbuSNhvuh4hwBQzTk2DM88TQDCEnkulOizBC6oDaRjgYU9Toxxilz1Y7
 PR0+K7AYqiiPwC3HP3jZdAHoNQu5zcn65Dx9LglKMaiPNJNmjgYEp+BTBn6dhIC/aJId
 PNpXxRGzpyyKPGFvhLXGwtV7WxtqU6IkFNA6fcTVrAycJfs+0HzCcK3a2K+NkH3glxvx
 hrSw==
X-Gm-Message-State: AOAM530+tkDbINLWNsAFP0TkPYCo7i4F9hPhJPw2F2VWH8DPXpKAEFoG
 Rzd699QQcFpDmyLbdSHqo4aEy41pHPDH82h2qEA=
X-Google-Smtp-Source: ABdhPJyMAo9FWtNbXZUMsd8wjw2NRT1kTU9lC3BC1oL9QxE+xSKjc4y3ApwnLqsz0+N2EdHHsPB9tbEwNtlqE32GgtQ=
X-Received: by 2002:ac2:47e7:: with SMTP id b7mr1743678lfp.117.1608309498467; 
 Fri, 18 Dec 2020 08:38:18 -0800 (PST)
MIME-Version: 1.0
References: <20201217195902.67041-1-dwaipayanray1@gmail.com>
 <CABJPP5BcUxzH7KmBXkTLh9V3r40AQQinWdzb-NA_4dDRZDe3MQ@mail.gmail.com>
 <CAKXUXMx9qyBDpYRAZgy_s+wkfAzwYiSVgV_JAcNebNy7XUmW8Q@mail.gmail.com>
In-Reply-To: <CAKXUXMx9qyBDpYRAZgy_s+wkfAzwYiSVgV_JAcNebNy7XUmW8Q@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 18 Dec 2020 22:07:56 +0530
Message-ID: <CABJPP5CUk2_aKLu8ebfKLiCGF=mg2oyajaHCBvgna48t58nyhQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] scripts: mod: cleanup a few
	checkpatch.pl warnings
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

On Fri, Dec 18, 2020 at 9:53 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
>
>
> On Fri, Dec 18, 2020 at 3:36 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>>
>> On Fri, Dec 18, 2020 at 1:29 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>> >
>> > Cleanup some warnings reported by checkpatch.pl to make
>> > the code more in line with the kernel coding style.
>> >
>> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
>> > ---
>> >  scripts/mod/file2alias.c | 156 +++++++++++++++++++++------------------
>> >  1 file changed, 83 insertions(+), 73 deletions(-)
>> >
>>
>> Lukas, If you have no problem with this cleanup patch, could I send it
>> out to the maintainers?
>>
>
> You can do that, but be aware that this might be rejected and maintainers generally dislike these "only code style fixup" patches and might not take them.
>
> I would rather like to see us making some progress on the tool to run clang-format on patches and experiment a bit more with that.
>

Okay sure enough, I will try getting a proper error handled version
of the script ready soon. I think I can try making the script operations
atomic. Like in your case when you had run it, it faulted at some
point and the sub operations after that were essentially useless.
That is something I think that could be fixed along with some style
changes.

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
