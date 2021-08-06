Return-Path: <SRS0=Fc4Z=M5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BCFC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 20:04:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60C0A60F22
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 20:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 60C0A60F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22EE460AD2;
	Fri,  6 Aug 2021 20:04:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GjD52UEZCEY8; Fri,  6 Aug 2021 20:04:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3AE6160AE5;
	Fri,  6 Aug 2021 20:04:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 120ABC0010;
	Fri,  6 Aug 2021 20:04:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FD81C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 20:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 436F283C03
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 20:04:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vwPsX63ysf59
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 20:04:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EB6683ACC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 20:04:06 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id m193so17218067ybf.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Aug 2021 13:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cLdsiardbmVSAemq4KQ6EUO6jsKY/myT6EzGc6UA1T8=;
 b=f3huFbNHx66KBYRZJxwwacphIpNAGmb+6EWRbzChLD6AiOy8zW8Fa3nzaaIs5SOMAg
 z+6xtyY6lJorvS1qPRQ48995rgRz0s1tafaclENlo2Cen0zqcA07l1T/10JK47Nx8U+P
 U6uxmgG/DCPlyl/QtYTXbMkJ7zx30XLZgvX+kEzX+AnSxByt7wUptRfeaEVW9ECQWx3x
 xxPbq1i9hKb1zhGxJ8fuxRjxmYCRNHAHmZtle2jXERU6DVX8OpKk+xDovi6wMlEK49UL
 IAZYiy9RmHNbhmfeQtZMnE2W8HW3HmZs4WQr5nI8PX+48PGf3dhX/sBD7IPwtJZvWMgV
 kGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cLdsiardbmVSAemq4KQ6EUO6jsKY/myT6EzGc6UA1T8=;
 b=ixEWzpDWuoQingXipNezdD605ZSXNK5+KmznDA4fAL6GyLfXvQvpMVAj+WI03iyWyd
 tZYPAtU//7fI03ylgGt0iPpUYkr9lqlEXn4ufGyjwOi4OdFXFt3gsGCrJMJNbFeo0W/O
 zCPfSrXTbmsWj1hjGo3AVHqbcus/odxgLZPeBLln4qL5hemi9TOuZ82RaF3E4uSoQ8WB
 sqe3g6Lrjaz4ySalwKG47ku+uCwN4J8FtkrMLKklRjZ4HxC8akxJzw4CKNHMFICBemTn
 lOMBeDBhcDYmIcqEX/cZqVUTouVDNpG+vQwL1+KQYO74wFj+NhTzE9TQXwFDr9CHdmGa
 rG5w==
X-Gm-Message-State: AOAM5331GG8gniyaQzO7D603rO2OBHAAsnxjJWdH57jlbk9gMjkLbT3L
 T48FNcHP3gX5uTg9OfOJPkAzeqqXbi2wtWAoD6I=
X-Google-Smtp-Source: ABdhPJwx/xWUyW4jV2R69+qiqqmoSlU2cPGcOm58nuK330Y3d7PE8TN+y59uc/mqpEg+JCbIGe4spLPY03Tzcp5n5lY=
X-Received: by 2002:a25:505:: with SMTP id 5mr15308930ybf.157.1628280245486;
 Fri, 06 Aug 2021 13:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5Ba4D40OKVDk4RopcX5zx3SFWvOBKLOCfhc1gjw4-4JMA@mail.gmail.com>
 <20210804153134.2794-1-utkarshverma294@gmail.com>
 <CABJPP5C42kH19aMt6dtK0auypE0HWen4YWMZDdC1xgVdFOGc-w@mail.gmail.com>
 <20210806134617.GA6736@uver-laptop>
 <CABJPP5BCdB7CdV4q9vw7tz=8ZOWry+aoyiqpzoXqriY2-ONEhw@mail.gmail.com>
In-Reply-To: <CABJPP5BCdB7CdV4q9vw7tz=8ZOWry+aoyiqpzoXqriY2-ONEhw@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 6 Aug 2021 22:03:54 +0200
Message-ID: <CAKXUXMxf0GTJsJp6Ut6NVUSF8YxY3gTiwiFSsh8s6rNcRrxYkg@mail.gmail.com>
Subject: Re: [PATCH v3] Documentation: checkpatch: Add SYMBOLIC_PERMS message
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
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

On Fri, Aug 6, 2021 at 9:56 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> On Fri, Aug 6, 2021 at 7:16 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
> >
> > On Thu, Aug 05, 2021 at 07:21:50PM +0530, Dwaipayan Ray wrote:
> > > On Wed, Aug 4, 2021 at 9:02 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
> > > >
> > > > Add a new message type SYMBOLIC_PERMS under the 'Permissions'
> > > > subsection. Checkpatch documentation that recommends the user to use
> > >
> > > Did you mean: Checkpatch recommends the user to use octal
> > > permission bits...?
> > >
> >
> > No.
> > This patch adds documentation that explains to the user why octal
> > permission should be used. So in the commit description, which explains
> > my patch I wrote, "Checkpatch documentation that recommends the user ...."
> >
> > If it's sounding vague, then should I change the commit description to:
> >
> > "Add a new message type SYMBOLIC_PERMS under the 'Permissions'
> >  subsection. Users should use octal permission bits instead of their
> >  symbolic macro names."
> >
>
> I think it reads better that way. Please make the change.
>

I think even better would be something like:

Explain to the reader why to use octal permission bits instead of
their symbolic macro names.

instead of "Users should use octal permission bits instead of their
symbolic macro names."

... and then actually have the documentation explain why (Linus and
the rest of the community believes) octal permission bits are better
than the symbolic macro names.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
