Return-Path: <SRS0=kzO3=EA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E804C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 18:26:35 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DECE421707
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 18:26:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKB7skNq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DECE421707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8B27B85C62;
	Sun, 25 Oct 2020 18:26:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pgyBj9q_R2f2; Sun, 25 Oct 2020 18:26:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1F18185C92;
	Sun, 25 Oct 2020 18:26:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00B42C0893;
	Sun, 25 Oct 2020 18:26:34 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13B40C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 18:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F2652867F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 18:26:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nFyDE2FwLc05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 18:26:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 67809867F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 18:26:32 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id w191so8281370oif.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 11:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x67Xs7cDC5M+fx38P4s5d7Yp9lo5OaAtAzZ3xPA+vSk=;
 b=eKB7skNqyjyJU+VyjQrlo5csNL4bvCx+guk+76Np1XRpkZsRRcGWOz721Najlt1EnL
 lD9Y+AGjldgTY/nJN0merC1WDL/fZRIoZpdcQ4H2CBMqSkUVALs7KxUKz9EIyFQ1H1/t
 dSWCs1SxwlJ5rhibzF/8PcqFllLCGuTX7arAt9ebfyS5JZx4DnydR8fptMF8X1Tt2HFP
 s2lM56dnboWfODq1h1mcoAlZ1cFPv+SqKnPIJApF/qnk7/22OXRG+qSe+otOXBpY6qZQ
 m98lMm4yNOJdmtzQRMcFq/SJexdj9pd5woYQlZpUgcjIOdtgB52aDPtqSXhpkRnQQtWm
 Kcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x67Xs7cDC5M+fx38P4s5d7Yp9lo5OaAtAzZ3xPA+vSk=;
 b=Pu3oYHYYAjQNbBlFMsrdiJBUTv7YR8btFy2PXwF7bACM5ApWFhs1fi0062JKwHchEL
 Sn/mLP7HIhFDwtS0CcpR/JeTuN5MO/QsQPZBOWaW+bBvL2aCMCRds/qNhr3q2ZMC1bAG
 cVERBUx/u9D6Kcv2QqadHzPA+jSc+oYcIwwdE6DUqcPIA4zkJ/uQTqn/W3vqRnPfoxWt
 5kkvMP896jewL9vmpiqm8mEPwPjt2bXYmmyPEsVQxz8rq3dmhmC50mW5095okE0mHjCY
 r+O+/mtmODu4kDmm7hQUMgb2po3fU+ac0ycUtLANAo9nfy7PgeNyPRzAqUZvIg2QF2mW
 WhRQ==
X-Gm-Message-State: AOAM530t/meuxbHCTJBL8CgVND5RkItJH+djrQEdiLGVzbKCZI3Ont+k
 Dk/zlqfTjC7PWVo647nG8QPVQGRi/STBptXhaJk=
X-Google-Smtp-Source: ABdhPJzdDeF2zVZrUT1wnh+ZYhv+2rWkXggi+FrhntvzAl7wqTjMWOi/91Q36prlwieQ3A/vRrBugPEp7R6ALOt+TeA=
X-Received: by 2002:aca:420a:: with SMTP id p10mr8296719oia.117.1603650391544; 
 Sun, 25 Oct 2020 11:26:31 -0700 (PDT)
MIME-Version: 1.0
References: <20201025101537.59133-1-dwaipayanray1@gmail.com>
 <52f88d0bb938c5063ede693a05bf64961af5a496.camel@perches.com>
 <CABJPP5Cec7jKfaygRaxm-z5gzhg-7cBX1GP46NRQDM6rfhg3Ww@mail.gmail.com>
 <6c1c62cd8ac119a6d8a84f262f11eb509ba0e7cc.camel@perches.com>
In-Reply-To: <6c1c62cd8ac119a6d8a84f262f11eb509ba0e7cc.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 25 Oct 2020 23:56:00 +0530
Message-ID: <CABJPP5Cc9H5w57qko372iU4t+_if2cp1TbOfTNRd9zt7bGDW5w@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v5] checkpatch: extend attributes
	check to handle more patterns
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

On Sun, Oct 25, 2020 at 11:49 PM Joe Perches <joe@perches.com> wrote:
>
> On Sun, 2020-10-25 at 23:40 +0530, Dwaipayan Ray wrote:
> > On Sun, Oct 25, 2020 at 11:29 PM Joe Perches <joe@perches.com> wrote:
> []
> > > Using $rawline would also change comments and that seems wrong.
> > > Any reason to use $rawline instead of $line?
> > Yes I used $line initially but changed it because quoted
> > strings were being replaced.
> >
> > Like:
> > __attribute__((__section__("_ftrace_events")))
>
> Right thanks, that's a very sensible tradeoff to reduce code complexity.
>

Okay. Do you see anything else that I should cover in the next
iteration?

If there is no other problem, I will do the space addition one and
resend it to you.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
