Return-Path: <SRS0=j5Lk=GI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA03FC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 08:19:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45F4F22240
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 08:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45F4F22240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B4A3E867D2;
	Tue,  5 Jan 2021 08:19:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r0q7qRFcA2xz; Tue,  5 Jan 2021 08:19:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 55E4F867CF;
	Tue,  5 Jan 2021 08:19:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39EFDC088B;
	Tue,  5 Jan 2021 08:19:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E422C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 70D1D867D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qBA07aDHqAur
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:19:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8CDD6867CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:19:44 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id a12so70670896lfl.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Jan 2021 00:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BlMavcCXYpcFAtAw9u6YAmQf9cbAt0JKfC/kOJ+P2bs=;
 b=AHv5cuJI/oVWzAFb23pogTLs9xEJeDbyR7/gOYxW5rAUa/D1NMuG2+XMbYvx72dGor
 etWVBCwj9OJyL51X7WcIzLznOMMihdQHO8Xt2jDilN4jMuc9wL0EbHlJuE3oV5Jmzf/N
 I/3M7zcU6IpCoWL9/7HTgXXnuPsGHa1tgqyTtbY5tdW4qvkl7u4CY+S3vyUeLR85OCVI
 KBEJuqUZAPZ+4v5VPe7bIxpgHCisV22Mt78QXrcaa/C27PiOHj2yYNiVeEEavHNT+aXe
 hdiuFCDfX9ngTs9elNHMxwwXp466qlY0PscwqDNRf+T3JgLl4+f2jF3AMhMq0DByr9Eh
 ++Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BlMavcCXYpcFAtAw9u6YAmQf9cbAt0JKfC/kOJ+P2bs=;
 b=IvQeLzgr6igJ2pflljMeCzTtPJQMj5fAiyuiw6Y2Iyzqbo7R9SGaYhv5AsFm4wxhPH
 EyTrizF0hr3klNh/QhmuXuf/sbdxMMzzotvJUdT/M/x9hgFOAk6Ji4NtFpgBJ9lbhhXR
 YoBTEsh8KIZVilCOmmV+lIy+piXaK0OrPRUwPDJmtegDkP2Zzr3MR+VTV4JbaR+YmTaX
 pDKqgBSOyjsdzcvbJ+CtBeMKfvLh3im30nqW2wbktb1EVbdYkulFfeNnyOPsfQOKhwYo
 9BDGeaSICwXPsIg4KuBl5crw0amJqwBEYZl2i4Owfpc/YMJEdE9Rf0p7g8G+srIIg81l
 5K8A==
X-Gm-Message-State: AOAM532YptyMjvqdxrVJmU1C4t0tKl8CBXr9DYgrYMd+S01tjrIX6XA0
 QEEGdb60FHlTObX63/NVLwS3Yqd0zbP85dHWXFU=
X-Google-Smtp-Source: ABdhPJwsp8cvC1XCdiW63N491GxVHnYTxMlEouaepSaLGrlzx8Aw/nqXRWWKuhN1l/cUWl9zcfoi2uPDSh9E7YaawwE=
X-Received: by 2002:ac2:4e92:: with SMTP id o18mr31718797lfr.576.1609834782528; 
 Tue, 05 Jan 2021 00:19:42 -0800 (PST)
MIME-Version: 1.0
References: <20210104132536.38016-1-dwaipayanray1@gmail.com>
 <20210104132536.38016-2-dwaipayanray1@gmail.com>
 <CAKXUXMy3XPsfUW80PyQR7KhYL=SOhncgdDzxmgZrOHQnZrfwVw@mail.gmail.com>
In-Reply-To: <CAKXUXMy3XPsfUW80PyQR7KhYL=SOhncgdDzxmgZrOHQnZrfwVw@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 5 Jan 2021 13:49:30 +0530
Message-ID: <CABJPP5Bsny-tZjxDni098erqAr6D_+KpsBU9zBSu234GP5raiw@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add a new check for
	strcpy/strlcpy uses
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

On Tue, Jan 5, 2021 at 1:32 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Mon, Jan 4, 2021 at 2:25 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > strcpy() performs no bounds checking on the destination buffer.
> > This could result in linear overflows beyond the end of the buffer.
> >
> > strlcpy() reads the entire source buffer first. This read
> > may exceed the destination size limit. This can be both inefficient
> > and lead to linear read overflows.
> >
> > The safe replacement to both of these is to use strscpy() instead.
> > Add a new checkpatch warning which alerts the user on finding usage of
> > strcpy() or strlcpy().
> >
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
>
> I remember Joe has already created a patch for that over Christmas
> break; check lkml before sending this.
>
> Other than that, looks good.
>
> Lukas

Yes I found it:
https://lore.kernel.org/lkml/22b393d1790bb268769d0bab7bacf0866dcb0c14.camel@perches.com/

He has converted the uses in code. But I don't think he has created
the checkpatch rule yet. I will try sending it out to him.

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
