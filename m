Return-Path: <SRS0=YKtx=CQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE7BC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 06:36:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BCEF215A4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 06:36:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbHCaOCT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BCEF215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 00B2086519;
	Mon,  7 Sep 2020 06:36:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ih6w1tNiVBUK; Mon,  7 Sep 2020 06:36:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D7AA784F5A;
	Mon,  7 Sep 2020 06:36:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C69B1C0859;
	Mon,  7 Sep 2020 06:36:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39D52C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 06:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 287098702A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 06:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hFXLHjvmkRHx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 06:36:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CE16586FFC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 06:36:13 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id x18so4028537pll.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 06 Sep 2020 23:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=fbHCaOCT73QEitsORT8A7jULECshSkNFsfN0lqxLnv9NqtLuZTNiX299eqFsSn/i0H
 XMaY+57ZpeMCy9gD/sNhsDPGufEugVn3KjnZ+OJuMYTDHy967E6y5zQ+tY8J0ehM58Q9
 okbx0KCZthd774jTBDaqQ82+5V5gM1Qw9yhGYtouHWThA3P7v1+gpX4t/J88Jj7BGNE7
 CbiK2/6h2plBhRy9hZdcNAioNjc4IXErPDRGh/NcyVYimkrJ9ffD/2cJFyHnQ6isZM+T
 OwSW01Va2UNJWrGX5dr3UwV15jtf/OqmS4qGkgKEEVfJaE0e+R2/litSe+ceLyzu9iSY
 zJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=ghnzYa8tsgIWfB42001MBKBMC51m1oBRhnoq8My3+BZ7Xt/HZGeapx5caU6jC5LQzF
 aMTefbug4BHTk+xEoA8A6Tr+wcaT3YiPOy/qCXg1Irjbb2xHuo5gltZjL6rUDQjhEKKc
 IPv/5ZJkigxgY04vqGBQ0eszKGZmh5R2a/nslWVN50H9i4OLhUwg4vL3uGA4laGH77ed
 uXd4+vMGMXGiKoHuoKC3mW8uHDg/SO9kr4aPETvaP4Vc/ppCDMCuRe51uNapiqsR3NXc
 NgBblfdAnMLgdPrgtkc6zrld1K83kGSD9/SsClpMJo194jXqqAzM9xacp6wvUO/bO5hV
 pexg==
X-Gm-Message-State: AOAM532QGfjOzmbtRXPFPCMAIyrScBmHbuVPtRbZvR/E3T+SfeC1eRPo
 FyldWQRUW7WzT6mjhNPFOGI=
X-Google-Smtp-Source: ABdhPJwgx99BRCDhQRZTixm/9uPVMLMpWFBKTUcxE26SgTtzeQ5XhqrvRSSOK6jPTDclOjwHDi/NDw==
X-Received: by 2002:a17:902:a50b:: with SMTP id
 s11mr11590419plq.136.1599460573455; 
 Sun, 06 Sep 2020 23:36:13 -0700 (PDT)
Received: from gmail.com ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id md10sm11631756pjb.45.2020.09.06.23.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 23:36:13 -0700 (PDT)
Date: Mon, 7 Sep 2020 12:04:14 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>
Message-ID: <20200907063414.GC29062@gmail.com>
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
 <20200806072658.592444-1-vaibhavgupta40@gmail.com>
 <20200806072658.592444-3-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200806072658.592444-3-vaibhavgupta40@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1 2/2] fbdev: radeonfb:use
	generic power management
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


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
