Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF9A346A0B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 16:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670704; cv=none; b=dKom283QM+JGrSOEViObkkGh0za+rJpfcvKx3mXNSCxzR97ZnQOhBRe0UEJ/q500alCjOcm3ovPJkZqvw4O8KwHUgpo8sar+E62hhXm8VoKg9ZEhWzUWAMcW4ghwL/YJyooPtAZwu4bzCXy56WVLBThp6paYEGh02lixEq7RBSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670704; c=relaxed/simple;
	bh=S2YK88oreoElX7onfuW9IzclvPMp4++2KYT8+xCMHWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGZezfQM9UHGLH1P/sSKzzDhKPaAac6YkVe+3116a8rpy1g+VUVPUoP6zCZiUzjG4bKGomW2YEDLyxLTgREd6iMhnWQ9cFboHhcIlD6JMg0JqiIPyaQyYlZ5jgEGGeLk8FBFWXWun8Y7ROQuJTirMU2amqiSBnwlf3e2hOa9+8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RWJVV323; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWJVV323"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89F3780D5F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 16:58:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DI-e706j1m2t for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Oct 2025 16:58:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com; envelope-from=ankitkhushwaha.linux@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC33680D5D
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC33680D5D
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RWJVV323
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EC33680D5D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 16:58:20 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-290dc63fabbso60310345ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 09:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761670700; x=1762275500; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DKAJWIVdXY6w33OMTqrvcoCl8DNQe+wsI3uiwsncnTY=;
        b=RWJVV323j8K4W0ZNXl4WoMPCk4YHqr3G+2EDnFe8rGVSeFFPUUqaZIAQOi4bahoZgE
         n/AtbSYP/aiGEXVgnszsRegQSjuc/EACmNzSjdNf14NaSqs8U3A8xmqeW7axDubBWGii
         NuNTP7p5BNsQgp05IDaeGJeMV635r/oSHQwAekJ2JMntNL50kTCgE2fWfTKOlnkgSwwB
         mEvTzJgVu/1Vi8mlI2fmzgvlO5ZYeXhpT8i/11cekGFYO8gyZHxGrfOWkzAcHDbl8JPE
         kc5flDRCHkYkXo4ezfUQGJUEzjRLAfRIhjqWQUm3g3nVju3TvKjTv9yh/M23L+IS2+Sh
         TVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670700; x=1762275500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKAJWIVdXY6w33OMTqrvcoCl8DNQe+wsI3uiwsncnTY=;
        b=qpk3DXnu7yUmSU/P0U/n0Ug0snqpuUH9OpI5uFSxkk30iSaqOje+XHKUrcH/anUsLj
         bfQc8i7m5ddqVIuUqpgX/qnSWcjN1aTaN3NyDVBDddLAt9Shj2Q269WePzCQ6qljbUdq
         LUOmm120ae7bWyzTRk4AyciM3+didmaEkfvraHMQ/YHX13tUt4/U82k8AqKkHlBqsnY9
         rIySjMUY82PvbAjoMfLGevMgJjpsZiNU32L0tqFwqOhxHDOoXHibdBZGSgYp/G8h+lmi
         Oie/EEHgrxg2pd64c743XaYvrgIRd0S3wkdXGp3nZYJaHxKWPPLsanKVJn+HI08OCoN7
         9b/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfHlAC9cEpYlfNLcfYpvXKB7Ov/BpK/vKI+hmEbgjirEe6Ex97cHC7vEeaGEQpMz7eu8auATegtuvt37RmEwtgGzgUTg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy4r1VRnTeOPYCbkrT+I2q6L21g/xHLjRNv6GJgqR+0F3I7fjQ0
	hn3w+awFRl+Gxw+0EJW3uswaWYgtXIfv7B8UNoQ4bBP9FbdEzhskB3rO
