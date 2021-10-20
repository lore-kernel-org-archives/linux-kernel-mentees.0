Return-Path: <SRS0=auPP=PI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A3EC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Oct 2021 13:41:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3C9761052
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Oct 2021 13:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3C9761052
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAB2D401B1;
	Wed, 20 Oct 2021 13:41:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id puF7MGQuICIF; Wed, 20 Oct 2021 13:41:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 675E5400B9;
	Wed, 20 Oct 2021 13:41:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F04DC000F;
	Wed, 20 Oct 2021 13:41:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 211B7C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 13:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 161E84074A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 13:41:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZFoRLKtAqJac
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 13:41:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71D7240749
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 13:41:33 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id r6so9708779oiw.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 06:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R+f9jX4gENJ9ZTepD8KkqshKnHoLg5Qaf4KS0HjJ+5g=;
 b=M+WK8u+FQ6jzQ1/WmPdBzOcf0tBxs3eFt+njo97mrpehPyqPxDSx0rlIfXYUOdZfeB
 WqQRFmt0A7/H3Qa014wGW/Zvwt29j95peru2g/oMNfiOimiqUL1KaZNWmPA4P8+z9tn0
 ms45zo2ipFEMgpgz1Fa3vEM2bZtyym37au0OfWVgDpaQNNc1SFZg7ENde3rxfx/zd+mI
 Hf1Mq8AyOJSQbIe1ttAyu8KC4a772Lm9Ok0yJt6aNrrtZ6OTAHdhvJwHn+aoQv8DdRhI
 MTSu/T5sujlqqqpdz0UkghProvCycd5XAYoaqXi/tMEvCF+9EE/I9j2OiWJRPIYPNibE
 jwzQ==
X-Gm-Message-State: AOAM533Rm3q41u1h97u8nYmm5PX4MzyrF91i64tFm8ogU7NTS1pxLiaM
 2YEMNLU8Y/RR/Y1ygDHtkQ==
X-Google-Smtp-Source: ABdhPJwUOSFqTpPy8Y5D71BOVCigV0itLv+Rj8nhwBqumAIK22KTKiHdOIOhP6DCgvowuCfdDs2saw==
X-Received: by 2002:a05:6808:2389:: with SMTP id
 bp9mr9574873oib.140.1634737292382; 
 Wed, 20 Oct 2021 06:41:32 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s18sm465022otd.55.2021.10.20.06.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 06:41:31 -0700 (PDT)
Received: (nullmailer pid 2247038 invoked by uid 1000);
 Wed, 20 Oct 2021 13:41:30 -0000
Date: Wed, 20 Oct 2021 08:41:30 -0500
From: Rob Herring <robh@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH v2 02/24] PCI: Set error response in config access
 defines when ops->read() fails
Message-ID: <YXAciic84q49qoZm@robh.at.kernel.org>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
 <b913b4966938b7cad8c049dc34093e6c4b2fae68.1634306198.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b913b4966938b7cad8c049dc34093e6c4b2fae68.1634306198.git.naveennaidu479@gmail.com>
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

On Fri, Oct 15, 2021 at 07:58:17PM +0530, Naveen Naidu wrote:
> Make PCI_OP_READ and PCI_USER_READ_CONFIG set the data value with error
> response (~0), when the PCI device read by a host controller fails.
> 
> This ensures that the controller drivers no longer need to fabricate
> (~0) value when they detect error. It also  gurantees that the error
> response (~0) is always set when the controller drivers fails to read a
> config register from a device.
> 
> This makes error response fabrication consistent and helps in removal of
> a lot of repeated code.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> ---
>  drivers/pci/access.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
