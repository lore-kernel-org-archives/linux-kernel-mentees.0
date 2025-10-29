Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2399A31E0EF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Oct 2025 15:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761751248; cv=none; b=bnCablT47avh1RklWShjeO4oMRRyYVdZGGUddeBPd5wx4BY97ENh2YM0qe0L/ycVRVo+JUx09aVfcYfzGutWP12x9dk1z+xYbbXOlqwlmoFoZxYC234w4+iGbDFtjfrHs/ZGm1rV/LfJ8y3aEuY/0E3pvWZ/px0hqeoJrUsqYPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761751248; c=relaxed/simple;
	bh=HtJoUupx6d/yAjUM+7GHFEp8E2bMSioh2TQ2z1eUvkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/9Ib0EjASZ1U5GaoeRsEAOcaVOSre1aMXDe0ekxSLJQ6MUnO5zc5y/fsvMapXCwaoKXkIY1MOHI9mIxCKfvFiVlTWTBFob8/uKMVB52guAberjxZRZAShFdvrBwUk+DPO3nIGWgOsNJOCFNtbRQOUU16NHOSdTyc2h13yXYn4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EsxDfWZg; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EsxDfWZg"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D10A440BC0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Oct 2025 15:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SwzQ9M5tbiOL for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Oct 2025 15:20:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1043; helo=mail-pj1-x1043.google.com; envelope-from=ankitkhushwaha.linux@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3F40B40BB8
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F40B40BB8
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EsxDfWZg
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3F40B40BB8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Oct 2025 15:20:46 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id 98e67ed59e1d1-33d896debe5so61931a91.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Oct 2025 08:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761751245; x=1762356045; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=StYPN+Xnv/FlnNbB7eCIIAuswaamCaMZ2VJSzNeBonw=;
        b=EsxDfWZgCwFEQrjSdUTcbYULt1LNFKq52jRLwBiNFm21C6edES9qANmdomGpvvcckY
         vXshg121kpBfetPTTOvel6kINiywxckOW8aJD0LGHmk0lsOEk1CNh0GfzUV7zn3mpZzs
         AVsmI5zLU8HpFR6uSUa0udycc2tpCEKdUNfkXleDfFMWKw8scg6snn/C96841Hk3MZz7
         8/Uz0Ex4OMTZKGUzbUolT0u2BQcIe9qVyjgEGTlE99N+lQ9PU5SdomE9eNNQ6+eY3Nui
         z5AwqoLbPPJUh/+/mngW+hBtfbT76L3AoV+3ZzXWYdsdN9ZdTHt/7dAz2hlTptnU09Bi
         YN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761751245; x=1762356045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StYPN+Xnv/FlnNbB7eCIIAuswaamCaMZ2VJSzNeBonw=;
        b=UfWw0dYGCOwMpcbxgoQGI8DjObmvUaw5bKIgLxDHBX8F1so99L5fg5SnzXWA7IYa42
         Tpk7r5mZEddmGQC4nlIpcTBRFmhF6dg1Lljr1wSivTXFAa3uHdLSYXANl12Rvo95eTx8
         nv5kTmBZaxfhxm+VVoeH8iPR+5y/kHiHPU8wP7vF2CcVqw5ucwkNshdcfg+KDybcopKh
         EN0HOd5ghUo8CrC0kbcLmQC0GZTso4FHEPsv8KTiGhvDfQr6qslkYDCAGoQePYxR84jz
         tYgkShHrZxKMrsSsHHt13ZQDtwCO588dalTh4mT+1RSEQAV23A1/1qaO3gbcq0TCf2gG
         Fb9g==
X-Forwarded-Encrypted: i=1; AJvYcCV9xKkXEiz15jQc9yCveiDZC/E/CovuD1o9K9BwN5bgfO65sNPg//k2MOtKmRVjWpjSr6Rzqykk78elBAVjdZMzgZjTsw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxDRbsWQrYOyMtFbHUIEWSlHPQT5rDoGw/MlKvzIGF2UyNrVxRz
	2GGKH1iEu7XkyHSfjzZ6RSZDhRvK95iaPQ6BgHhoNMDME0pWNHrobDpo
