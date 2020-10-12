Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DEAR_SOMETHING,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61686C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 12:57:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D69F9206D4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 12:57:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p9urderZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D69F9206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 867C886109;
	Mon, 12 Oct 2020 12:57:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id brOtM4cHdmEq; Mon, 12 Oct 2020 12:57:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EB4C586102;
	Mon, 12 Oct 2020 12:57:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6A2CC07FF;
	Mon, 12 Oct 2020 12:57:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A7A3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 12:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 23AA8207B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 12:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H8+SwjP+HiBQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 12:57:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by silver.osuosl.org (Postfix) with ESMTPS id BEBEE207A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 12:57:49 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id q25so3451822ioh.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 05:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pYwaHHHzt0xp5Hmy0eiruysTLbB7s797mTtCY7lQns4=;
 b=p9urderZoEQJ7+I5OHF3cEB+vArEgDJ1phZxs0Dp1SOTusODH5lrt3TZFMdN6QZYFb
 U0B/5QNx2OYaJye/3nhhMGrtTzA4wL+FAA7/bPcTOKPWqWhLt42FMtuL+629KyRMERcp
 fNLsOZur3dBx3wr1mTTPQaK/6UD20CX/m4Gp6UKLwQviflG8x2Dn+HcE2cNMKfJp5rpK
 W8uZOqRawop9X0G3tnceftUUMR6q7KEafq+ZWqdTnwLOz6zhBW/upI7BgQM+cqAh7Tu5
 ZBNOLlDV9kOP+keEwrCvf+tSgX2GVNOR1e9+MqJHgicv9pTauZbRNccy3Gyt84GPOACN
 YIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pYwaHHHzt0xp5Hmy0eiruysTLbB7s797mTtCY7lQns4=;
 b=qpe+kt5AbP/uR+FGi2SGp7Ncy+a++w5+suT54wXz9p4kzcNgWSBZ6ntl/4pQFX/Tmh
 8VXrDUSlJmqkuxAtdSOeNbLyw5PRUcBukBO72HpTEBTFDgEyueBHQF2SVdnXYqOi2BXv
 paVo1bZgascMkyalCuu9BR6z0uOBLlWMHpjukKoJazP+h3sbj3N7djog+10FD9YR++XS
 WSB1kC+42uQjRRQU+FbgTITLfETbpPhYVZknjZAKZUAFID1NjKYu9H4s5iuyFaA4cFET
 22S2wVE86OjaesNGBbK8lKjiMbVB9Ri0Ua+lpRa60qc4HMzMtmEJu/QDsVFL60qVdmMl
 OmVA==
X-Gm-Message-State: AOAM5318+2iq1IO8aZCmZQcdKVjAXTrFOWnkBTP50FPTL5yWHSEnyhU1
 ELhaSmxrD6KLdntTP2GYzGaLN+I1BHGm3zqe3F4=
X-Google-Smtp-Source: ABdhPJwKjhghzbqUoSmUTnCVpgIlyS0sPFu85zOcI2c5K07qZao3R7Za4P2qtttJbI1y4O0Ywx5uwBims/ru20ArgRk=
X-Received: by 2002:a02:6d61:: with SMTP id e33mr5501103jaf.14.1602507468981; 
 Mon, 12 Oct 2020 05:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ7RK2spHzFJxAqkm+N=T4ZB8-SeqgCX+Bs5r5__eLJRbovL3w@mail.gmail.com>
In-Reply-To: <CAJ7RK2spHzFJxAqkm+N=T4ZB8-SeqgCX+Bs5r5__eLJRbovL3w@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 12 Oct 2020 14:57:33 +0200
Message-ID: <CAKXUXMxyTdNSK0gR4FMkp29TrYX_G2Hwqor4UY2cWk45POyocQ@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Checkpatch.pl tasks for Community Bridge
	Program
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

On Mon, Oct 12, 2020 at 11:38 AM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Dear Sir/Ma'am
> I have performed some tasks on Checkpatch.pl to find out the aggregate and summary of Errors and Warnings that have been generated on certain Linux Kernel Versions' commits . The summary of my tasks are as follows:
> 1. Task1: Create a list of all non-merge commits that were added in the version v5.8 but were not there in v5.7. Run checkpatch.pl script on these commits and create a statistical summary of findings.
> My findings: https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task1/reports/aggregate_report/analysis/summary.txt
> My Scripts for this task: https://github.com/AdityaSrivast/kernel-tasks/tree/master/Task1
>
> 2. Task2: Test what are errors and warnings by checkpatch.pl reports on v5.6..v5.8. Generate a report with respect to changes suggested by Dwaipayan Ray (https://lore.kernel.org/linux-kernel-mentees/20201007192029.551744-1-dwaipayanray1@gmail.com/), to present the differences in a suitable aggregated form, to find out the kind of errors and warnings that are changing.
>
> My Findings:
> Change in the number of warnings and errors: https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/summary_relative.txt
>
> Individual summary report generated by checkpatch.pl:
> After the commit: https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/after_commit/summary_after_commit.txt
>
> Before the commit: https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/before_commit/summary_before_commit.txt
>
> Scripts used for this task: https://github.com/AdityaSrivast/kernel-tasks/tree/master/Task2
>

Your email client is broken; you cannot send emails to a kernel
mailing list with this email setup. I will not bother to use a proper
email client either :)

summary at

https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/summary_relative.txt

looks good.

Dwaipayan probably needs to look into the details here.

E.g., why did those really unrelated issues change?

AVOID_BUG 240 239
TYPO_SPELLING 536 537

Let us see if we can make sense of this evaluation.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
