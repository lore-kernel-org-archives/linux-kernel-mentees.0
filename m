Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E6F1D12EB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Sep 2024 16:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726332305; cv=none; b=hT5DGRhkWJAhzh1ZkpWWPex7KFHiPOp+PpZT4dJ5NSM10HB7Dctk8t72S1t2fqpuLjcowe+HEb6a12YFszOZG3N8ClXcdt4hCkWjytDYd/zDT3Dn0wmY4vLo5Jng7D9zW/T2BnhAsZijkStAkpK5p/Qw/g0TxSv147tyP2c4KkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726332305; c=relaxed/simple;
	bh=VMBG2Dh3Zw7faqlpcqUYMWLfsHTm5HJFrtJVUFbwLYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eA9R+yzpHnuu0/Hsgq49yjIf2tljYkOQT9+AWBkpFHuqaMYVjLrGmDCwjivGPWqePcfB3eRWBa3CZgZ2kNHJ9Om8J4Hvsnd9PWjzSxxLqmLpXVt2Pe4tRvcAEjqFkwiwRcIaly50/G+1OoQKMwhW2PLIAh1D/suWSue16nXdbpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8P7sF+u; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8P7sF+u"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1FAE840C3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Sep 2024 16:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GIYrqoH9xZl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Sep 2024 16:45:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 07E9E840C2
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07E9E840C2
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m8P7sF+u
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 07E9E840C2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Sep 2024 16:45:02 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2d87a0bfaa7so1695437a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Sep 2024 09:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726332302; x=1726937102; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jho1JF+P59lkbzGdVgYwLqxMLIAumaTqEKGdD7HjJX0=;
        b=m8P7sF+urCrYyK17wpQqtCPcW60tSTlTLAd3cVGYkhDl0PdVp2RMH0CpBYyaG0A5im
         reo4gGUijGXLBfNbf9N3/OHqOwP2BJbxZqzk9UQu/n5ZPqejqb6jRjyHwCAdjBAlZ9V/
         EBVfk+5abPASCY76tk6woFG3lYemY3v7WaKLKrdakdWT/CRhMGyOmfytItMdU5JyFzlQ
         WHdB/e9pigVjm7IKyU9kF4K0mXE8G430xSinlL2eE/Gvg79hoejVjmActYsLZgsgbRPk
         bDedb4DutN6coscbq0JtgNc2FOmHmUdqWrfMHsZfDle3vLOK3X2Twh8nnos6702h9UJU
         Dsmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726332302; x=1726937102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jho1JF+P59lkbzGdVgYwLqxMLIAumaTqEKGdD7HjJX0=;
        b=uEWA9hmrjKmkpmccENPOpLz4GPtWQUAjat7oK2yH2to1fgG+6qly+NqkQGJS4/XmzL
         GqmByohwQMUo6oKPM1UkKwJbsQTKiCsZPlqYlW7epxVzGLdWeZgzljy+ocv/8Mvs8irE
         i1WlHMzceL+EK2tHbg+KuPQPkLfI2CZ9UrTHX8skEaoNGlhtcEPZvaH9v55Dk3BKjiGZ
         bL6v9UokLBfWRLuuM+DNP+PEoRos+r+BIAikqNL+Opiqe5ZPAmk2a7cIzQ2+p+M8g/pY
         G0XwAmA+dG4wUs+LTiHOZ0i9uI7l12CD0zQFk+8qHG/ebIsSv7F63tt0CkOV6Cia78aA
         rHzw==
X-Forwarded-Encrypted: i=1; AJvYcCUR+R797P2B3+Tkdz7S2v5318TgPUCzELNxNnIX1HIe/JdL6596ygdRwcSK7ziSX0iCg6d6Wv97FFk5UmV9KYLbOberkQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyT/rtnUkqiJsITYEomTk+8widU3LdSflndkx12/znShYm9X192
	pGRp2iSgqpRtaQGuWAHxYDC0gop5sHD6HyTQD4wm+PkWNxwHu6k/
X-Google-Smtp-Source: AGHT+IGlu9u+g3BPmkH/baJXqXWvTrZtLsscYZ70k87KumegUKrIqkB8liTQ2W23TEeaRKBwr286pA==
X-Received: by 2002:a17:90b:1c92:b0:2d3:bc5f:715f with SMTP id 98e67ed59e1d1-2dbb9df9afbmr8375713a91.10.1726332301803;
        Sat, 14 Sep 2024 09:45:01 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.229.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbcfdc0ac3sm1737304a91.53.2024.09.14.09.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 09:45:01 -0700 (PDT)
Date: Sat, 14 Sep 2024 22:14:56 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: skhan@linuxfoundation.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: octeon: Use new initialization api for
 tasklet
Message-ID: <ZuW9iInzizGypLRt@embed-PC.myguest.virtualbox.org>
References: <20240913191734.805815-1-abhishektamboli9@gmail.com>
 <2024091424-glisten-unmanned-bb8f@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024091424-glisten-unmanned-bb8f@gregkh>

Hi Greg,

On Sat, Sep 14, 2024 at 10:20:02AM +0200, Greg KH wrote:
> On Sat, Sep 14, 2024 at 12:47:34AM +0530, Abhishek Tamboli wrote:
> > Use the new api DECLARE_TASKLET instead of DECLARE_TASKLET_OLD
> > introduced in commit 12cc923f1ccc ("tasklet: Introduce new
> > initialization API").
> 
> This says what you are doing, but not why you are doing this.
> 
> Why is this needed?  What bug does this fix?  The code is the exact same
> afterward so why should this be accepted?
> 
 While this patch doesn't fix any functional bug, it ensures that the 
 code is kept up to date with the new Initialization API for tasklets.

 Regards,
 Abhishek
