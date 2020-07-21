Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_05,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2904EC433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 14:31:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEB3A20714
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 14:31:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rv7teYKT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEB3A20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CDA5A21537;
	Tue, 21 Jul 2020 14:31:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5FXmjhgCGXau; Tue, 21 Jul 2020 14:31:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3C34B2045A;
	Tue, 21 Jul 2020 14:31:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 366DEC089F;
	Tue, 21 Jul 2020 14:31:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3703FC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 14:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 259EC886EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 14:31:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4M14KHY4szMz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 14:31:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CED78886ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 14:31:38 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id k5so1763426pjg.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 07:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eoQ/LwxD/ih1GkSzZAuNDCG4MFgTBugN1T3/2DGPiZs=;
 b=rv7teYKT4HHE+hRheeUMz7kFEVy/2FYAFPFyJ6DTsr8qA90Sqj/xBO5qcgaUtnUDvi
 Rv86a654zaXEffQPbUFs1rZrshA+3BvCOkRCRN6YaF79kELJMnzI9mUXYbM5lgmnIM08
 ZyWJt7Ifd1VkkXyHhuAuwnJLoLekleV3w0m/Utq2eDVXteX3AV3usu5pIldXV44peA4v
 VaOuEuwXpmVMYve1kLJP4NHz7dzIShIqiqtgke+77R9j3jxIZREMsqM6IP4PHhtMTBe5
 JQajMLneYsAzcaPCAB1ZE9Yp7dgj/n2hn88z3PP4KOIzR1ISSADxFb090PuzQjyk6wdb
 kSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eoQ/LwxD/ih1GkSzZAuNDCG4MFgTBugN1T3/2DGPiZs=;
 b=ZxdhrdVjcx09hS1m/G0qg2AxpuLsBjnXr27SLz7YxIGoJ57atikse2zAqwE+lnV+2A
 8VtSYdxYrEYfp8Iputh3DMIFVKeLDTJgN2ekZta1D9/yUEgOP8hQzb10gUdfTzGns6BP
 VW6CJ0uPX3UETVLxmc+bgkTWiQn3G9soTEkIUiWAhVVcFAOoGX6itdao0SQUGPy9nSM5
 yB5/1qoQIGalPOF3g4TENo9wEDtV4sxqWxjyRCVO/Ec+mGaPK0qyx9CSY76CAUEsId/8
 DTsC8TVwATIF/d9uYym4zM++nkXnWl3s19v0Rl6GK0RqBxf5hK7g5ELU2+pi3XqN8iaz
 fa6w==
X-Gm-Message-State: AOAM531DLRVgAyFCPeVwndSh93Py6i9kcYqCS6YUFMkwjQWf+uwD/QbW
 YjJmrUOv7MA9dkhcBJerrbY=
X-Google-Smtp-Source: ABdhPJyyVBc9dQXHdc+5lLNWNkeC/7Y3foGXFsBMmQ+uwmlFrHQSa2Q6C+IdC0ODHYc721agO4tx5g==
X-Received: by 2002:a17:90b:1a8d:: with SMTP id
 ng13mr4045580pjb.24.1595341898367; 
 Tue, 21 Jul 2020 07:31:38 -0700 (PDT)
Received: from gmail.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id u26sm18940457pgo.71.2020.07.21.07.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 07:31:37 -0700 (PDT)
Date: Tue, 21 Jul 2020 20:00:16 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>
Message-ID: <20200721143016.GA304517@gmail.com>
References: <20200721142423.304231-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721142423.304231-1-vaibhavgupta40@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] mptfusion: use generic power
	management
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

This patch is compile-tested only.

--Vaibhav Gupta
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