X-Gm-Gg: ASbGncvX2nuiEgOgGr0Jpzz1WQMsvsIS30XH6v1KfRksJ7BaAFSiUYyp6svk9nBnBuC
	u9oqlOpRFgnTd3RqgcQ0BoclI1VSz8bQKYUdEMOqxjK6rZWF/1Kh+7onMMy6undiTdExfRyWmdN
	gzzx8IXvPg8f1mBMBsR/O5eEkDTvufCMd+FOuoJq6MZN9Auvf03iawYcA4c+SfAZZXYIdcrv1//
	U0kkIDgwz25weHs9kz4vJKt4TwNyW4ECvRlUSju/jMH4/+5b2XGOjcbrZIHqfLYbJVZzMjWdLue
	OWEF3pkfC6oFmBIM4fgJ8TbB6Ztyw/oBW5R7xgAC3ltgIVVSUYTrcFi+PkHw4HM8tT+l2ofn0AS
	kxMfptc3sJS0mgCCrA1hN7lKChZSAzqvG113dssS+LeHawbCG0a4p/EyfTA2bvNuzvz4OoxPaIF
	9B/nez53h0xtFwpH4Jutw=
X-Google-Smtp-Source: AGHT+IEpwGryO+Dsdw+yBiLYzvfG216rbfuFmYTVEwK59maJasPtn26KCM1zCvZKBwTCZ0ScENApeA==
X-Received: by 2002:a17:902:f550:b0:277:3488:787e with SMTP id d9443c01a7336-294dee0cebemr41194955ad.12.1761751245449;
        Wed, 29 Oct 2025 08:20:45 -0700 (PDT)
Received: from fedora ([103.120.31.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3bfesm157605975ad.4.2025.10.29.08.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:20:44 -0700 (PDT)
Date: Wed, 29 Oct 2025 20:50:38 +0530
From: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
	Wei Yang <richard.weiyang@gmail.com>, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] selftests/user_events: Avoid taking address of packed
 member in perf_test
Message-ID: <aQIwxjBNonW5Py_I@fedora>
References: <20251027113439.36059-1-ankitkhushwaha.linux@gmail.com>
 <20251027162521.c56c7f89f6ad4e3d639c408c@linux-foundation.org>
 <aQD2Igc3svAF3klc@fedora>
 <20251028132605.2926d3ef5eb6ea60d22ceffe@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028132605.2926d3ef5eb6ea60d22ceffe@linux-foundation.org>

On Tue, Oct 28, 2025 at 01:26:05PM -0700, Andrew Morton wrote:
> On Tue, 28 Oct 2025 22:28:10 +0530 Ankit Khushwaha <ankitkhushwaha.linux@gmail.com> wrote:
> 
> > > > @@ -236,7 +237,8 @@ TEST_F(user, perf_empty_events) {
> > > >  	ASSERT_EQ(1 << reg.enable_bit, self->check);
> > > >  
> > > >  	/* Ensure write shows up at correct offset */
> > > > -	ASSERT_NE(-1, write(self->data_fd, &reg.write_index,
> > > > +	memcpy(&write_index, &reg.write_index, sizeof(reg.write_index));
> > > > +	ASSERT_NE(-1, write(self->data_fd, &write_index,
> > > >  	                    sizeof(reg.write_index)));
> > > 
> > > Simply casting &write_index to void* would fix this?
> > 
> > yes, this hides the type mismatch from the compiler. But i think
> > casting to void * will not fix the alignment mismatch for packed struct.
> > It works on x86, but might break on other platform.
> 
> It's the second argument to write(2)!  write(2) expects a const char *,
> but void* will work.

Hi Andrew,
Indeed 
`ASSERT_NE(-1, write(self->data_fd, (void *)&reg.write_index, 
		     sizeof(reg.write_index)));`

would work. However since `reg` is packed struct, directly taking the 
address of its member  `&reg.write_index` may lead to unaligned access 
on some architectures. as indicated by the compiler warning

	perf_test.c:239:38: warning: taking address of packed member
	'write_index' of class or structure 'user_reg' may result in 
	an unaligned pointer value [-Waddress-of-packed-member]
	239 |         ASSERT_NE(-1, write(self->data_fd, &reg.write_index,
      	    |						  ^~~~~~~~~~~~~~~

Using `memcpy` avoids this by performing a byte-wise copy, which is safe 
to use for packed structures.

Thanks
-- Ankit
