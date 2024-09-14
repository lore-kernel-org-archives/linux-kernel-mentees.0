Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4681D12EA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Sep 2024 16:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726332693; cv=none; b=oM5O2DO4lDGfUDAleUBr82/gOpsA1EscpWNHGKb2dcH5TloW3qU4ITr72SqqlKlC/TW77SaaKrQUqEhnASBPrpGlhM/TfH9huSQx+h0864EEz/gfW4rQVoJHNebItGIvanj3DzKpfRIPFyfsaSfyd7Jendwp6gC4wS5cBWMADSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726332693; c=relaxed/simple;
	bh=4YIUED8NTvL+pJU9x1zOi1xxGpnRcuZT+fTCARpcsEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucLpaSugo8IL1ygzsfg+ToxIK/V6G1dgenBFUSPNlOG3hWrp1a3VfbbZg7f0NdWs0KFiAfaYQ4dzw8MnBuDnv/JTJnp0uKN2Ju//EQOUauM1RDlhtZ4Zeq3WSG2MR+8gYqJQqxoVoV9sGaeuIX7g46BSdNzRUdGbb32Vhk4046I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vbSMaXAF; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vbSMaXAF"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 592584196F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Sep 2024 16:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sziCuR87XT1V for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Sep 2024 16:51:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=dan.carpenter@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 41FA5412FB
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linaro.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41FA5412FB
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vbSMaXAF
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 41FA5412FB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Sep 2024 16:51:30 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a8d3cde1103so418449666b.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Sep 2024 09:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726332689; x=1726937489; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=260L8wObmIZ37leKXxRsSt6Vzwvxj0E4EQRxHhUduKk=;
        b=vbSMaXAFFnXyPQE+GD/BCHR9UXAg4iLPYeP3+G0Lds9EGySF84DkNOHuBocWeGjQ1K
         izdA6TtvgGWZqjW3BiGfoo1KDEC8Rdb+ljp2u3WLBctbPUXVoobk2nQcyFaqKqMyg++m
         AggHV6obAv9slMbdyZmb8jBRbWCLDhP4N984aGuuyuOchyhv9tW/EHKbps84OkbkdxIc
         YXxnJLWgnXO7OJRwGFUqTXR1YLPP9v94E3+3CUD/6zZyK99aTcMKxYHbTUqGmPRrzVsn
         nt4Sdh3umJgG8z2WMfJRrdGluyOt29D/5SwjBsYwSQpZDA/ht45A5NHzNk0jkYizcP/4
         DW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726332689; x=1726937489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=260L8wObmIZ37leKXxRsSt6Vzwvxj0E4EQRxHhUduKk=;
        b=AXaEQ6QW0bruptnRipziGHVtrlpYjX8ia64SaeEiPGZ060KBB/TwIqPKeVuaia6FfI
         TJUa4Vrnr+f7pHcELiZNGiq6dU/O0M4Go03xHM5nE4CEGzKq+J8MQBV2BfYz3rsOqdiw
         HWdQrJ38w7POncdzPcVFjZ/A6YYuW6zjlT9aXQ1395KyCFhUACoGIUFU80y1FrSWuZ+1
         CWSYf16pqhlVd39HfAMac61m9G6e+aPp5whRDxxLAWcIz4ac2hMs/S34DzQUOagB6M/1
         707Kf3GK2VnLXdZsENwsFG7l6qHcxxZTioNDXkUTATr2PSpXwINaVwWVrCotMtwPMrTP
         SU4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0A1+g25LV+EmGq4gQEdGgBQf93u0NJhzyjpR1Qgx7NY5SxyLyyrBr/db0ErRK5Iojm2T6PGAWcG75IXTVKUGtjvZsmw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwEzrpidLLgIdPk9SMj8PcQ0xcAmHhfW6VGHr+qq4gZBf/4cIF5
	Ap5GTr9jQXMWNSqBq2awYe9AXRzl0taJnuz37BHt6OYT7gRawQ6wH219i8UBm7g=
X-Google-Smtp-Source: AGHT+IEg9Ep2YCZ/L0TFudDfeLg21XrwMV52bqJ4ziTDK6kTpQLQzJiKRJFmO88/YXaT2/T/CXXbOw==
X-Received: by 2002:a17:907:6d28:b0:a8d:1655:a423 with SMTP id a640c23a62f3a-a9029678c66mr1159702366b.56.1726332688539;
        Sat, 14 Sep 2024 09:51:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b3997sm98312866b.104.2024.09.14.09.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 09:51:28 -0700 (PDT)
Date: Sat, 14 Sep 2024 19:51:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: octeon: Use new initialization api for
 tasklet
Message-ID: <3d9ff743-01bb-4b40-9551-fb220bf3c7f3@stanley.mountain>
References: <20240913191734.805815-1-abhishektamboli9@gmail.com>
 <2024091424-glisten-unmanned-bb8f@gregkh>
 <ZuW9iInzizGypLRt@embed-PC.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuW9iInzizGypLRt@embed-PC.myguest.virtualbox.org>

On Sat, Sep 14, 2024 at 10:14:56PM +0530, Abhishek Tamboli wrote:
> Hi Greg,
> 
> On Sat, Sep 14, 2024 at 10:20:02AM +0200, Greg KH wrote:
> > On Sat, Sep 14, 2024 at 12:47:34AM +0530, Abhishek Tamboli wrote:
> > > Use the new api DECLARE_TASKLET instead of DECLARE_TASKLET_OLD
> > > introduced in commit 12cc923f1ccc ("tasklet: Introduce new
> > > initialization API").
> > 
> > This says what you are doing, but not why you are doing this.
> > 
> > Why is this needed?  What bug does this fix?  The code is the exact same
> > afterward so why should this be accepted?
> > 
>  While this patch doesn't fix any functional bug, it ensures that the 
>  code is kept up to date with the new Initialization API for tasklets.

You need to resend the patch with this information included in the commit
message.

regards,
dan carpenter

