Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F76FC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 12:38:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FD0F20759
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 12:38:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SK9b2UYT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FD0F20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DE6B088289;
	Tue, 28 Jul 2020 12:38:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vIGxa3OsXO+l; Tue, 28 Jul 2020 12:38:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C465087E39;
	Tue, 28 Jul 2020 12:38:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2BAAC0050;
	Tue, 28 Jul 2020 12:38:37 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25733C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2208184B01
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VKQ931sppIWT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:38:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0643684A05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:38:35 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id lw1so2678979pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 05:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Fie8IAXWZ8a1f4IBdyXwUsTRAo2+ebUYgUxfo3SFpeA=;
 b=SK9b2UYTW6naBrk+5Nf+HITJ8jpZ5nTD3wTAGxb37B+Ugb0+FU9daPv5RE6+KoAdKb
 A52m+AH2ReoUyWjImEbPFcuuY2un3gyDWbhZU3Z5HR0JGsEiqA1T1CGa3DXHpqaIo+m5
 Yp/IiDKSzac3d2CIz1SHRkAOmLKJrf3CMXujw+d8OHQk39gqh5ocYCpYCuQkSEEneHAm
 ziS1+TJqLiFpxeDVfdOszutkDUaX3v79cXpqfpA0wIdmevzMmXOzLcHJUYj7r6EU+272
 JN0pGtGHdHUj2KWf+0LVVONbMmeHkrR8KXJzTrvsOILhKNNvPF/rp9yAIBgwpsLanTAP
 6ywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fie8IAXWZ8a1f4IBdyXwUsTRAo2+ebUYgUxfo3SFpeA=;
 b=Fmjl6Sm+/WKbenxx0lR3CvS6IS9pYExvSgrQxf+NbXCDrCfgxmCFMJGZYosCfru/oV
 g9uoxk+rIcbmmcFCh/pCuyCNXMGNx5WRrsMPAj2l9jxkBECbcdhfHeRl8ypvPVPIazwp
 IvDFzpf+mRQH2GoNGaclziNUc06C8Dbu1V8GM9PwKt5xPGgyYn2kWtypO0Lxd84IHJVT
 6TFQCpP9UuxvRZJrrMC/wyFw3J31fp00EdcGhmD5qww+FvHVFEMp5d8RH9bD9L2F379k
 r7WFaFjHBjNQlBDQQBTNKye2u0jz/m43xgfRXyk/PSM01ThtI7WuaCJPDiokhGpv/2Dz
 I1tw==
X-Gm-Message-State: AOAM530ZDKpozDKBANEmUQ7cuMWKn1Ddy7lT7umEg5aT1sop3768Tnaa
 S7YLgWVN8LIp8bPb+AjXBhs=
X-Google-Smtp-Source: ABdhPJwekYhSoj1idJB4yjdyuS66TSlXyc2WtTJj9+6S091YCsU5daM2krAGtIehCsmH7jRufibfUw==
X-Received: by 2002:a17:90b:30d0:: with SMTP id
 hi16mr4452970pjb.65.1595939914561; 
 Tue, 28 Jul 2020 05:38:34 -0700 (PDT)
Received: from gmail.com ([2401:4900:2eef:ca92:3545:4a68:f406:d612])
 by smtp.gmail.com with ESMTPSA id t17sm1684380pgu.30.2020.07.28.05.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 05:38:33 -0700 (PDT)
Date: Tue, 28 Jul 2020 18:07:03 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <20200728123703.GB1331847@gmail.com>
References: <20200728085757.888620-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728085757.888620-1-vaibhavgupta40@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-can@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] pch_can: use generic power
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

Thanks
Vaibhav Gupta
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
