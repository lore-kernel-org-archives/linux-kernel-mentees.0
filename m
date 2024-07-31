Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7E01C2E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 18:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722449097; cv=none; b=JzmxbcVj1dpUIp6xlZTcqFQYSUqm99Vnun1icQTM91jOtuVzagrDxw7Xl/F4ziCw8SLh0U2Lich1h2Yg9hsz2uXOIhiQNbCjKBiAgLhe6P18Htp63+Md+tE2rrXqH8L7taLLQOtyANUIiw8m6hzSw8nUf3vRR2VaEa3CFfd0niA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722449097; c=relaxed/simple;
	bh=H1eCGLUAUKLgn0fxJh75Nlr9rCHwTsr99fT5Sm7CQ9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owsfZlkvQbCFxl8Eyjcqxlwb8VbVa2FjIfnWy4BWNmt2spU4Z5r2FsyNdAkMo08SHJFk0t6IpKos5ivriilCbm67B1RyYBO8moTeWo6kCp4UQVg8qFjhkIVSSQUzOoUaluvlKmVhjwxpZwFcCm1lu44eZs4KEj0PSFkFAHvtuNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEw4P8XY; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEw4P8XY"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84F3E80C16
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 18:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQEPJl01arQl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Jul 2024 18:04:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ACC0380C06
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACC0380C06
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gEw4P8XY
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id ACC0380C06
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 18:04:54 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1fc66fc35f2so9220875ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 11:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722449094; x=1723053894; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iqDcpi/n8xO7BkglMX5k5WSiH67lYtHRaeeKrrUno3g=;
        b=gEw4P8XY+jhwqL49muEM+YEAb4Ybu7kNCK6c4jqDqR+YtxCzcTusX5ZBMu/47ZufEF
         fgvztBQ538ZAEyxCyv3sXYBuaKeXW7RyMHnYB89i/Dk486kEhCQYvFOOedQJaRGNw26W
         hkUS91upz2+uTWSuv0vejYSPZJQ5y+Bq8HrJCDhun0Znx4g8vE7cdLVHzBtLwvN6o/oH
         YQJZxf1e6GCMipGdjNdOYPqlkEbK/2j3CNjSorMLJ81QatkxHDdEOWxgSZ97A7Af6qH6
         k6auUT3OKkPtd6UNaGHIvI0+zyyCZnUFghaqoQMjr8oxvt54x1P23f7B+XixT+E1HtVx
         W4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722449094; x=1723053894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqDcpi/n8xO7BkglMX5k5WSiH67lYtHRaeeKrrUno3g=;
        b=Hzcj6qwfHa3GddWpXV6h4EkAMC12XFKZd8Qa4OcUaCrrO10l1MHBqswUiVRRoBHDzB
         6fOvE3LsMP6PQFlFjCvSZfjrqZBwDxhbkmPBhdzXdan8iirwnYuFwUJopZZTQd9dMH4s
         fjo5pgWyU/eSLg8vN7D1VXHzW2S6XEiVSImSn5yudg5HQcDSwn7kvFNqu0gKura6tq6a
         +M6tVXK0O/v+F1lyLaVveAMwsxpcxo+MCYAjdwkQ3femK/ttytt3LFJJFHnFqM1GQJeh
         zk+RMj35WZGHTWmWyOjYw9Uc7tNNCn1oXmhpW8EMUPKvW6e33QFf4MZ+jyV9poBk6ORs
         vzDA==
X-Forwarded-Encrypted: i=1; AJvYcCXI7Mp16ixQQYTQf2z3IA4NYYZ7IfLQbzD5tiua7qJkjsC1HDwzbZRYWCEAsfuRP/6XMmXIOGLQfLgmSZV8rBUQuQbx2BUdb9OXtDJUz4lEGaDHuzrkFHFTNXSfVsTR
X-Gm-Message-State: AOJu0YxeO0yv2j4/OlKGCFZe7f6W84RXSNojJoR6HnviFhcalB/EKaAk
	koUeFIZQJmRiPSr635WZ7binvnxEVugoiL+eVXmNPscmfyhsjWLG
