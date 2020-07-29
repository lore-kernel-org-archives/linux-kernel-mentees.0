Return-Path: <SRS0=ZpoD=BI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980CFC433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jul 2020 13:22:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F1CA20809
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jul 2020 13:22:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWKI0VB4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F1CA20809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3E07588092;
	Wed, 29 Jul 2020 13:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MUpFDPyyLPUA; Wed, 29 Jul 2020 13:22:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C030C877EC;
	Wed, 29 Jul 2020 13:22:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A16E2C0050;
	Wed, 29 Jul 2020 13:22:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68C2FC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 13:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 580848851D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 13:22:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XZxsEB0w32bk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 13:22:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D303C883C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 13:22:49 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id u10so2294759plr.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 06:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dZVkEmQto56AmO9M+KODR9+FXiNg4THi2B1DDl0qH74=;
 b=RWKI0VB42RHJGqcMkvesW4CLvXoeicTe46yk22J3WanwTaBUL4YtE8IKorU9KiKCNN
 vJyYbYPBBOokZboD5Trd8uT2uAFLLebivVHhMI9pdWYgfa/ZNExmBQZqLPT/MZhfm2eX
 8uRX8wOQqTPALEFZ1e2rCkbcL5HlR3XEGfJC+BVImp39oPZkbPhABKXht8aaOH93iTdB
 zxgjEKDcTx9bV2MXWc0cwek+1catpwycUsTk1AUN294kBGM46lfAgtCYe9ejGQYyVLR6
 ZvCx6XwQehErsZMxDhgDmCECRU4V/QF5yEC8ncrzKpweoK5P/HtJDd8MXfrMiTzUytpC
 Bm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dZVkEmQto56AmO9M+KODR9+FXiNg4THi2B1DDl0qH74=;
 b=fvIJSMNseSwQOxvsRuv8mT0gHOojX/USIpmcQLWwh4QwzO9FqBjCjMFJItqfAT0SfN
 jSYri6kjoeAMCJ4NE7LAntWE/PvCg/aUGBXmHsPHVU/pAUneBurpeW/D5i4CLCKI/7Iy
 6aoFQ74LfrHFCvGzyt+EPPV2A5XaobFOynMlS7bSD7ELk1zee2kmy73dy9fjkMAy+o3x
 V9vfoGKw3rmjjVAsM7CLmathNkJXSvB3nPs6HkPoA7nu64o+PqCOSvd8Uawg6ZS0C1sz
 fgmh/pbQKJH7yvKaV/GwOVCaU2+0Kq0sxLRzutC/MEXp7fKfJZjwabAA0f6q3dFsIF5Q
 J9UA==
X-Gm-Message-State: AOAM5300OeMSl/W8xmrS8lTAICgkizYdjrjwOFqcZbyymOiRCpK24lSx
 9HntVqfPuDhqEH0kdAHiV48=
X-Google-Smtp-Source: ABdhPJxn+Kx8ezIh3hRWCXBEAP2NSusIhx5YhewG4epzxBfAUTrNmzqbreB9W9/ynlMFo9omo1skgQ==
X-Received: by 2002:a17:902:b20a:: with SMTP id
 t10mr26885947plr.185.1596028969400; 
 Wed, 29 Jul 2020 06:22:49 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id r25sm2244428pgv.88.2020.07.29.06.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 06:22:48 -0700 (PDT)
Date: Wed, 29 Jul 2020 18:51:10 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Message-ID: <20200729132110.GA605@gmail.com>
References: <20200729101730.GA215923@gmail.com>
 <20200729122954.GA1920458@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200729122954.GA1920458@bjorn-Precision-5520>
Cc: linux-kernel@vger.kernel.org, Kevin Curtis <kevin.curtis@farsite.co.uk>,
 netdev@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v1] farsync: use generic power
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

On Wed, Jul 29, 2020 at 07:29:54AM -0500, Bjorn Helgaas wrote:
> On Wed, Jul 29, 2020 at 03:47:30PM +0530, Vaibhav Gupta wrote:
> >
> > Agreed. Actually, as their presence only causes PCI core to call
> > pci_legacy_suspend/resume() for them, I thought that after removing
> > the binding from "struct pci_driver", this driver qualifies to be
> > grouped under genric framework, so used "use generic power
> > management" for the heading.
> > 
> > I should have written "remove legacy bindning".
> 
> This removed the *mention* of fst_driver.suspend and fst_driver.resume,
> which is important because we want to eventually remove those members
> completely from struct pci_driver.
> 
> But fst_driver.suspend and fst_driver.resume *exist* before and after
> this patch, and they're initialized to zero before and after this
> patch.
> 
> Since they were zero before, and they're still zero after this patch,
> the PCI core doesn't call pci_legacy_suspend/resume().  This patch
> doesn't change that at all.
>
Got it. Thanks :) 
> > But David has applied the patch, should I send a v2 or fix to update
> > message?
> 
> No, I don't think David updates patches after he's applied them.  But
> if the situation comes up again, you'll know how to describe it :)
> 
Thanks a lot. :D

Vaibhav Gupta
> Bjorn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
