Return-Path: <SRS0=R4Bt=FA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6ED1C56202
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Nov 2020 10:07:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28078208CA
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Nov 2020 10:07:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uQnZjFOp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28078208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9108C8729E;
	Thu, 26 Nov 2020 10:07:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iCEllpyCBtZQ; Thu, 26 Nov 2020 10:07:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 39F6787290;
	Thu, 26 Nov 2020 10:07:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 266C5C163C;
	Thu, 26 Nov 2020 10:07:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21CB0C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 10:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 136662E1FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 10:07:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 32oZeI8Tuad2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 10:07:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 745112038D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 10:07:46 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id r24so1683104lfm.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 02:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ylhPJJrbKgxt7IlB8En9SV5QznW8kVBj5h+69UcvDEU=;
 b=uQnZjFOp4XUee3bKBE2tE358epdx2rH1s72FGqvofnWPIlm4haeNhegqHnUftXXFpW
 WOtXyHtlF8b5ppPn1XePixkXqlu+IQKisMea3fdMMJ9OV9+hKPGGDJi9alGQskmLKcRK
 KVrtpkqJclYoEWpM2qtbbOWZbUN7EI2B7ONRaqtOs+F8wgHNQVEBJBDEjvGiDaUWt+wV
 +2ISQyT1/WIPd11JIC81ruUXU/Q4EM4+DF2zZbZC+0KzEsisiWpzm6qr3AyjGnA1OxaC
 1AZUo4lcicmYo5hq5U7R2HRWvPwMLCEEOddR4amzyNqj4s9sVpcoU+7/CjvUzLfySLo+
 8YeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ylhPJJrbKgxt7IlB8En9SV5QznW8kVBj5h+69UcvDEU=;
 b=BbNefqVJff0dcFWLvGjlzM2bnYt3EhAtc4T061QeaVDKQdw7xJ9GohwBHpOvlZT2wt
 WX+bpBHMHoEKVNuXURnIUGsxMIxxobQM1KRQR+M5yahwkjriVutICxZ+sgMvsqZ3PEhH
 ZqU3kplcrov16WmHl8y92XZStCymou6hfWsF6z3Vq2HnLVauO+Kyq8Xx2iNvrjLcl9CC
 WWcbfMe1SMhfSf19foHYI2GO5Cyj96399+zvH3LFlgoSZIyirWttnrcqFK1E6vG/8DlY
 HLtrsp3EYPQmIn3l74QMcogsFhSTakr8ved0N1b0IMHqIQvBVQSjOQuTleZLOv8f/hW7
 thrQ==
X-Gm-Message-State: AOAM530VEGTx9sr1qn+e+dN8LPf1ACVTHhPomnH33xzUe2RHkEDhFHEy
 17NCpyr6jrs5zI7mbY6IsaWrpI7j8DW2CfBxtuI=
X-Google-Smtp-Source: ABdhPJwwDZZZeKNAO9uFXxtDSUz/qq25CjYzs6VRxhtoPFqEE+QOTP7oj/4sW6APj4M/0e5pvc2yXAH9gjs3Q6hnqYQ=
X-Received: by 2002:ac2:4199:: with SMTP id z25mr1049252lfh.148.1606385264290; 
 Thu, 26 Nov 2020 02:07:44 -0800 (PST)
MIME-Version: 1.0
References: <20201126094727.43265-1-dwaipayanray1@gmail.com>
 <CAKXUXMwR4UsPgFKh7V=CioYOJJe7Gr9VzDcvqpdc_ikOzKkt4w@mail.gmail.com>
In-Reply-To: <CAKXUXMwR4UsPgFKh7V=CioYOJJe7Gr9VzDcvqpdc_ikOzKkt4w@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 26 Nov 2020 15:37:15 +0530
Message-ID: <CABJPP5BiCrKPjQUJ9gVmQ8qq2h5uFcR+LRxFXO=01i=Mv4jXcg@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yepeilin.cs@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: fix
	TYPO_SPELLING check for words with apostrophe
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

On Thu, Nov 26, 2020 at 3:30 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Thu, Nov 26, 2020 at 10:47 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > checkpatch reports a false warning for some words containing an
> > apostrophe.
> >
> > A false positive is "doesn't". Occurrence of the word causes
> > checkpatch to emit the following warning:
> >
> > "WARNING: 'doesn'' may be misspelled - perhaps 'doesn't'?"
> >
> > Check if any word character is present after the word boundary
> > in such cases. If present, it means a subpart of the word has
> > been matched and a warning should not be emitted.
> >
> > Reported-by: Peilin Ye <yepeilin.cs@gmail.com>
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
>
> Looks good to me; I am wondering if it is useful to point out to
> rewrite this to "does not" because commit messages are "formal
> content", and not so much spoken language.
>

Yes, that's right. But I guess we could give the authors some freedom
to choose their language style. Personally for me this kind of WARNING
would be annoying. I think a CHECK might be possible, but don't know
if we would be over restricting authors then.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
