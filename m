Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BE81B29A4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 14:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722434681; cv=none; b=jDdur8uQQnc204z3DyJmXHt7j9Z2DJwfV1yl/jSfBYQB5ZoaHqLDApajECXwH4N2z6Qvik53jtGFA0Du+MgtuiHd539MbD/fXQrMLiitTHgqQNqXLlScCMVpjMfjQCJKcLPU2Qv8zdH3l+ltoY8Idqy3j/LyaFupf0zc7bZ5+Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722434681; c=relaxed/simple;
	bh=oLh2PxgOYmR7+7wdleZ5fx2VuAWo/Sel6Gx9WfF2ndM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppO6mg/zZ2HpqT2RapiRETykUzH3fMuu9KIz/hQZ0CP+MV0GdG/PFbndCSXXcbA/OXh5ihJ9D/trpXH75T5npzCgNb55EYeOmZR8MaAzZm9pMcvvMnrKiLB7AO/mDbhj1/VVB73gmJ+j6ma4rYWR4cOY+4rmN43e7hvYscOnKqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=i0J0OTN1; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="i0J0OTN1"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CB09409CB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 14:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SxaCdbgqbRiz for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Jul 2024 14:04:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com; envelope-from=stern@g.harvard.edu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 42DCD409AC
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42DCD409AC
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=i0J0OTN1
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 42DCD409AC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 14:04:38 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7a1e2ac1ee5so371027085a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 07:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1722434677; x=1723039477; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a33CO1uHADQ6sgXZQtQE5aEWMq1kTwgBEoJ/8BHTMSw=;
        b=i0J0OTN1JRjMol0A3Lri9xKSnzSQSO0PW4DpZyxeaLgFNXI4kKfwRLEgs8LODJDesg
         N7bfMkUhRudNa3jLd5foApyfaVm87ArgqDAdda9DRRzoRf8W4qNtAV+3SOcUhwfNOm93
         iTD1FEnZCkoNdaqRIulVjMv4OQKUOZpzW4gGpYPCjQGZgbQ6O7l+ouPWG9qhlz8cNdaK
         i70c/0XLhymQdH6qXEKYi4lCKxK1tlj0+gxCQ/993jOue0g7wp/mSVm40ArwynNLP4a/
         UROWYihmEattbm4AmjiZmT0oTJUz5565TeRd9BfwwHclD2dcx3Op7GYMP4nDrhARxpNr
         TKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722434677; x=1723039477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a33CO1uHADQ6sgXZQtQE5aEWMq1kTwgBEoJ/8BHTMSw=;
        b=NqiR94JPPwPzrsNmjSD0nKHGzKIiOBBJUIZBzy/983HzX+dEGi3wwbgg1zZWTeTaZt
         daPlUjdEzW6Z6EQF2ik13K8QbZcv0AvIMzEuD2TAQ8CZQiziXwTF7cJttqSlE+JXg3yK
         /E/XyGjgB7f/Wn3SboOmgovn5eaEWr+v2DhQzSYYvQM38ziEMMLO0P7Zeruahqneu+KP
         GC2hJP79PmuN8Dg1OOd1BKjem3CjadFzQSzja+T5YOJhT7EjmMeERksw8HPrcnctuH8p
         WIY4fS+xcb/3IdT2cjolwf68suL5rmUE/j7D+Ssb+Han1dwpdEuwZsH8V0PnyvfhwpaT
         yQpg==
X-Forwarded-Encrypted: i=1; AJvYcCWIJVy4RvKG7IbiG0H6HgMtmzL2fBFIDoMXoDqeulHDaLB8lMzE3kd6DnIDsmCNpxLqtRDLkl69sTohEt0ae6vW7ACg1N4Fer1br330Qy4mtQL5hVYnFcBVSdL7XcdB
X-Gm-Message-State: AOJu0YwWJuDTZdnFrNlEQ3GXEhugFocj6RVa+uAJItkxPrx7cU0ZP717
	C+/1DlCvBGa9o6umlnhyFep9YHwM2oTCXAW8+SQxVeBVNlOv0dN44yO1x2PGTQ==
X-Google-Smtp-Source: AGHT+IHuaIxXiz9/F7tFd8xWAfJBmkTsfbtztGBLPFY0TGFZMDZboiTLKwe6io78Jn8mrFkjnOLl9g==
X-Received: by 2002:a05:620a:8016:b0:79d:9102:554a with SMTP id af79cd13be357-7a1e5223dddmr1848014585a.14.1722434676796;
        Wed, 31 Jul 2024 07:04:36 -0700 (PDT)
Received: from rowland.harvard.edu (iolanthe.rowland.org. [192.131.102.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1ddea0c2asm645807185a.27.2024.07.31.07.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 07:04:36 -0700 (PDT)
Date: Wed, 31 Jul 2024 10:04:33 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Abhishek Tamboli <abhishektamboli9@gmail.com>,
	gregkh@linuxfoundation.org, usb-storage@lists.one-eyed-alien.net,
	linux-usb@vger.kernel.org, skhan@linuxfoundation.org,
	dan.carpenter@linaro.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: storage: ene_ub6250: Fix right shift warnings
Message-ID: <804a6d40-73a4-4af6-944b-95e9324d7429@rowland.harvard.edu>
References: <20240729182348.451436-1-abhishektamboli9@gmail.com>
 <e72cc56a-3066-4cb8-848d-bfe27a48c095@suse.com>
 <ZqkpOQIjcBSAg8rC@embed-PC.myguest.virtualbox.org>
 <5d7870b0-6b63-430b-8885-2509b33dc78a@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d7870b0-6b63-430b-8885-2509b33dc78a@suse.com>

On Wed, Jul 31, 2024 at 11:15:28AM +0200, 'Oliver Neukum' via USB Mass Storage on Linux wrote:
> Hi,
> 
> On 30.07.24 19:56, Abhishek Tamboli wrote:
> > On Tue, Jul 30, 2024 at 09:09:05AM +0200, Oliver Neukum wrote:
> 
> > > 1. use a constant, where a constant is used
> > I think you are suggesting that I should replace hard-coded values like the
> > buffer size with named constants. For example:
> > 
> > #define BUF_SIZE 8
> > unsigned char buf[BUF_SIZE];
> 
> Yes, but the constant we need to look at here is bl_len.
> This is a variable needlessly.

The code in ms_scsi_read_capacity() is written that way to be consistent 
with the sd_scsi_read_capacity() routine.  Or maybe it was just 
copied-and-pasted, and then the variable's type was changed for no good 
reason.

Replacing the variable with a constant won't make much difference.  The 
compiler will realize that bl_len has a constant value and will generate 
appropriate code anyway.  I think just changing the type is a fine fix.

> > > 2. use the macros for converting endianness
> > Can I use macros like cpu_to_le32 for converting the bl_num and bl_len values.
> > Should I replace all instances of manual bitwise shifts with these macros?
> 
> Yes.
> 
> > For example:
> > 
> >      u32 bl_len = 0x200;
> >      buf[0] = cpu_to_le32(bl_num) >> 24;
> >      buf[4] = cpu_to_le32(bl_len) >> 24;
> > 
> > Is using cpu_to_le32 appropriate for the data format required by this
> > device?
> 
> Well, the format is big endian. So, cpu_to_be32() will be required.

Better yet, use put_unaligned_be32().  However, there's nothing really 
wrong with the code as it stands.  It doesn't need to be changed now.

Alan Stern
