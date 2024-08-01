Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634A61A99C5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  1 Aug 2024 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722523902; cv=none; b=chq7Js+MKexSyiYll0XOIxbTz1BjxbViQYL0MgHVMUeCSYLNeJIoIwOVWdvsr0wlcYadBOxl3dsUZ4f1xvc4slZwRSix2hSdAqVOQNvT3WahcDTC4hqnisbIM50+cRguwq8cc6Txwl7Wt8kpvwG84wQ8icFRnU4NPQ+nWsMbtN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722523902; c=relaxed/simple;
	bh=nn9LkWIhnh3vLamC+TAfbe6VpAJDcd4OQsBnnLx771o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nib7DyeGxopycgYXXJZGtdQ2m/fHhE28Mg0snxZlPhO/GJwQ4ZPcLoKjy56FCjVwSiuefzOVGmj1u4Iy6L7Yfr8GMkJzcvma66a62GkI0HNGWepxy6VJOWA3ByQSrqhr9dD/TkDoaMgk69NCxAYVMaD3DUU+iP+AaYLwb8zBrCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wrZO+0pX; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wrZO+0pX"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03DCE81FD7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  1 Aug 2024 14:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5YDDZPLoxGC3 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Aug 2024 14:51:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com; envelope-from=stern@g.harvard.edu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 12A4B80F22
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12A4B80F22
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=wrZO+0pX
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 12A4B80F22
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  1 Aug 2024 14:51:39 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7093f6adc4aso2736879a34.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 01 Aug 2024 07:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1722523898; x=1723128698; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eg0bXkfAj/+Bepz1s51Vu2b4PmWBXCOAEfolPp84uSo=;
        b=wrZO+0pXLc3U4UKsRQ/goGqShgb4adIEDiJJ7NQDTMot8+hVmBBv+ywNQR90NytPzU
         X5wlnj7f3kEAzzq1XT14I0yy506a6uWEyP0dkMBjB0Z6ULGz912bK0CZgoMK4bXO/12a
         UWGGNWOa9DMDvOVRW1tYs6c71SCuWgJgsbRNduQmtfg7GETVo/ko95KYVQ++Wwq4pEW0
         kBMXUcyMWdzmoGoynWDccHPyUVEWTDDnQHgv4bnYYDNWDU16ZrZmWp0Ywvf4z/5U2Orx
         v+WYzzfEMkxRmGZMt4wHLsr7nbaIGg0F1O5jXihgpj29MCykeSdRIkN6Z8SV62snlGNe
         zR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722523898; x=1723128698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eg0bXkfAj/+Bepz1s51Vu2b4PmWBXCOAEfolPp84uSo=;
        b=GLhSIB50f9/VnNrQ2SGcSAMo4rSL34cYvj+aLkpBesYm33IT8p8wuUa5uKPpivmFv8
         tmVfEJVna/NXMNAfiqF0jzLX8wmWkA4IN/91qQeBCjEILBq42Jhm0SNBLc47Q5sUoVzU
         JuO+0IlB/I5jrEz7KBzI83DE7JYDefYyOa4S3zfIRI6zURcjdmTjSlQ7Aggx16VICALL
         WUftVVrvbecvwgJXu5ePXZXi41r7fywNwy72P1pvKfxEnoSUdzJr9NUObNYD1v1m+GXz
         0uIGlF+aI67SfihHcvQUZxRnWgO/1MClWcBThoEKYSGrCc1ZwEAkAFzDRjF0oJ5ukqj0
         IPlg==
X-Forwarded-Encrypted: i=1; AJvYcCXS9r1/Teq/Ke5s25ON3LbZn1Rwqt/b3BbYd2PrdiRA/TUiC4xacK0ZAi7xfo1Hlsf4WrQtFR1vloz0GRxU80CeB+8raMvhoG6IcNBOgJwnkXC1njDNMoyTKjiw8fcz
X-Gm-Message-State: AOJu0YxoNJZll7HR9yONwo4PALrYPto0CVLJJnBR7cuFWf4t2YFOxo4W
	qqEhA5GI6iMk0e5k3iPFfAt43+NuyHX+pL64pMlM7ZFzDvFa2fsmhBHzPP1RHA==
X-Google-Smtp-Source: AGHT+IGvTWg2xLo8ers9vXVYlOj18rTUnVG5OWnVAexPis43OnNwricIwWWqflTqxwAsnRfQesQt3A==
X-Received: by 2002:a05:6830:628a:b0:709:2677:3435 with SMTP id 46e09a7af769-709b321d108mr403607a34.15.1722523898211;
        Thu, 01 Aug 2024 07:51:38 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a20d6426f4sm159025485a.8.2024.08.01.07.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 07:51:37 -0700 (PDT)
Date: Thu, 1 Aug 2024 10:51:35 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Abhishek Tamboli <abhishektamboli9@gmail.com>,
	gregkh@linuxfoundation.org, usb-storage@lists.one-eyed-alien.net,
	linux-usb@vger.kernel.org, skhan@linuxfoundation.org,
	dan.carpenter@linaro.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: storage: ene_ub6250: Fix right shift warnings
Message-ID: <890e0ed1-25c3-414e-9e8e-f5925fe8c778@rowland.harvard.edu>
References: <20240729182348.451436-1-abhishektamboli9@gmail.com>
 <e72cc56a-3066-4cb8-848d-bfe27a48c095@suse.com>
 <ZqkpOQIjcBSAg8rC@embed-PC.myguest.virtualbox.org>
 <5d7870b0-6b63-430b-8885-2509b33dc78a@suse.com>
 <804a6d40-73a4-4af6-944b-95e9324d7429@rowland.harvard.edu>
 <Zqp8vbbIC8E/XrQY@embed-PC.myguest.virtualbox.org>
 <b35a344a-018b-44ae-975a-7767a3d5b6ec@rowland.harvard.edu>
 <f5d4711f-9b4a-457c-b68c-c2e9aefbe4a8@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5d4711f-9b4a-457c-b68c-c2e9aefbe4a8@suse.com>

On Thu, Aug 01, 2024 at 08:54:18AM +0200, 'Oliver Neukum' via USB Mass Storage on Linux wrote:
> 
> 
> On 31.07.24 20:19, Alan Stern wrote:
> > On Wed, Jul 31, 2024 at 11:34:45PM +0530, Abhishek Tamboli wrote:
> > > On Wed, Jul 31, 2024 at 10:04:33AM -0400, Alan Stern wrote:
> 
> Hi,
> 
> I should make my reasoning clearer.
> 
> > > > Replacing the variable with a constant won't make much difference.  The
> > > > compiler will realize that bl_len has a constant value and will generate
> > > > appropriate code anyway.  I think just changing the type is a fine fix.
> 
> While that is absolutely true, it kind of removes the reason for the patch
> in the first place. The code gcc generates is unlikely to be changed.
> 
> We are reacting to a warning an automatic tool generates. That is a good thing.
> We should have clean code. The question is how we react to such a report.
> It just seems to me that if we fix such a warning, the code should really be clean
> after that. Just doing the minimum that will make the checker shut up is
> no good.

With this fix, the code seems clean to me.  It may not be as short as 
possible, but it's clean.

Alan Stern
