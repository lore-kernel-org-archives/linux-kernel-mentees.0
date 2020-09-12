Return-Path: <SRS0=2/a+=CV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D264C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 12:32:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4212208E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 12:32:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pfPvb1Tk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4212208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A7DA086E1B;
	Sat, 12 Sep 2020 12:32:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GtGD6Wdk2FSj; Sat, 12 Sep 2020 12:32:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 02EEA86C90;
	Sat, 12 Sep 2020 12:32:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CED48C0859;
	Sat, 12 Sep 2020 12:32:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DB99C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 12:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 36B3087635
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 12:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rFau47tR8Aen
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 12:32:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2C10787630
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 12:32:48 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id z23so16944558ejr.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 05:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=C7V2qyEVUeWMdsU8sGzsIP7DKUOPeUSw3cFCK714ojo=;
 b=pfPvb1TksuVlkDFv8EPtPpR9UKuwqmZZJnX7T1kLFj7MblMCjfer9GMNCGLpstzBEe
 DFqv5BJkB6hBgsr/gfMymTkIpeEYPfPc13LD0zwHv9pC5TOKBL9rDIJlRrlo/t22PmIk
 8pCCuqxfjo3AhZnMEg6Zae4ybdgZAp6xASFxIAYt+PVlsCVdMz5JeJLDlH4LkxdJWoUF
 ipeEAw1faVL411BdKFdQ+xPw+OyFSb3ABBNot2YDyfQpdt0yEw+H75pl9SXYuKc1RfcR
 iK+VnSZWq2Wi76wLP557gD56e4kBkEH1Pb+oI33Eayr7cac9sp+it4lY2qBFV2JTtnkn
 R6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=C7V2qyEVUeWMdsU8sGzsIP7DKUOPeUSw3cFCK714ojo=;
 b=ewPtVmGnqqIwvcUhFzDBHMVJYkTFiLKprlkG624CzUWowpQvV/xqUJHpmneI8sscdT
 ly95JP4lnaz4FdWHN/ZpDi//oxkRu6Mg1BDjXu0sFmAkvkfn3VD2ph8sDEUA2QIM7RZX
 3fDfp2iDekvR2mYomRzFLwlO7lnEby9aaUzQRmQsy6yEbq6W/i4O4rQYkiVOe3Bo8nj0
 z6UxRFEet+9FVwneZy8eXGM35j9eYZKfBbyHHEL9jcYIuUToEBDbtbICY/y580oZWk2b
 A+3sZePtgq3UjniEgWvKzyhST8mdhGygnLOp3Ev+0T41rNw+NR1fXV2U49rNNjI4gi+2
 MPqw==
X-Gm-Message-State: AOAM531Q/tNAm8Iz6nfCpWExb8FwDiht40TG9NwiFKccRLWZte8d+mDe
 46nFbCKbX+KCV/yeON5qJlk=
X-Google-Smtp-Source: ABdhPJwPqDIN5XJFy2Fm8tsl9pQfyj7uzLCf3ngkNulVn13rRO5zmdN507QqMBH2TeB8MztGaggiLw==
X-Received: by 2002:a17:906:e24f:: with SMTP id
 gq15mr5901279ejb.395.1599913966518; 
 Sat, 12 Sep 2020 05:32:46 -0700 (PDT)
Received: from felia ([2001:16b8:2dd9:a000:782a:45ff:c1e1:cfe9])
 by smtp.gmail.com with ESMTPSA id q13sm4561473edr.27.2020.09.12.05.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 05:32:46 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sat, 12 Sep 2020 14:32:45 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
In-Reply-To: <23226f28-dcc4-dba3-dac9-636464d37b03@gmail.com>
Message-ID: <alpine.DEB.2.21.2009121422520.3770@felia>
References: <6a2bdeea-265b-5cd0-78c2-aa865b0d5bb7@gmail.com>
 <alpine.DEB.2.21.2009121343290.13082@felia>
 <23226f28-dcc4-dba3-dac9-636464d37b03@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Evaluate and Improve checkpatch: tasks
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

On Sat, 12 Sep 2020, Ujjwal Kumar wrote:

> On 12/09/20 5:14 pm, Lukas Bulwahn wrote:
> > 
> > 
> > On Sat, 12 Sep 2020, Ujjwal Kumar wrote:
> > 
> >> Hello Lukas,
> >>
> >> I attempted the tasks.
> >>
> >> Below is the link of GitHub repository containing my write-up and findings.
> >> https://github.com/Ujjwal0501/lkmp-checkpatch
> >>
> > 
> > Thanks, it shows 404. Good luck next time.
> 
> I'm really sorry for the noise. The link is active now.

Okay, scripts and data looks sound. So, let us try those scripts.

Please have a look at this patch:

https://lore.kernel.org/linux-kernel-mentees/20200912094826.150170-1-ayush@disroot.org/

The author states:

This issue was discovered through a thorough analysis of checkpatch.pl
errors and warnings of type GIT_COMMIT_ID on commits between v5.7 and
v5.8.

Before applying this patch, checkpatch.pl reported 342 errors of type
GIT_COMMIT_ID. After applying patch, errors reduced to 284.


If your scripts work, you should be able to confirm the statement.

The tasks are:

1. Run your scripts and create a full statistics of all error types with
their according count for v5.7..v5.8.

2. Apply the patch with git am.

3. Run your scripts again and create a new statistics.

4. Compare before and after

5. Make all results available on your github repository.

---

Ujjwal, I can see that your evaluation shows

272 ERROR:GIT_COMMIT_ID

different from what the author reports. Maybe you apply the patch and 
check the difference for your evaluation first.

Afterwards, you might want to reach out to the author, cc this mailing 
list and check the difference of the configurations for the evaluation.

Then you can confirm the other evaluation as well.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
