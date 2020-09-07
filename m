Return-Path: <SRS0=YKtx=CQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67343C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 06:35:47 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7073206E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 06:35:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lght7Ifr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7073206E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8620220113;
	Mon,  7 Sep 2020 06:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cPSnAR8wvs5q; Mon,  7 Sep 2020 06:35:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C6B812046E;
	Mon,  7 Sep 2020 06:35:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1173C0859;
	Mon,  7 Sep 2020 06:35:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6A65C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 06:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C5B068702A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 06:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CQtsyAtAmzL6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 06:35:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D9FDA86FFC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 06:35:41 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id c3so3766064plz.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 06 Sep 2020 23:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=Lght7Ifr1LpMt8ODv/ddonkYDgzWp8nZkg1/c/SjWJ8F+ZngJs82vf/xcGWrzRvqY7
 ou1W681VqX+F9lu2Xqc0ZpV4i6UUyob9coYjA5tVJMOg07ZWGsDugXBqZBJWuaGCP+BS
 IfGVH9pKNnx82dDz/31NRPQDtBYa2qeQEUGBeXAiBUqJB+6B7fsASnM0vRbJTHMC9Qmj
 Wp5QykCr96OApc0FAUkWbPieinRUqhfSyP017+3ldlThqh0gNqvvYGQzol0Fi6Cm/Sp8
 pdT+pA8htrY9tVfsBb6O2UMBh8LZF5FBkt/j1e/oP9MkvS737M2GOLwfKA0H7Cyfa2f5
 lKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=Csql2GGf7Hqybsf1/iJw88JNtcAwGeMNZEfWYmEUzsNSTLHYzpb2KDfLfnadaFoxTd
 I+D8CEbmRSpKOH66JuKTVgty639IQaTg+WCD76BoLv+MXInAnjRaas0Nwe6kamvoe7op
 i2kq6LSKnxKjGmc9TnnArZcjtOOi4wqRojHtCFCN1usXaOEWobdWsZv9uSpZo6KPeRIL
 GX5BGyuKJAyy8Qh20MlM4RkqbzEzmOu7cF0H0CmVsoIXrAGaxY5PVVjvSxinrKRFXGrF
 tvajMaUTcWb6WLIGRdqyrE1y0QlL0mY7QfDoqEnTDkvVxuj/8Nmf1YSHC5QLvZ36ZwHZ
 ergg==
X-Gm-Message-State: AOAM530RPhvewo/yLRTDkm7BdVk3d6QriqtrwL7gKZkaQowheN9LzmTn
 TCzK5cUMeqb4Xl1m5q5il4w=
X-Google-Smtp-Source: ABdhPJwOD5kJx+DFcApvOWX+p/5e9qXZZ2sVaWifSzXJ6UpEB+RbV7/BqVTOwMBbgqsIz5Cei42hAg==
X-Received: by 2002:a17:902:8c94:: with SMTP id
 t20mr17926553plo.76.1599460541415; 
 Sun, 06 Sep 2020 23:35:41 -0700 (PDT)
Received: from gmail.com ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id y3sm11660330pjg.8.2020.09.06.23.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 23:35:41 -0700 (PDT)
Date: Mon, 7 Sep 2020 12:03:47 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>
Message-ID: <20200907063347.GB29062@gmail.com>
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
 <20200806072658.592444-1-vaibhavgupta40@gmail.com>
 <20200806072658.592444-2-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200806072658.592444-2-vaibhavgupta40@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1 1/2] video: fbdev: aty:
 radeon_pm: remove redundant CONFIG_PM container
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