X-Gm-Gg: ASbGncunk8ulGi29grlPW6LarBHx90KkPp92UcERuurELNKBJkESD83J+Rckwye2QLQ
	2c7fAxUE7f8ZbMX9cUFvg/VXEx8enbBUhzoJ9AeqtI+i1ZRDoXnHN5Ghz4fwZvq/+C9tfzqokHH
	Z7NvSd7DiJuQO5BMNmjmN7Wj3EaKLxIOrzfKRXBmj8DBYFgVJw2XBSe7mRnapRNbgZUPAh247iS
	JpDHxw6F1Ns2Ma+lLAu12OnBs8lM4rs13i4WzdvLq/xK1orQZyiZwLS1uSGmSMH8lIXJ1Zakpdq
	WKKerk+UgEFoiqCTmhjSkB82W3fzvlh3d0fMR1My5LL7iS3Q7gM50rFbAb3qJM67K6s5KHeG9v2
	1C6O/absaX1iq3ssESSzf8QUR7NDZbuZozbpi8csqu/kznCLOwoJQO97SspQuC9ZDaxLMosJr8X
	q+jjyD9rg0MhdtH3Hr+78=
X-Google-Smtp-Source: AGHT+IGoWRXRZauvUG5j1zo0Qxhl0gwoNettufvBODgutBswNwVQoMUoNOz0OY25v/QcS1yZJBzGlA==
X-Received: by 2002:a17:903:2f0e:b0:290:c0d7:237d with SMTP id d9443c01a7336-294cb50e4bbmr54429445ad.36.1761670700123;
        Tue, 28 Oct 2025 09:58:20 -0700 (PDT)
Received: from fedora ([103.120.31.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf4b0csm121255865ad.10.2025.10.28.09.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 09:58:19 -0700 (PDT)
Date: Tue, 28 Oct 2025 22:28:10 +0530
From: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
	Wei Yang <richard.weiyang@gmail.com>, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] selftests/user_events: Avoid taking address of packed
 member in perf_test
Message-ID: <aQD2Igc3svAF3klc@fedora>
References: <20251027113439.36059-1-ankitkhushwaha.linux@gmail.com>
 <20251027162521.c56c7f89f6ad4e3d639c408c@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027162521.c56c7f89f6ad4e3d639c408c@linux-foundation.org>

On Mon, Oct 27, 2025 at 04:25:21PM -0700, Andrew Morton wrote:
> On Mon, 27 Oct 2025 17:04:39 +0530 Ankit Khushwaha <ankitkhushwaha.linux@gmail.com> wrote:
> 
> > Accessing 'reg.write_index' directly triggers a -Waddress-of-packed-member
> > warning due to potential unaligned pointer access:
> > 
> > perf_test.c:239:38: warning: taking address of packed member 'write_index'
> > of class or structure 'user_reg' may result in an unaligned pointer value 
> > [-Waddress-of-packed-member]
> >   239 |         ASSERT_NE(-1, write(self->data_fd, &reg.write_index,
> >       |                                             ^~~~~~~~~~~~~~~ 
> > 
> > Use memcpy() instead to safely copy the value and avoid unaligned pointer
> > access across architectures.
> > 
> > ...
> >
> > --- a/tools/testing/selftests/user_events/perf_test.c
> > +++ b/tools/testing/selftests/user_events/perf_test.c
> > @@ -201,6 +201,7 @@ TEST_F(user, perf_empty_events) {
> >  	struct perf_event_mmap_page *perf_page;
> >  	int page_size = sysconf(_SC_PAGESIZE);
> >  	int id, fd;
> > +	__u32 write_index;
> >  	__u32 *val;
> >  
> >  	reg.size = sizeof(reg);
> > @@ -236,7 +237,8 @@ TEST_F(user, perf_empty_events) {
> >  	ASSERT_EQ(1 << reg.enable_bit, self->check);
> >  
> >  	/* Ensure write shows up at correct offset */
> > -	ASSERT_NE(-1, write(self->data_fd, &reg.write_index,
> > +	memcpy(&write_index, &reg.write_index, sizeof(reg.write_index));
> > +	ASSERT_NE(-1, write(self->data_fd, &write_index,
> >  	                    sizeof(reg.write_index)));
> 
> Simply casting &write_index to void* would fix this?

yes, this hides the type mismatch from the compiler. But i think
casting to void * will not fix the alignment mismatch for packed struct.
It works on x86, but might break on other platform.

> 
> >  	val = (void *)(((char *)perf_page) + perf_page->data_offset);
> >  	ASSERT_EQ(PERF_RECORD_SAMPLE, *val);

Thanks
Ankit
