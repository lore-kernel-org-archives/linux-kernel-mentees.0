Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A957016A949
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Jul 2024 17:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722362178; cv=none; b=R+W6YF7/vNmpYQZeA6X9EFjAMb+I3lmsAqqiBJMMSKvmsiYsK2q7QfBcsTmv/dXfDKYXGufI0c2cPTWy8DypdORj5g0YezHFonTg02dwFHuNb7/PRKlP6rXR8SRWqjMgPVhZXwQTo6klaN1PA3mf/vHzfGtL4p5imeJl3hP0dos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722362178; c=relaxed/simple;
	bh=6vAOKdphjzKdVk57ZBLwcpv4/xeXmTtrgguL3dS7fiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7ZGLmQnI7UChEew/8rA8WGaxsGrZQo8iVANJphNQnS9RaBAXMf/jkXs72Gr/DFv7DZECozz3m34Ay2RO8DXoWDiwi4sy9qTpy/qd6YywlWk8gRw3pYJygasWrO0WxPzqBgXGcbj8vFqXHs1+C7cL3dKVPO1K9Hs5NxeGm0rj5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLdPAzvJ; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLdPAzvJ"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49F7460767
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Jul 2024 17:56:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJVkXDBhVQ-5 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Jul 2024 17:56:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 711A660718
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 711A660718
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aLdPAzvJ
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 711A660718
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Jul 2024 17:56:16 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1ff1cd07f56so28231135ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Jul 2024 10:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722362175; x=1722966975; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=No6rY78M5KIj3DpjY3N15+J63kX9R0sT/Ncp0Ijs1fo=;
        b=aLdPAzvJyXRtx+VNwB5TvfvzQrQRLXo+g680NErntwd/iNasUDKOVOaiBkPU/86qUA
         ycK+GGcj1AP5PCbuzbMGIzKaM5KWzKH040N4VFp86xeGJADliOBGX2sA98Yt3kCgTkpT
         76ggeO1UXQ8BUwFTJRkyPcd+h3pBOBj3SdOoi+LISFHY7CuvpucZ/L+MnfQKmSaQ82j8
         uYKOFNzY8goNSsRHKkA9vp5iXzpyhRbn1k0R4lpi6m8P/9UvYlYvJodScT/3YUOlDi9E
         uomHfQUonTvpcezwyzQVsKG4tIb+tehNF8Id2hbWfLpKm1H9476WWIeUXahCFYr1jRWj
         ENWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722362175; x=1722966975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=No6rY78M5KIj3DpjY3N15+J63kX9R0sT/Ncp0Ijs1fo=;
        b=iiiscHG1+Uq3e2Onf4drDgcmVBjaStQ96TTMSvUYpM2l2ELq9zwn3Ef1uYcG2qgEI/
         1iq2y/wJwTLqS1bICzCLDdX40AuuZuXRC2ShdBc2/LjLFMEY7Bij0UNr8tzFhlVCrlQ8
         vPs3GVfZjWG2EjjZGTRp5G8boDPnCgMioRNNVFyRhqpkiHyFRlZx0S0f1xYkjstZYAX+
         9dAiDi87Cu6rKs2lG8mAKztPqZi3+c4LrIx7M83yAfU3PWtzAziEFnYTUVf9VQWC7MoR
         ZruGJUehU86uWTqpuKKsjHyT6akJhe+kyOaD7dLdgl33BV0eSP/2O5Zt6UDad+sZ35KM
         MZ9A==
X-Forwarded-Encrypted: i=1; AJvYcCVHjZvuuO4wB9T1nK4S6RhQoXoOLC1Uq37wQ+kBYCotn7fJ3mk9N3RHrxw6KMFc4f2DtYyrnhZLVTwe/q6bJWDlRPslvg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx/LP6zkW+R48bPrz87EkZUlxP6INvcEEtMdNINGbSuTsuzRiIH
	276GSgS549O+7uAxWNmEke9+ytws1/wVt9+Nm9UfVoWOvRoOvx5x
X-Google-Smtp-Source: AGHT+IGeSA5Ardyq54qcy8JsPanVQiscsfFe2/iPX0z4l1px61+9+Ma6z8Z0QjCES1xy2qE3CX/ZOQ==
X-Received: by 2002:a17:902:fc48:b0:1fb:1cc3:646d with SMTP id d9443c01a7336-1ff048521b8mr155538275ad.29.1722362175400;
        Tue, 30 Jul 2024 10:56:15 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([49.37.130.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f1b6c3sm104848285ad.192.2024.07.30.10.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 10:56:14 -0700 (PDT)
Date: Tue, 30 Jul 2024 23:26:09 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
	usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org, dan.carpenter@linaro.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: storage: ene_ub6250: Fix right shift warnings
Message-ID: <ZqkpOQIjcBSAg8rC@embed-PC.myguest.virtualbox.org>
References: <20240729182348.451436-1-abhishektamboli9@gmail.com>
 <e72cc56a-3066-4cb8-848d-bfe27a48c095@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e72cc56a-3066-4cb8-848d-bfe27a48c095@suse.com>

On Tue, Jul 30, 2024 at 09:09:05AM +0200, Oliver Neukum wrote:
> 
> 
> On 29.07.24 20:23, Abhishek Tamboli wrote:
> > Change bl_len from u16 to u32 to accommodate the necessary bit shifts.
> 
> Hi,
> 
> while this patch is technically correct, it papers over the issue.
> Could you please
Thank you for your feedback on my patch. I have a few questions to ensure 
I make the appropriate changes.
> 
> 1. use a constant, where a constant is used
I think you are suggesting that I should replace hard-coded values like the 
buffer size with named constants. For example:

#define BUF_SIZE 8
unsigned char buf[BUF_SIZE];

> 2. use the macros for converting endianness
Can I use macros like cpu_to_le32 for converting the bl_num and bl_len values.
Should I replace all instances of manual bitwise shifts with these macros?
For example:

    u32 bl_len = 0x200;
    buf[0] = cpu_to_le32(bl_num) >> 24;
    buf[4] = cpu_to_le32(bl_len) >> 24;

Is using cpu_to_le32 appropriate for the data format required by this
device?

I will make the necessary updates once I have your confirmation.

Best Regards,
Abhishek Tamboli
> 
> 	Regards
> 		Oliver
> 
