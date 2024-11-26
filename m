Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCB91DA109
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 26 Nov 2024 17:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732641715; cv=none; b=bFzgDlmeB6p06sPM79WGZjLhSnvLw4fGfXQsy42OUrC8lsi6hz/v6f+inhu5/qOCcz4cpZXPQNxyCPXT5dDYs8p6ntv/QJXvXqTWk1S1rMoxQIymw9tLhOrfrV/m8rBdvb42rlpvFp+VypdWvtCVs4n0XiOB3Nn2S9qin4hKp0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732641715; c=relaxed/simple;
	bh=gTqypcj+EFFG6uzzQzavl7F2GsO61n5vFJ3OynM84xQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBb+S4x42Fqei7b+gmTpjLfFLeZYHRD8I/He5/xHgVDXqurYRmKaQMGGf1X6x4H4/s7Eg+9m51cLo291vY9h4XCy/SWnxenAArBso/rR5EQy94q0UC3DpsMA35de3v1ajWg3MpRd1FqEU4Cq/ifz0vUCfTToSj3qN3ydy0gYneM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nirt7YPq; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nirt7YPq"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CAA585382
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 26 Nov 2024 17:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIl0TTZBWrrl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2024 17:21:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=leocstone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 765808537C
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 765808537C
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nirt7YPq
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 765808537C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 26 Nov 2024 17:21:53 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-214f6ed9f17so4423975ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 26 Nov 2024 09:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732641713; x=1733246513; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FrIkH1MB0v8Z6/W9Ggvj9owJF6rjo+GqVtj/jimhV98=;
        b=nirt7YPqNbVd51BepNF44lg5aGIoLyyrS0++LfIRvQEnjSDXaxmjzOm/URpbE9TsNm
         wF0BCUcr1Gh7HG4YiES3XA+tJ+jyCcAS0yXM1+IvaDczBaYwApqtBQZ8ac1gyS8pGEVC
         dey6ohno0iEI32I7GvH70brbVdWQv2oE8XqHhTFp9OyWk9MJw2LOnWCd8sYpies9mECV
         q9KJQDsiPX6RDnMSUmHOA8Sph68VvaA1SaGjPxpT6mBIL/eaNQoTvkLz+HrAtn0jJWl/
         kW9DXr6kiGbnp1dbegpmrNelGLL2k8EGP2kKBOByKBk+UOQ1hzcb1v+qeygiCbaCSKb7
         Es/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732641713; x=1733246513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrIkH1MB0v8Z6/W9Ggvj9owJF6rjo+GqVtj/jimhV98=;
        b=m9HF9WSXSDlcm0Pyzp1KQwlnwxxJ3MBEJPgxZhV70z48v2QPc/e+si3rmp2Mm44jW8
         yRrIb+GwgoTUWLLWOg+dy7tHLIAoKnpRfGjeUxBQgpiWvbCPHmICn/VIm6+6ozNCQnsn
         VMuHSCCfbgfChur6nBoIk6lLVD32KD7ZQKodS6vqwC6Db9Jp6p0FnbxyY+BHx5UfeIsm
         rnNvkKVhD38LeAoSZ24m0pNuuOve8f7Hp0jRHk9+Ufm3ejMpsYTBQleT44Oo9XFmrGFi
         eLI8jrCBG5UGJJt0H166EyqwKR0n4AsWhrHxU/zV0xQmk5xzzglp89aqcURtq6R9eU0P
         xUbA==
X-Forwarded-Encrypted: i=1; AJvYcCW+WAnU8FJK7We0iRh9wfuiN88WJWuPGWl+qhfFp35JPg5aIOv5ZcaDHXTSYctKJbPkFF0Nlnlt1OqMYEIaA5cxy7Am9A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx/r1daavB98FY92hrJpu+VQDgkxSS/xDcTJ3AIgeDmtJMx0JA9
	+24KPc0wVCUD2ACRuHnBsPv6jATiyBj1Y40ges29A1wuUADnZhT6
X-Gm-Gg: ASbGncvjRJThhmD+Qsy0KWnkMncmfWmyiXEMO70vNBH02R63dvqJDcViq33KtkVV7iF
	QaCFTuGKlpvzJdNbIPlmQzW5ySCTcyZ6GBmx2PrVA/7gLZLtMpLnlD3ElOjq8cZyO7i9DSGyUyk
	hDRAGYtxC+WrIPUcxnHxtz2HiN5twbbfjn1OXZtjYrgIjmBD34WEUEmaQSJ1n1nERwSkQmjo+1I
	qDfdcyyRiY2+TJ1B/9rBesgzxNJO4Pjxq6DQa0=
X-Google-Smtp-Source: AGHT+IHDsecHndF7b5QQvziiPU8XMujZpFiJZlmKy8xy3DeBm0CZkoaKQrenwPUxLW7TY5QKxmJa3w==
X-Received: by 2002:a17:902:d490:b0:212:4582:37fa with SMTP id d9443c01a7336-2129f7c1863mr231606055ad.53.1732641712688;
        Tue, 26 Nov 2024 09:21:52 -0800 (PST)
Received: from tc ([2601:1c2:c104:170:3e9e:9bc4:e80c:2141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc13f8bsm87243285ad.184.2024.11.26.09.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 09:21:52 -0800 (PST)
Date: Tue, 26 Nov 2024 09:21:50 -0800
From: Leo Stone <leocstone@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: syzbot+2db3c7526ba68f4ea776@syzkaller.appspotmail.com, 
	brauner@kernel.org, quic_jjohnson@quicinc.com, viro@zeniv.linux.org.uk, 
	sandeen@redhat.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, shuah@kernel.org, anupnewsmail@gmail.com, 
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] hfs: Sanity check the root record
Message-ID: <wzxs6mjqlpf2eszoaw2ozvocqg3lpaqx7mzog4tygxexugrbsu@3pxs2vthfagb>
References: <67400d16.050a0220.363a1b.0132.GAE@google.com>
 <20241123194949.9243-1-leocstone@gmail.com>
 <20241126093313.2t7nu67e6cjvbe7b@quack3>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126093313.2t7nu67e6cjvbe7b@quack3>

Hello,

On Tue, Nov 26, 2024 at 10:33:13AM +0100, Jan Kara wrote:
> 
> This certainly won't hurt but shouldn't we also add some stricter checks
> for entry length so that we know we've loaded enough data to have full info
> about the root dir?

Yes, that would be a good idea. Do we want to keep the existing checks
and just make sure we have at least enough to initialize the struct:

if (fd.entrylength > sizeof(rec) || fd.entrylength < 0 ||
    fd.entrylength < sizeof(rec.dir)) {
	res = -EIO;
	goto bail_hfs_find;
}

Or be even stricter and only accept the exact length:

if (fd.entrylength != sizeof(rec.dir)) {
	res = -EIO;
	goto bail_hfs_find;
}

Thanks for your feedback,
Leo
