Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826683FB31
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 18:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722450001; cv=none; b=BCDriE6fgJPqMlXHo6+RGyeDL4+uOHm7Clh2Ob6THoWQkDXcUYWSJWg7MFrAdWLnTQZKTgjt6+K0Jlz9sCy7ku/47IUQJLSZmpiQws7ObcG2rLzbHnbBeLd0OU9+lgRWqXmsa5yiTPXQ5FfXQ4hqGnBvDNQT8Zk/AE4nntSA1NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722450001; c=relaxed/simple;
	bh=zzeXu0V2XrTOH9QXqXrrAt5OkQnJlMRSRL+oX4kdGts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEJHMNsSqwANad7GtBH17jVeIK6iky/NZcfCpGLP1j8Cm4aH/OtUpiNAkqiAdU+XGF7lLIKSQzzd25x9PQLRWVPXAGwtLcOcZMmrC4/jnJOpR4b3Mn+GAHavwqjtG7rB1ekRss0FT0NrTH2+VuXslSuPpwWv0C2lLytiJBA5JsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=PbAExENy; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="PbAExENy"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27FE980CCE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 18:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CkoE00EG6bzq for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Jul 2024 18:19:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=stern@g.harvard.edu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D95D80CBC
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D95D80CBC
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=PbAExENy
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2D95D80CBC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 18:19:58 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-450217eaa62so24530461cf.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 11:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1722449997; x=1723054797; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SnOSTDz5p85GiwsKhk/eE53XisA23eDTKA9fiAEKZb4=;
        b=PbAExENyaRsh4+hbEOnv7cSSO9IAdHBkPwhhnb1mMdAGONVFtetb/3ZPOuBPvRhQL1
         oSNmgIgjCoI7KprmweKfxlj5WZilVXQF9yEvzNxMhC+QGNrNCYB2vKjjhxlDcR/rHdD9
         6Tq6I0XWC9OvosVxno4VhwseIMs5NCxQSEwXXS2yQwl4OCDj1jfdSJ1JpKre8rzQvLUV
         Rq5rBcdZl9H98VVAGuXCGCGefD1mKlW92g00ymg8jybyWIQ5QLmGLN6otrdsU4JtVY1c
         Vx2q/joKsHlI3Ko317KVP0QO9ywKtcGPHnUoZ9rlOTYgvyHQvwhXjlaO4knBp3GYafy0
         JZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722449997; x=1723054797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnOSTDz5p85GiwsKhk/eE53XisA23eDTKA9fiAEKZb4=;
        b=onF+a7uA02jLSO3kYK9tFgFAuaV0fTLXwzDh/LsYMPGJjlwro0HuFf11jzUQeWkIlV
         ncHiuZgP8+MzqxwJUkSrV0nEOl5IacXpSQdYdVvyELDQA3FVtpVhPlPjesCxHZw9HhXF
         KxWNzLUvrAdy7i3jv6vE+KkXn+9nAlMv2pLxT+0+53dhoPcxQ2jhSZgkQvRa2jVGFn8K
         rOnH57/IIYgg+t3wQpgdV54Wxrs0aczee1b0jq+kbZ35TY7UPToLh17gmbQ5NpU4F7+h
         Siukf1vhyKmNxwA1c7OzzFYhRrEpzkDn7nRM640oeXrhEObd4as6VuAXJccn/NnZzs03
         jCcw==
X-Forwarded-Encrypted: i=1; AJvYcCUWyTLD/7w84v0GMrUOVkJVVWEjssoZ1JSUX96jIHtOMpbEaivdcUlYcwanLFF4CSzhoZPGy6u7r8kQZK/M9wIVNlWRJrQfMbB2ke/D/pxc87TbcWn8gIcwMBRKmYDL
X-Gm-Message-State: AOJu0YwdfEtqsrFAvBsi3IFgnY3SWnJRN1tXpm2U8nq8OieABOn9mYZP
	TC/LpwjR8pV9cWtdsIy4dVil1wzDsEHldoeNBUmeGwPtTb/SroAXM8gpiB9DUw==
