Return-Path: <SRS0=fjKG=B7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F8AC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 15:39:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAEE92063A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 15:39:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ceCUd4dF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAEE92063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6E09285C92;
	Fri, 21 Aug 2020 15:39:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2gZ8hWfcc5D3; Fri, 21 Aug 2020 15:39:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A230A8113D;
	Fri, 21 Aug 2020 15:39:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91B0CC0889;
	Fri, 21 Aug 2020 15:39:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 214B4C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 15:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1090786A34
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 15:39:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f7PFiUGtowso
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 15:39:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F1759869F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 15:39:07 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id p14so2348385wmg.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 08:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=mPiTCrBSqWya08UcNMy9Znx0rPWnggmgFm53SdtibGs=;
 b=ceCUd4dFnyZgQAarHl2ajjCqQ8xlVH2fcOOBw96H4yTMWj0h2b7ielIFx6up5Tuc5E
 XXlHFb1KIZI0pPvLNUVjhJdASrCG5Z+8hMC0QcKIG+MkzihbMIXlYqWtfhfXilZIERI4
 Wzak+kmudes7FDlFsXGNNffSS2rTG9tJAXciP3+uMrrbQlrvFKveHNXbxSBRqxFGwo6N
 /tc5L1+H9uAYfBO4yOt0LivZPYtvhJbXHZYivk1Durbdw4OcT1778+Wctr2kQBbW5Qwh
 Fyga1nYjfQmpnpUWIh1Z+jNR2WUMA3+nQyOioM96Brun271BDEASAPcHwEzO/U51Aqha
 ZXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=mPiTCrBSqWya08UcNMy9Znx0rPWnggmgFm53SdtibGs=;
 b=suzTlOFk+5MIeKS1Y0WiiehE1J1/rH/ERvFwzRYVse4lrszTrKrgy6qEXxngFUYNV6
 iWshNrxMxrn1CtJlbdOZs7wMy1++zlMrl6g/Ec1AewKjdttD6iqFlekdWwy0+I6jN9i5
 Tp83+XbyqzZQnszwGq2ANonDjAQLGqT2e7yT+gVxS/aZR/uex3PEve/AhKIHHW9gPa+z
 6Rr66E7hopCcXcTkFJMbAd6eAnvUe+thQ9p21oAqWJungcc4wUgE0wby1zIfjbTsMmEV
 gGvbylkSa1euY0mDqIMbWcpIdmnqGbLHDWQomrzm/2N6h9PxX71eqQiZ0Ex9fB9ax1ds
 fx3g==
X-Gm-Message-State: AOAM532IWNVIrhtL8Wu97ALfsmKH5jpKJ01K37lAkv5OI/HnOy+S6CbG
 SYaLQsJEKESsQhKBm7cTb98=
X-Google-Smtp-Source: ABdhPJxc4Iz6bG6Ej6lFcn0fXGH9ZfnH8VoF3ucfsrqQ81ofx6Wc1MtsMviAEJK4+H1skie3/27h6g==
X-Received: by 2002:a7b:c775:: with SMTP id x21mr4272501wmk.47.1598024345462; 
 Fri, 21 Aug 2020 08:39:05 -0700 (PDT)
Received: from felia ([2001:16b8:2d49:ff00:41e8:4c7c:9604:7ed4])
 by smtp.gmail.com with ESMTPSA id x11sm4992810wrl.28.2020.08.21.08.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 08:39:04 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Fri, 21 Aug 2020 17:38:57 +0200 (CEST)
X-X-Sender: lukas@felia
To: Piyush Thange <pthange19@gmail.com>
In-Reply-To: <953524ab-8cee-0c72-7c33-c942a5800104@gmail.com>
Message-ID: <alpine.DEB.2.21.2008211736140.6494@felia>
References: <b842e923-f7b0-e732-7c0e-bdd795d905ae@gmail.com>
 <alpine.DEB.2.21.2008171132050.8645@felia>
 <0e4f5ecc-0708-b64f-288b-a232afc46ac6@gmail.com>
 <alpine.DEB.2.21.2008210921370.27424@felia>
 <953524ab-8cee-0c72-7c33-c942a5800104@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Evaluate and Improve checkpatch
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



On Fri, 21 Aug 2020, Piyush Thange wrote:

> On 21/08/20 12:54 pm, Lukas Bulwahn wrote:
> Hello sir
> > My request below is not addressed yet:
> > 
> > > > Can you run your script on all commits of this list above and record
> > > > all checkpatch.pl reports, and store them in your github repository?
> > > > 
> > > > Can you suggest ideas how to aggregate the findings and create a
> > > > statistics? For example: Which type of error is reported most?
> > 
> > Can you answer the question: Which type of error is reported most on all
> > commits from v5.8?
> > 
> > Lukas
> > 
> Hello sir,
> I've update the files on github. please check if it's correct
> 
> https://github.com/its-crypted/Evaluate-and-Improve-checkpatch.pl/blob/master/README.md
>

You still have not aggregated the data that checkpatch.pl reports, such 
that you can answer the question above.

Let's make it simple for both of us:

If you cannot answer with your next email response, you finished the 
selection process for this mentorship.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
