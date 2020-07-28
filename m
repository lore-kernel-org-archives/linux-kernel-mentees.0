Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD74C433EB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 12:42:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 305E420714
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 12:42:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VsACgHGa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 305E420714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0D8BE87E68;
	Tue, 28 Jul 2020 12:42:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G0xc1zRKc8UV; Tue, 28 Jul 2020 12:42:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AA65187E62;
	Tue, 28 Jul 2020 12:42:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A71A2C0050;
	Tue, 28 Jul 2020 12:42:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F4017C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EBF6186CE7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:42:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fTPdcw0mQMMn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:42:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 262D286D72
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:42:17 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id lx9so715800pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 05:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DRtsTZTInfavsTIFBbELheDvvBIHfMEH5f/reZk59Q0=;
 b=VsACgHGa8pTwFHEe1syWIe4FKAAuDH4vnVoh5IoqbSC5nUwGX+Uwymnu4tHUZQwsrg
 bAUSnlzdkSW1sWtFnErCgmnmuba31mLHaRENDFAmwESavec5sZ6aXXDiPQtWV0dms3Qw
 Q6oLjws9DZOg+yJdfUgQ2cjLnRA2j3MlRf2F6b7LkeIT2Q4Cvlul7qzhEQmGittF7b5B
 dbl8MFRYjimkCmkd/emKJUjTX6NlzCNZvfzCcgWLADP3f75T77L0o7aD8Wn/zj0MIuXv
 MJiSEJCN/rTE+rQQwOSr7Fls1DQpMboJyFot035vkNVIE7Jm1Eg1ub1D5j0obGepaCW/
 Fsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DRtsTZTInfavsTIFBbELheDvvBIHfMEH5f/reZk59Q0=;
 b=DjnLf0XCzOm7lpTy9Fd2JbgRX7TRwH1WXsZsxzwiMjChVGDkvhkjZgm3RlSb7ZImQP
 fRF8JO4fWfevWqT+UdgIwwjfkypY2H/D8yqJHVghH0gBNeTXmVtLVRfU26jgpobrUnPy
 y4W0VoHzbsB1LCjgPiB2b3c1nP8RdyubC+0DDIsLPe/cgSox8TawdxcqkkugWVy5uKiQ
 ZzyUgzPi5LLDo2G7+/QvDM+5Rl7BCj+mdvxXsgX6LQXlgeeVRq9v3TyTUImwVoTywuV7
 8lYml7+L5JNVaQlLfPfgSQ8QyOSLbUU1n8Tpvz4S/6UeSLHzmgWRjWyNj4XwNTu4APx5
 C46A==
X-Gm-Message-State: AOAM533I0/ZyuCYyAkAlohYBWNHXkOXMMcPSG5sl9PLkMuFiVy+SGQth
 GTuYlAS8dWYkOmUZAjJvIfFBEZDNMiu4tw==
X-Google-Smtp-Source: ABdhPJxhMEpi6j0i+tSqYk9Nj+n0YJ1omG1107kkNFdUcGdH7M56U3YwSdV3MsWTHnQYdBVVu5JhZw==
X-Received: by 2002:a17:90a:4f45:: with SMTP id
 w5mr4365834pjl.11.1595940136736; 
 Tue, 28 Jul 2020 05:42:16 -0700 (PDT)
Received: from gmail.com ([2401:4900:2eef:ca92:3545:4a68:f406:d612])
 by smtp.gmail.com with ESMTPSA id h6sm3371551pjt.53.2020.07.28.05.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 05:42:16 -0700 (PDT)
Date: Tue, 28 Jul 2020 18:10:31 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Teddy Wang <teddy.wang@siliconmotion.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20200728124031.GF1331847@gmail.com>
References: <20200728123349.1331679-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728123349.1331679-1-vaibhavgupta40@gmail.com>
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] staging: sm750fb: use generic
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

This patch is compile-tested only

Thanks
Vaibhav Gupta
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
