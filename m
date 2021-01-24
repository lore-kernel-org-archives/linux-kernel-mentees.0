Return-Path: <SRS0=cPcG=G3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27784C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jan 2021 15:29:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27AC022DFA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jan 2021 15:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27AC022DFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E177587031;
	Sun, 24 Jan 2021 15:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zoOHcknFfgxl; Sun, 24 Jan 2021 15:29:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5802E87028;
	Sun, 24 Jan 2021 15:29:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4A63CC08A1;
	Sun, 24 Jan 2021 15:29:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C0FAC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 15:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4E23B855BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 15:29:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4KeJdy-3v1vt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 15:29:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C835E85313
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 15:29:25 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id 3so12237053ljc.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 07:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uMOlpJWMp7PfUtiC0d40xFJ5JxEz+YfUuPW46n6RKy0=;
 b=k1rggKJb46IvKC8x9oI+d8T5uPF5EPygM0XaMex20yQXKB2pFtF2BvNDse+6IFDD7C
 RXO13x+2VJe4598NHRRNDweIV4xZzdc/NhJVsZ76UX0+e+SWwGniVooSX/EBRZZ1UNeo
 1bkY0/JDLuSAYF0j7dS+YrTmwityNeLL/0v2LmvRJ5/ECsyVw3R1sA+MbaJlRcSsMhBD
 wmYnX33Y6mSuK7hA+dz7UuonNEhDd30SipHOiTg66Ml3pmUgNsRBZUwimiTL/vY9aQiq
 O97xIPtL2MaVrQG8/imBvgjkZNojELQlSWCl1FQ144YfDDvbBSbeEPaZl5DSRxqfAC/R
 0ZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uMOlpJWMp7PfUtiC0d40xFJ5JxEz+YfUuPW46n6RKy0=;
 b=jo7m6DhWLay+OtlZQSISIi2afdzZqe6soHSWySsvDKevoaR5IQ9QQ/1A+Wd8dDhlmF
 INWfQqIJ5zEFhlfaygACcjPp6nps8mfetTUTuiKnA6YDIxp7CgJ2WXY12Ra+7WKi4Y4Y
 uYmEI/TMCqsLp38N9wVZkkYi7chERKSh/tXPk96+FwVjq7MchVJjGl72HOdCt/2vKC54
 NiJeNbfW0OKVyu7eeA5S08UDIzsAI4LNiN5zuCctR+/X3wqfxe50iCWryyxfAkaDUreX
 gueBjVVMX0rnWMa85TVwfMYsLbpLRQlwwYghoNXZH9gqf29o6p0HG8ARvI2lMHd5mDN6
 3sYQ==
X-Gm-Message-State: AOAM531pXdevqbxfTYau3CVRlDtSMuPmCwV497kR5k+E96a0jojqMTGU
 iaTpAyRu0CR1XrQCKeY8aCk3TWcisjfLKwv5/dI=
X-Google-Smtp-Source: ABdhPJyJ1685v90QjyJTfl27/x5Stj4lSHe6W63JLSx4oXj7wSeWy6JmeL/guDTcDud/L/s2zQQcBPQtqoZFDcIT3J4=
X-Received: by 2002:a2e:b4d1:: with SMTP id r17mr3618ljm.466.1611502163777;
 Sun, 24 Jan 2021 07:29:23 -0800 (PST)
MIME-Version: 1.0
References: <20210124151933.19696-1-dwaipayanray1@gmail.com>
In-Reply-To: <20210124151933.19696-1-dwaipayanray1@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 24 Jan 2021 20:59:19 +0530
Message-ID: <CABJPP5C8U-nmrqggR=Ea3drNF9VxqfisG49sVcNQfufTYejp+g@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC 0/3] docs: add documentation
	for checkpatch
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

On Sun, Jan 24, 2021 at 8:49 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> This patch series serves to introduce a documentation for kernel script
> checkpatch.pl (scripts/checkpatch.pl).
>
> A top level tools directory has been created in docs which shall contain
> the documentation related to the kernel tools and scripts.
>
> This documentation shall be progressively updated by future patches to
> document all the message types in checkpatch. Consecutively this
> documentation itself will be parsed by checkpatch to generate verbose
> messages.
>
> Dwaipayan Ray (3):
>   docs: add documentation for checkpatch
>   docs: add documentation for checkpatch
>   docs: add documentation for checkpatch
>
>  Documentation/index.rst            |  11 ++
>  Documentation/tools/checkpatch.rst | 271 +++++++++++++++++++++++++++++
>  Documentation/tools/index.rst      |  10 ++
>  3 files changed, 292 insertions(+)
>  create mode 100644 Documentation/tools/checkpatch.rst
>  create mode 100644 Documentation/tools/index.rst
>
> --
> 2.30.0
>

Hey Lukas,
This patch series serves to introduce the checkpatch documentation.
A part of this documentation will be used by checkpatch, I am working
on that right now. Subsequently all the message types can be documented
slowly.

The initial plan is to parse the part between
.. CHECKPATCH_START and .. CHECKPATCH_END.

As for the documentation itself, it would be great to have your review on it!
I could send the pdfdocs as well if you need it.

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
