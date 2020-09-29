Return-Path: <SRS0=644b=DG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A49B1C4727F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 09:31:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02420221F0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 09:31:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjgPLYvo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02420221F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3636820555;
	Tue, 29 Sep 2020 09:31:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c78VlrELuLr7; Tue, 29 Sep 2020 09:31:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A8D1D204A3;
	Tue, 29 Sep 2020 09:31:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9BA91C0890;
	Tue, 29 Sep 2020 09:31:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E8E3C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 09:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0491C870B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 09:31:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JgR0v0c1DxER
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 09:31:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 58BA1870AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 09:31:03 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id f11so1936185qvw.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 02:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding:content-disposition;
 bh=e88ooWjiQOpOfrYhw/usNSInJRrerniRy68mBsluY5w=;
 b=JjgPLYvoltS6sWy/za2uzHaIBNrud4/BS3Vm5QhKYWCqbJ2P8aKmDxi8vfFhkDQfTF
 +FkXDgTjMH18dFRZL86qG9+rJNnJTf4mT5gC84OYcwfzAY+noRkiCfKaMQlVXA0wshV3
 leGYCH1JktWA9+SXmIO+R3C2ZcBVDACW5esf560eO4jHisN7mN35DrKdzrNI2jL4++gx
 zE9PVioRz2DFPqsVI8hlZEwNkKIs6g9+myvmQrA8oktzdzNLfLjf1J6JB2kQI7iZauKZ
 QQ6JJVSrZiDySo1nDfd/0aIhzClTiDiSMjwTv44Zl7riuUmCPwe7OkfrI9aLhDWJTJc0
 n8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=e88ooWjiQOpOfrYhw/usNSInJRrerniRy68mBsluY5w=;
 b=RB6DUJ3i5RAyQ5hAZzWebYw3LEfkx1BtDnL2e/7/gaNhE70/QB6tAtfqh9/Y3/2fZT
 /DDQeN+UKjyaXzpa4nhE30cgVBhpxGZDilfujZSNjoFH8pw5UqfWGpCwtq/EuABzqjUa
 t7TDkJ/8Cq3/IpypKoeRLixCX9hc6rudi3UeTEvtzOfyQ8vgTUe4uOEde0JOzJXUo9yZ
 Ivoer1Y0dl7JBxdCZkFrMnEIYK5Tgf4Yzks/kqJBwVy+2baoS/6hXGRz6vrq6NL4cW10
 fm3+gACJAERatn5D513lxxKc0pKKHxAUPJU7k8qcOqQUYkvtXLtujhhgMjYBlpkkYE9S
 0XqA==
X-Gm-Message-State: AOAM533hdWPC7hJsLPYsDHxCah2VJWA5tew1iBoa6f+EqTPJcMCm2ovw
 dZ0mV8kKrxaVMOb0s7SLoQg=
X-Google-Smtp-Source: ABdhPJx1Pqc440fd2iRFZdbR3F2yN1SfkCsG1CB522H21jDXh8P3Q31UfvawAyYM3uhxIbGbq8onMA==
X-Received: by 2002:a0c:b396:: with SMTP id t22mr3662524qve.13.1601371862291; 
 Tue, 29 Sep 2020 02:31:02 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id u23sm4167715qka.43.2020.09.29.02.30.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Sep 2020 02:31:01 -0700 (PDT)
Date: Tue, 29 Sep 2020 06:30:56 -0300
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <8397580E-7905-4B02-B9F5-C3B09794A742@getmailspring.com>
In-Reply-To: <20200929071918.15c018ac@coco.lan>
References: <20200929071918.15c018ac@coco.lan>
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Disposition: inline
Cc: "=?utf-8?Q?r.verdejo=40samsung.com?=" <r.verdejo@samsung.com>,
 "=?utf-8?Q?linux-kernel=40vger.kernel.org?="
 <linux-kernel@vger.kernel.org>,
 "=?utf-8?Q?nicolas=40ndufresne.ca?=" <nicolas@ndufresne.ca>,
 "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?="
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "=?utf-8?Q?linux-media=40vger.kernel.org?=" <linux-media@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH WIP 1/6] media: vidtv: extract
 the initial CRC value to into a #define
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

Hi Mauro!

> Next time, please add a patch 0, specially when you tag something as
> WIP, or RFC.

Sorry about that :)

These are almost good but I came across some weird kasan output.

Can you test this series in a kernel with kasan instrumentation turned on?

Should apply just fine on top of your latest changes in mchehab-experimental/vidtv

-- thanks
-- Daniel




_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
