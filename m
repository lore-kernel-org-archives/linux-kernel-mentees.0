Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26CF3C2788
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jun 2026 08:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781511537; cv=none; b=c/kv/mq5uxx4wag9VlhrV3vgaR/PDaIDKejJ0XXC+SiaDN6H/6NYvcTfBpomhxnb9u6ncpxRzlYq2oPsAVpzWxP6kI/AD1VHLInK9wggLs9mmovz0KTxIRxf07m3dAmOm7C3Zgya5dfrSyYvE/iK/CGJJt85UlmmjoSKHmFh8gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781511537; c=relaxed/simple;
	bh=C6GWuDxvvQ0aygQNHKFgBKGLEGmdldxySmV/5dbAu7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=giaL1xdm5NqMCTuHEt0RVfie1ciHvYtISiP7IeN7qbwB9ZCLcr4dvhBGsFB9RAtgutNpUYyuy/WWAKzipP4AbRIYzGmtvI5pf+kgyMqlaYnFLJjmuM4ZxoFO7nCumB89tEk6XWjK7zHQR32VkF0oG+PuA4292LcnR+0JgwjYMwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Po3sJeHl; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Po3sJeHl"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DB8760DBB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jun 2026 08:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfUmJl_VsEq7 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2026 08:18:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com; envelope-from=error27@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B22F0605B1
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B22F0605B1
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Po3sJeHl
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B22F0605B1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jun 2026 08:18:55 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-517760dc3c2so19576401cf.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jun 2026 01:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781511534; x=1782116334; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fWLdQLm3J2zWM1QA3MmZV2U2D1DL/u5j1Qzgws/RERo=;
        b=Po3sJeHlLtUUBCA3XUcgvuPDcgGs7h4y+SMhWTAelLZpmZfcGzikKFhdz+hZX8hEv1
         jTbAMnym8Y7z0xX4HFZPrJDafzPe+2Oo+8i6tvK41qFrzpwI2WSHiyjrJp67tykwTzG1
         pcG6PDX2jmqJUxqtFBsBitIa/YW59+HHzY7efoMecJcojLJSqijGahnSR/sYnL8Zz49O
         HVPuO4HjVoBOpq2FcwKN+WhjgRmzaEwcyDqGqkFHvH2nBLdyr6hFNnPIK9d54ELN9y4L
         w97pBjfFCqRocv453dU4i2hkH0jcGHmxxRfJmxoH6c3F7s+R60dbdCQxOTX0E+Yktrq7
         Q6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781511534; x=1782116334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWLdQLm3J2zWM1QA3MmZV2U2D1DL/u5j1Qzgws/RERo=;
        b=BW81FMBfZlhLjWOieyLD0Ur3/cfT9Db5/SfMk5pHP6GRjtk0wW549QAA9z59VOw26v
         PO7/qDd2O8/jYlN4Ogj4IcifHR8bZEPl1T3G03MlYeUvPO7AJ+EJBgXeSKP9u9/rqmQo
         uKqeT2bZt9MQu+1rcc81YU1UhtniUC0mRvT6j7QH7oOFjIVw34OF4ZtFB9wXmpRlvf2l
         p9QOhW19/JoteUUQrqHrexumNn/dTSKDXIhlQr/r1c9e8fhpbsCQ3kbKDxzCrdlLeDa9
         pMhRGZ/TYE+CuWmjmNZVOU0hwoC5DrwEfwA7tHNezpUTNZDR1XjN26FHyfVB77gex2YR
         ZVjw==
X-Forwarded-Encrypted: i=1; AFNElJ8Wrr2vRTpG8821z+iRKRqGS9ib1K7Y9+9Ad1qda9r7rJuNzrIcxJCKnaC+OdK1cuQ8VmwBFXZu8GeTb4dkiha2vBNsYA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzNzhJ6lujf50YXlWaQi6L1bTIhDcjs+NJlhxgAIlLQjwtpbh6P
	M9mTLSAduMEbLT+TEOx4CXC5MGkWF8e6ETdBqUXNTFrCQZ04T3eCrMCv
X-Gm-Gg: Acq92OENG37QC6pJPlXIlGoLKzyXhgLo/ZC9okVJvnEnDbkOh0jonIXriXAshe1/gLE
	FcQBIpMm3eUlc4IXJeP0uePgwAr79PioRgzZ63Nf0Zgn+vJfLs5RvfwO5sLix0/mn9c+TLG2eyt
	a0Q/N02CDHJJlmrsAz+Q7Uh9Vti16YgYxv7/aZj/063mZMSmuCYXkl0aRjJAzoMBBLTOb+PiqyR
	Vxze9e01VCFrPR6EqHuW+VKz6COVjwXtd7CUYGT2TmP2vCIH3EyaBrsrYCRvM7Sr/O4yW2yjWCa
	duKj8PSxgWQNWMWvWadEy0ezMP1sv1uAzTxU+MXxMPt5FQECyq7M+7suHZrZ8di9FOayUo08IWs
	GEVW5hxb/8qythchvj0hO8ZyBc/q7ch0K9cXnTJSQf7h91BfqUzCaaq/4XMCdyHz1zz6zt2N+6i
	dfaTARwiw7xeXt9W82
X-Received: by 2002:a05:622a:14c:b0:50d:9f02:86c7 with SMTP id d75a77b69052e-517fe4effd5mr188145831cf.13.1781511533908;
        Mon, 15 Jun 2026 01:18:53 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb6428a6sm118854651cf.12.2026.06.15.01.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:18:53 -0700 (PDT)
Date: Mon, 15 Jun 2026 11:18:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH 1/2] staging: octeon: add missing tasklet_kill in
 cvm_oct_tx_shutdown
Message-ID: <ai-1ZsF3dzqXZcbJ@stanley.mountain>
References: <20260614114739.87061-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614114739.87061-1-ayushmukkanwar@gmail.com>

On Sun, Jun 14, 2026 at 05:17:38PM +0530, Ayush Mukkanwar wrote:
> The TX cleanup tasklet can be scheduled by the watchdog IRQ handler
> to execute cvm_oct_tx_do_cleanup. There can be a pending tasklet in
> the queue which might run after the cvm_oct_remove() frees net_device
> structures, causing a use-after-free in cvm_oct_tx_do_cleanup() as it
> iterates cvm_oct_device[] which is an array of netdevice pointers.
> Add tasklet_kill() after free_irq() to ensure the tasklet is no longer
> scheduled or running before teardown proceeds.
> 
> Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
> ---

Looks good.  A couple process though.

1. It needs a Fixes tags.

2. You need to say when you are using AI.  I think you're supposed to
say which AI tool you are using as well.

3. You need to say that the patch has not been tested.

regards,
dan carpenter