X-Google-Smtp-Source: AGHT+IGHq1pCN5+SZ6wLoOrS7zzkUEg0Kf/ITIW2bSTAZXtWNPHjw1SfGm/eJfr5OIMu6iKyU2I3PQ==
X-Received: by 2002:a05:622a:249:b0:446:60ba:610a with SMTP id d75a77b69052e-4514f965be1mr1668221cf.9.1722449997405;
        Wed, 31 Jul 2024 11:19:57 -0700 (PDT)
Received: from rowland.harvard.edu (iolanthe.rowland.org. [192.131.102.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44fe82012bcsm62119401cf.66.2024.07.31.11.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 11:19:56 -0700 (PDT)
Date: Wed, 31 Jul 2024 14:19:54 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: gregkh@linuxfoundation.org, oneukum@suse.com,
	usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org, dan.carpenter@linaro.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: storage: ene_ub6250: Fix right shift warnings
Message-ID: <b35a344a-018b-44ae-975a-7767a3d5b6ec@rowland.harvard.edu>
References: <20240729182348.451436-1-abhishektamboli9@gmail.com>
 <e72cc56a-3066-4cb8-848d-bfe27a48c095@suse.com>
 <ZqkpOQIjcBSAg8rC@embed-PC.myguest.virtualbox.org>
 <5d7870b0-6b63-430b-8885-2509b33dc78a@suse.com>
 <804a6d40-73a4-4af6-944b-95e9324d7429@rowland.harvard.edu>
 <Zqp8vbbIC8E/XrQY@embed-PC.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zqp8vbbIC8E/XrQY@embed-PC.myguest.virtualbox.org>

On Wed, Jul 31, 2024 at 11:34:45PM +0530, Abhishek Tamboli wrote:
> On Wed, Jul 31, 2024 at 10:04:33AM -0400, Alan Stern wrote:
> > On Wed, Jul 31, 2024 at 11:15:28AM +0200, 'Oliver Neukum' via USB Mass Storage on Linux wrote:
> > > Hi,
> > > 
> > > On 30.07.24 19:56, Abhishek Tamboli wrote:
> > > > On Tue, Jul 30, 2024 at 09:09:05AM +0200, Oliver Neukum wrote:
> > > 
> > > > > 1. use a constant, where a constant is used
> > > > I think you are suggesting that I should replace hard-coded values like the
> > > > buffer size with named constants. For example:
> > > > 
> > > > #define BUF_SIZE 8
> > > > unsigned char buf[BUF_SIZE];
> > > 
> > > Yes, but the constant we need to look at here is bl_len.
> > > This is a variable needlessly.
> > 
> > The code in ms_scsi_read_capacity() is written that way to be consistent 
> > with the sd_scsi_read_capacity() routine.  Or maybe it was just 
> > copied-and-pasted, and then the variable's type was changed for no good 
> > reason.
> > 
> > Replacing the variable with a constant won't make much difference.  The 
> > compiler will realize that bl_len has a constant value and will generate 
> > appropriate code anyway.  I think just changing the type is a fine fix.
> > 
> > > > > 2. use the macros for converting endianness
> > > > Can I use macros like cpu_to_le32 for converting the bl_num and bl_len values.
> > > > Should I replace all instances of manual bitwise shifts with these macros?
> > > 
> > > Yes.
> > > 
> > > > For example:
> > > > 
> > > >      u32 bl_len = 0x200;
> > > >      buf[0] = cpu_to_le32(bl_num) >> 24;
> > > >      buf[4] = cpu_to_le32(bl_len) >> 24;
> > > > 
> > > > Is using cpu_to_le32 appropriate for the data format required by this
> > > > device?
> > > 
> > > Well, the format is big endian. So, cpu_to_be32() will be required.
> > 
> > Better yet, use put_unaligned_be32().
> Would you recommend submitting a follow-up patch to incorporate this change, or should I leave it as is for now.

You can submit another patch as a clean-up, if you want.  But as I said, 
it isn't needed.

> >However, there's nothing really 
> >wrong with the code as it stands. It doesn't need to be changed now.
> As you mentioned there's no need to change the code, So my initial patch is okay as is?

It is as far as I'm concerned.  Obviously Oliver has a different 
opinion.  But I'm the Maintainer of the usb-storage driver, so my 
opinion counts for more than his does, in this case.  :-)

Alan Stern