X-Google-Smtp-Source: AGHT+IGr87v+wUp5xqRXUlpuhwtmGeHd1j63CbMiwKHYVOmvATIS215NgGEEX7p60CPIlwtSs+DC1Q==
X-Received: by 2002:a17:903:120c:b0:1fd:74ac:e6b8 with SMTP id d9443c01a7336-1ff37bc6620mr119657695ad.7.1722449093673;
        Wed, 31 Jul 2024 11:04:53 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.205.109.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee6a1esm123666655ad.164.2024.07.31.11.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 11:04:53 -0700 (PDT)
Date: Wed, 31 Jul 2024 23:34:45 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, oneukum@suse.com,
	usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org, dan.carpenter@linaro.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: storage: ene_ub6250: Fix right shift warnings
Message-ID: <Zqp8vbbIC8E/XrQY@embed-PC.myguest.virtualbox.org>
References: <20240729182348.451436-1-abhishektamboli9@gmail.com>
 <e72cc56a-3066-4cb8-848d-bfe27a48c095@suse.com>
 <ZqkpOQIjcBSAg8rC@embed-PC.myguest.virtualbox.org>
 <5d7870b0-6b63-430b-8885-2509b33dc78a@suse.com>
 <804a6d40-73a4-4af6-944b-95e9324d7429@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <804a6d40-73a4-4af6-944b-95e9324d7429@rowland.harvard.edu>

On Wed, Jul 31, 2024 at 10:04:33AM -0400, Alan Stern wrote:
> On Wed, Jul 31, 2024 at 11:15:28AM +0200, 'Oliver Neukum' via USB Mass Storage on Linux wrote:
> > Hi,
> > 
> > On 30.07.24 19:56, Abhishek Tamboli wrote:
> > > On Tue, Jul 30, 2024 at 09:09:05AM +0200, Oliver Neukum wrote:
> > 
> > > > 1. use a constant, where a constant is used
> > > I think you are suggesting that I should replace hard-coded values like the
> > > buffer size with named constants. For example:
> > > 
> > > #define BUF_SIZE 8
> > > unsigned char buf[BUF_SIZE];
> > 
> > Yes, but the constant we need to look at here is bl_len.
> > This is a variable needlessly.
> 
> The code in ms_scsi_read_capacity() is written that way to be consistent 
> with the sd_scsi_read_capacity() routine.  Or maybe it was just 
> copied-and-pasted, and then the variable's type was changed for no good 
> reason.
> 
> Replacing the variable with a constant won't make much difference.  The 
> compiler will realize that bl_len has a constant value and will generate 
> appropriate code anyway.  I think just changing the type is a fine fix.
> 
> > > > 2. use the macros for converting endianness
> > > Can I use macros like cpu_to_le32 for converting the bl_num and bl_len values.
> > > Should I replace all instances of manual bitwise shifts with these macros?
> > 
> > Yes.
> > 
> > > For example:
> > > 
> > >      u32 bl_len = 0x200;
> > >      buf[0] = cpu_to_le32(bl_num) >> 24;
> > >      buf[4] = cpu_to_le32(bl_len) >> 24;
> > > 
> > > Is using cpu_to_le32 appropriate for the data format required by this
> > > device?
> > 
> > Well, the format is big endian. So, cpu_to_be32() will be required.
> 
> Better yet, use put_unaligned_be32().
Would you recommend submitting a follow-up patch to incorporate this change, or should I leave it as is for now.
>However, there's nothing really 
>wrong with the code as it stands. It doesn't need to be changed now.
As you mentioned there's no need to change the code, So my initial patch is okay as is?

Thanks & Regards,
Abhishek Tamboli
