Return-Path: <SRS0=YKtx=CQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6002C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 06:54:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C63C21556
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 06:54:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giFPadgM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C63C21556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9CE1920345;
	Mon,  7 Sep 2020 06:54:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id itT8xKakUudM; Mon,  7 Sep 2020 06:54:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EEBB920110;
	Mon,  7 Sep 2020 06:54:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7B4BC0859;
	Mon,  7 Sep 2020 06:54:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17BC3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 06:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0524D8665B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 06:54:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oUfvyZs-Mdf5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 06:54:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9943686658
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 06:54:35 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id a9so3035767pjg.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 06 Sep 2020 23:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=o8g2x95/5vs9teUbA+OBdLU6ARSUU/ROuR8WWiVtU9g=;
 b=giFPadgMBYboBptsHg38rbJuFrrSa7hN5l2ZasV3JrETKlbNfqoiI2M4BTiL2/4FVl
 t3qr7tzlSXXzCyyJsCkoLasYAE3/mzHasPjNxASmT9ih5kqapZ/bSe6VPffuIpgbmsF5
 8RLannbfcmiIlYYl2nofuISkLnCX4o3PsRokxpCnfQ+W4dFG61HezklWqfwprkIg1/1s
 4qRbLkgZQfltAoPatGT7rTyb1r2rSvEVHDfa2B+3Q9+IjKULub2rgKNeVoHN1X2I08ar
 96TLIn4xcZJjfdVYsFtvVYOnU1hVeZjMGVg2+JLviy47EF62nGac8hkwDVuo+yIxQZB9
 Vj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o8g2x95/5vs9teUbA+OBdLU6ARSUU/ROuR8WWiVtU9g=;
 b=D3R+dfHYpC2+4DSrhuT2aslkCytx2VJ5dczYECu5h4vKE99+qn2vdp4uWITK5anchm
 6CWoWpgemTMA3IMC0wbD70Upg/ujYR7Hxn/MbUtPNBeYK/VGcfAw1UQRHlpOWrzeGdpI
 pClWHLpyYPqXXLYB3j3qJmYhPbaqQdMWjPaIi2ejF7eacHtbzCcrrHlX9tn/RGHRfoFb
 s2ydppIzzHuFL+sQ1IqBuQ5KmEL0LFYes/RjHKaX7IIWt5b2WeGrAmF7q2+FfE15IC/d
 o5zERmbPqsjnlWgYwDLe4o3SVI+WSbljRmKtWw1upyDq5TND9QY9krc8GaksbM2Hya2v
 j4tQ==
X-Gm-Message-State: AOAM530bvTq5C/INIlgU6JwhGiisw8WTr2ff6nzKwHZ5HIAjogvDyBCL
 LFJEHgQuQh0Pm7CPF1vbesA=
X-Google-Smtp-Source: ABdhPJw55OcWofC6teQbiKEAY1os2nE0Xo3rrdLivdlVHahC5JQQHN2ViUEJwrnGbmArWTFuwtnBlg==
X-Received: by 2002:a17:90a:5283:: with SMTP id
 w3mr19683479pjh.201.1599461675200; 
 Sun, 06 Sep 2020 23:54:35 -0700 (PDT)
Received: from gmail.com ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id q3sm14114254pfb.201.2020.09.06.23.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 23:54:34 -0700 (PDT)
Date: Mon, 7 Sep 2020 12:22:16 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20200907065139.GA29423@gmail.com>
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
 <20200806072658.592444-1-vaibhavgupta40@gmail.com>
 <20200806072658.592444-2-vaibhavgupta40@gmail.com>
 <20200907063347.GB29062@gmail.com>
 <20200907064810.GB284261@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907064810.GB284261@kroah.com>
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thierry Reding <treding@nvidia.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Mon, Sep 07, 2020 at 08:48:10AM +0200, Greg KH wrote:
> On Mon, Sep 07, 2020 at 12:03:47PM +0530, Vaibhav Gupta wrote:
> > 
> 
> Why did you send empty emails out?
> 
> greg k-h
I was trying to re-ping the patches. Guess it went empty. I will send patches
again.

Vaibhav
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
