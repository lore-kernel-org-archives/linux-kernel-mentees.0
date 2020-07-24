Return-Path: <SRS0=SEG9=BD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_05,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD02BC433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jul 2020 11:12:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D2022073E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jul 2020 11:12:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+AfoPnU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D2022073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7EE3988852;
	Fri, 24 Jul 2020 11:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ecVd0Zy0N7I; Fri, 24 Jul 2020 11:12:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2BA3188809;
	Fri, 24 Jul 2020 11:12:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11343C004D;
	Fri, 24 Jul 2020 11:12:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F812C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 11:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 752D185F19
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 11:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYOHdRm7T_Ni
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 11:12:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1A72D85EB4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 11:12:41 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id 207so4932603pfu.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 04:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eoQ/LwxD/ih1GkSzZAuNDCG4MFgTBugN1T3/2DGPiZs=;
 b=F+AfoPnUNB9t0KWm2nR//O678xJDpStefDxH/hAmjz0Fe8DSeYnEOVlz3NKIIBrVqt
 Nc3NYWGFVrJG0EgCOBmq0BcGdEOuPvewh0cdOhDVmjVArklGwPRI1H322uaEY5ZYBKTi
 S53Jo4E2403XmtftrBksW1SYnZImRWtxquqolTne9TIneBEIFsq9i/t+A/Jkp9sMTBlP
 sHPtkOi814EF4hsoFgW/tOnIg0bGiinP1xlPQvXKzslX9vl4u2B8KGevjKTVlf5HgM1w
 OFhCGA0472DLyUK0eadpyaYO/4DC4x9wgIYj7CFQzEB5ItH5TlMvZ6smIi9ZuSZHrs3k
 ug1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eoQ/LwxD/ih1GkSzZAuNDCG4MFgTBugN1T3/2DGPiZs=;
 b=DtdpaexSPy+UFUaOJnmz2P+/DFxZKX/6QfR8XWADixjXgVhmzj0vfbJhej4K5nXLkr
 xYT/LB+xOpmDz5EiymYcJb6nZ4F3xo02Ikbrnj9njRo4F/FUbHBCbLqnMj8duvH32yaq
 WVdzFTcQBL/Pee3j2n3nzynuHAqVqsgvxVacO+GOVbF3DYcLCAt8b7OaxMNrZAMw/mxj
 ftM3mOCy8ijjcexeiLGztAn5rYBHDBoMfBqrkhuI8QV9Y42GIo4sunnq3L98KI9y5y6/
 GEPChN/RELgo4QLrema/98WT9UBsewYdj5UjHZ/w4ccd/9F6fMU4Ws32k/C1uGn+39m5
 aNQA==
X-Gm-Message-State: AOAM533SUuPfQ2jFt9bIrd6BLLaB/Cn5AwKHEkGRZGJ25q4x9YOM7o+r
 GDxI12uccbYvog0JSZFdKyc=
X-Google-Smtp-Source: ABdhPJx3fJ5NMur2QabrYd8SbuDPn+ucw/Y2KQhW0ZjSvTZ4CKF894JI3odsrwCaY4K3YJtHsNHdhQ==
X-Received: by 2002:a62:1610:: with SMTP id 16mr8430154pfw.113.1595589160574; 
 Fri, 24 Jul 2020 04:12:40 -0700 (PDT)
Received: from gmail.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id n137sm5979404pfd.194.2020.07.24.04.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 04:12:39 -0700 (PDT)
Date: Fri, 24 Jul 2020 16:41:18 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <20200724110923.GA1175768@gmail.com>
References: <20200724110630.1219882-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724110630.1219882-1-vaibhavgupta40@gmail.com>
Cc: linux-ide@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] ata: use generic power
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
