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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5688BC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 18:28:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA9AD2072C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 18:28:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQlIIpfr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA9AD2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 83B9F872E9;
	Mon, 12 Oct 2020 18:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qQPw9FOxzNoC; Mon, 12 Oct 2020 18:28:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0539C872E7;
	Mon, 12 Oct 2020 18:28:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01D32C0052;
	Mon, 12 Oct 2020 18:28:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D66CCC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 18:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C3058872DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 18:28:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mLR0kZ1rmogy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 18:28:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 30C0C872E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 18:28:33 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id q202so9323353iod.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 11:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KqHSRFHNpGSmshvnnCOW/SKUKVpqFKYaqskjt8Ofsx0=;
 b=IQlIIpfrt59PsFnvIhLBvdUNROfpBf8UVne/2eDAAUxmpbkSW6PVWtQGP7lbpFoutr
 LgUPX+FctMjnvPAR7VrmPNkY3nXc1AdBZn94BFLY6h0VAhZdG/O6eWF0CXFv8UUDWQMm
 nEeLgVNiLj5ByxEiSlZDaudZppFfqrXuuYsJGRHLXfa0tc0+0ajxjw3bf7/em+WEmeBX
 iF1kPVjY8NWYrpt2fVftmkoUlZzprfQ/9EJ4OWHYcZwyrnSdlEVi3FmMXdvr7/9SC6z6
 KsX6LWLuvRV1JnEm2tsgG+WdFHXpFyuo+KG8Ni+MWcfWjfRY80z46WreC2LZlOe7IVAL
 1ZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KqHSRFHNpGSmshvnnCOW/SKUKVpqFKYaqskjt8Ofsx0=;
 b=o9n8pwx7ex2eJDjVFwrZ3Os/XoyhpiXArGMZce3MH2ts4S4Gk+8KItNUsWSeJU42aR
 QN41TXXd9siCoFlImIV7YEsO/NqjCYUTUL6XVzXv3pV9Sq7qZF5rnGWAQvq3DWZ8CXL7
 IzE5HSXQe1HD0k7y9WKBUDEy7uX3EfJghtIS2kVNJkq2RxgxooZjEdmxDjEMtVcTUT7Q
 kWrj/1CGQqNXNGn68dYI5m313P5TY5mkxBzURR+tSrR0imCBGQHTaaBBc3ndvVF9WICm
 PQtGSAap8uv7xfWwvTGOQQuMM1AM4Cl/wwRq545EJA7n1Xt9SVOUVlFeK7qi8xHa2Mao
 LCEw==
X-Gm-Message-State: AOAM532dmC/JD302LEOyXdx6AMZqF5+lw7LjFlWJadF5B6DEXXbB1D6V
 Tm3Ds/qrnjDCZyBgmNTSTR0PFcuuV/P2leSEa9s=
X-Google-Smtp-Source: ABdhPJwZhNl9ELCHYbYnFimJ8fDvAHIityVTb2T2W4+sYUKEa4qIiCtuBOxMnNI3HzWGuxcSyQzSaMvnp4EuyN7rvZc=
X-Received: by 2002:a5d:8e12:: with SMTP id e18mr16099499iod.99.1602527312453; 
 Mon, 12 Oct 2020 11:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ7RK2spHzFJxAqkm+N=T4ZB8-SeqgCX+Bs5r5__eLJRbovL3w@mail.gmail.com>
 <CAKXUXMxyTdNSK0gR4FMkp29TrYX_G2Hwqor4UY2cWk45POyocQ@mail.gmail.com>
 <a1675970-9eb9-bd6a-31ff-d04f88ca30e2@gmail.com>
In-Reply-To: <a1675970-9eb9-bd6a-31ff-d04f88ca30e2@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 12 Oct 2020 20:28:21 +0200
Message-ID: <CAKXUXMy6AawtRNB6B3pPQK_QNT+NK1VT9QUBKQ4YGV-QbAkvBA@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Aditya Srivastava <yashsri421@gmail.com>
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

On Mon, Oct 12, 2020 at 8:23 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
>
> On 12/10/20 6:27 pm, Lukas Bulwahn wrote:
> > On Mon, Oct 12, 2020 at 11:38 AM Aditya Srivastava <yashsri421@gmail.com> wrote:
> >> Dear Sir/Ma'am
> >> I have performed some tasks on Checkpatch.pl to find out the aggregate and summary of Errors and Warnings that have been generated on certain Linux Kernel Versions' commits . The summary of my tasks are as follows:
> >> 1. Task1: Create a list of all non-merge commits that were added in the version v5.8 but were not there in v5.7. Run checkpatch.pl script on these commits and create a statistical summary of findings.
> >> My findings: https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task1/reports/aggregate_report/analysis/summary.txt
> >> My Scripts for this task: https://github.com/AdityaSrivast/kernel-tasks/tree/master/Task1
> >>
> >> 2. Task2: Test what are errors and warnings by checkpatch.pl reports on v5.6..v5.8. Generate a report with respect to changes suggested by Dwaipayan Ray (https://lore.kernel.org/linux-kernel-mentees/20201007192029.551744-1-dwaipayanray1@gmail.com/), to present the differences in a suitable aggregated form, to find out the kind of errors and warnings that are changing.
> >>
> >> My Findings:
> >> Change in the number of warnings and errors: https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/summary_relative.txt
> >>
> >> Individual summary report generated by checkpatch.pl:
> >> After the commit: https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/after_commit/summary_after_commit.txt
> >>
> >> Before the commit: https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/before_commit/summary_before_commit.txt
> >>
> >> Scripts used for this task: https://github.com/AdityaSrivast/kernel-tasks/tree/master/Task2
> >>
> > Your email client is broken; you cannot send emails to a kernel
> > mailing list with this email setup. I will not bother to use a proper
> > email client either :)
> >
> > summary at
> >
> > https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/summary_relative.txt
> >
> > looks good.
> >
> > Dwaipayan probably needs to look into the details here.
> >
> > E.g., why did those really unrelated issues change?
> >
> > AVOID_BUG 240 239
> > TYPO_SPELLING 536 537
>
> Ya, this shouldn't happen.
>
> I checked the reports, and the new warnings appear as expected.
>
> Could Aditya perhaps find out which errors in this case have changed?
>

Dwaipayan, you can ask Aditya directly :)

Aditya, can you help us and tell us which AVOID_BUG remained the same,
which appeared, and which disappeared?

And the same for TYPO_SPELLING.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
