Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2825C433EA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 12:40:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AF5920714
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 12:40:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1A4woKQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AF5920714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 481C787938;
	Tue, 28 Jul 2020 12:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bhwYKcS84GZL; Tue, 28 Jul 2020 12:40:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2E6FE86689;
	Tue, 28 Jul 2020 12:40:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1DE08C0050;
	Tue, 28 Jul 2020 12:40:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72CB1C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 61DD08742D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 14PA27msHYNU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:40:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4FD4086689
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:40:25 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id k71so11527915pje.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 05:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Fie8IAXWZ8a1f4IBdyXwUsTRAo2+ebUYgUxfo3SFpeA=;
 b=n1A4woKQkiSxjFUkK2MMPTGX0gyTFj/XulU59DI2cWd/Mcq6RKEgRLaDmie8NCO8h9
 jsPDDRUT3oeNmmNF5siGZwU1IpeJONcINRtQDUF38G+on+DtCrImdXPVJFlJvptSDDkv
 VEwLMz+8Oqf1P5bu8tDQCeY8n2iViYnIA7QZiG0BRfhpSRfanxyAV27/dWBIOsYGXIqd
 G/1NZZ6oa7GHULisQkUENnU+3q86anKc3DyZPvHhUHBBF6AW5qZlOTFL1bVG31JKoifM
 nIgLMXv4ai5zVtC6A24Fk8veg5TwvycMHiO0xixiU+1apvHMT2J5BNNPNHu/TAZ6xng1
 ODgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fie8IAXWZ8a1f4IBdyXwUsTRAo2+ebUYgUxfo3SFpeA=;
 b=pArJ4gbZB7n0IYVaI7mgcdb3uy31NXMdfxkRXH87JYDCPBQwZQO3ZYb2sABGv1kis4
 tpQ6NlopZybmaQUiWzUoL693khUbyJTRu6S5WVGIXAacFekwxH8yv0cXZVzm/qZn6aSl
 yOpIZ0VUuGZRGfgMWasaBbaFDrNVPm2kda6crA+GOsLHXKjIJyVMaXGPcjTNFvcae6SC
 6p8hs6zg8VcS7WK/lzQ+q/S5uCzlgrYp4yg7q4q2LnLzPYDtPla5SEL6mCvkfKIXGLJM
 sgkEoeWxl+7LNWj2HjmvNuuL2zYRNUkjJhe2Y8okNtiKdCFGvdbZFKPTYGPgr61x0Ssd
 L6qA==
X-Gm-Message-State: AOAM532pC/EPe/J42DigimeaBo/5Gn7XaWRmZApsk3vGVlX586J3+4fC
 b5pwNCJUv1vifDQr/6BstU0=
X-Google-Smtp-Source: ABdhPJw8aqJ7SAGLcxLIBXeRhtSyQt1UsMeiXdJoz3QIIdThiUkmDWaY2TmIa0NCvzERhDJ3DPwTRQ==
X-Received: by 2002:a17:902:8204:: with SMTP id
 x4mr24110574pln.16.1595940024900; 
 Tue, 28 Jul 2020 05:40:24 -0700 (PDT)
Received: from gmail.com ([2401:4900:2eef:ca92:3545:4a68:f406:d612])
 by smtp.gmail.com with ESMTPSA id r2sm18220374pfh.106.2020.07.28.05.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 05:40:24 -0700 (PDT)
Date: Tue, 28 Jul 2020 18:08:55 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <20200728123855.GD1331847@gmail.com>
References: <20200728102418.1069512-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728102418.1069512-1-vaibhavgupta40@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] [media] bttv: use generic
	power management
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
