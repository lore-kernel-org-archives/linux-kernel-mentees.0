Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C0EC433EB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 17:41:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F0B320719
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 17:41:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cq6woHmU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F0B320719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 61AFE8676A;
	Mon, 27 Jul 2020 17:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id goB79pZNHCEh; Mon, 27 Jul 2020 17:41:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F3B3186072;
	Mon, 27 Jul 2020 17:41:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC9B6C0050;
	Mon, 27 Jul 2020 17:41:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 941ADC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 17:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 82DAC86072
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 17:41:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mjCk5WctsUXc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 17:41:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 18CFE85FC4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 17:41:37 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id 72so8469202ple.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 10:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1TfTR8Lp7hRKQ+lCxjn1lE5hq4Qzl/G7eGSS/NXpthA=;
 b=Cq6woHmUEFsyeHVigdpNgaWCeD86WWgw582JKS8rCuPZybUNqZht+GutR4QWkIv2Rj
 9YF0xezN/AKwW3gE7MsWbAdbBZWZqmsUTVQSWSxzE645sU1PlnnFcMrZUDSuCQh3oVaz
 YN7MtpJ1T+LTcenKvw8P7BhQ9kwwN0t6NnrOs0ph5RxPS+XY3I/mtt0HAUbR5a6K08XD
 GRUQaxnNqm7BNdiun9d7MkxmLN1w2m6YVitUFpuxMmiRSrsUsNquGHotkyIIF8x1mQfM
 1xv0j1DbNWQbwg4ML0p2K8SN7KufMNTaCpj0MmLmDOY5FOvC9ZsMd6wI113SGHMx2WZp
 rXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1TfTR8Lp7hRKQ+lCxjn1lE5hq4Qzl/G7eGSS/NXpthA=;
 b=mO8AskdQGvo6tQP1G4UZhvJpNOEC0L0+UfdqAtB9K5S1TK3hT50tKpBHMrDit+9eso
 eRgHp3o7yQWH8rlaAXmAFk7fJTFhGans4QJEaQ0C3shY+QkGeK8wOyi2qxGngF7NvzM8
 /g7G/GyXTXsJTP2D0BYz4FoI6cqg88+hFV79FOreUDSkucaeDufBcs1L/7RpRpY01SSs
 p86OuPxaSTvxX0vxN/dX/9HKSdNr71b7UZUX/rGtp9sZDSLHztBhm0zut6wtp6DMUNRN
 NhpUp9frvFWz4XCV+L56pi81y1vTNwmMrhRHpGklsJ+82itEoS93NQ/4dO0t1EDewLcf
 XTDQ==
X-Gm-Message-State: AOAM530jr1BS+jiFk3d0RAoW6h0ZagxSh/lk0+fVhms67/5romZHVUwr
 deYmW9SBF2j+yS65tmgsG20=
X-Google-Smtp-Source: ABdhPJw3h5ONincj8TGVAAY/7gRJt2JrJiVZpSVpdEaIygpNKh6GppIm6ej3Djgn6lbXyudPGEncFg==
X-Received: by 2002:a17:90b:2083:: with SMTP id
 hb3mr381357pjb.234.1595871696690; 
 Mon, 27 Jul 2020 10:41:36 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id s194sm5470283pfc.187.2020.07.27.10.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 10:41:36 -0700 (PDT)
Date: Mon, 27 Jul 2020 23:10:12 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <20200727174012.GA696265@gmail.com>
References: <20200727173923.694872-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727173923.694872-1-vaibhavgupta40@gmail.com>
Cc: linux-ide@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] ata: use generic power
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

The patch is compile-tested only.

Thanks
Vaibhav Gupta
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
