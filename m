Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2C21C8638
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 23 Feb 2025 07:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740294021; cv=none; b=F2T52u9xle2dM3syoOFfZliEjRA1RPKoKJD2hFfPhTx5S+yYjxbHdzqRA1TS8V62Cq7PJwW9ndotK29YoHigfbCquVJj+mDumD81pjiIAYoJrIsGK3y2JuddNbH0CvmK6eLPYu788Us+elRg5s865YwN7Gd6+lgMNS9PAm4St4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740294021; c=relaxed/simple;
	bh=ib5TwWcaRw9LUXjvbripaiMLqsuKJwTrOTJaR27F0So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKJkwd7fpYvVSh5O+fWxZcSSVfN9si/gr6K7mC14FYTRUy8er5TnXAnV85htabCwAznNpg8k6KNWSLtSYwR0C300lhWy+8wL3IxFydOlKy9cEfzJzCT0VZRHnzL0n2tShTXuv0g/fc7QGvJeSg4115X2kRy3xKgnvK5zdQ+SiBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvtaH1gJ; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvtaH1gJ"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78F4C407E4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 23 Feb 2025 07:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bsUFbFh6TN7x for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2025 07:00:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::72f; helo=mail-qk1-x72f.google.com; envelope-from=imandevel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE241407C9
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE241407C9
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DvtaH1gJ
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EE241407C9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 23 Feb 2025 07:00:17 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7c095b5365eso226647885a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 23:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740294016; x=1740898816; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0AsXxvvW3BkHd5vCQu8R0wvKfYc8SOGl6m/u1V38cEI=;
        b=DvtaH1gJjULwHZcp0Oj05ImGwDIkXUHVOAyVvK5SN+rb8lKX+x2o8yH/QLo0VlkdhD
         PjDHO36Js6RAyiy7sa/U5B3h+XZHjxV7KsVwssYUZ3XbU9BZ2VxxI6o177mq6pgc7cUJ
         P7pflQsr/Ion3eRlTKGXgtZbHLB1BSF2ffKX/CQnHL3MqIdikoROT4UIepyuRnvi1TnX
         XqOsEMsKcBc3PZNp/rYC73bsIqZ60X5Gx92KSMJ2dlTcvWwIB0gldeyeeliSyGz34mZc
         zdolvWrsDOzWS849GZI6a0Gin62rPC/N6o6v6RoB8vAUndbsmvuCv/lOksqgxe+3z/4u
         Xy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740294016; x=1740898816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AsXxvvW3BkHd5vCQu8R0wvKfYc8SOGl6m/u1V38cEI=;
        b=XYNyZWL5cXGWcwrMKuM9PrbIjs2nIE9tsVRrzz9vJ2fe+nZepLDOxSs79k35W/vqd1
         cDIVgXKH9b6Z8f78pwfSVx64GZPC5NPjEsmBqeoKQEsL9GuGH99qBQc5WM9D+CHnYuxl
         0DJsOfreVArCdmY6HLPieBXP020Gr5MDKv4tHA9wfAJv4K2v4Id3Ylf6XrtmqVWyMMma
         u4i31TBiFQ/e3j/OubnOdw8X708me1/IyGRgqMIf7Me3phpVcn4GqRjTvTNQyc6Ft08F
         6mlXxMWGK4OpmERJMpQd/wl3V45dTHgFrEtgVZ1mPvCNxtH4qcAdO8a4Bk93CLXftsgC
         xiiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgbJMj8+TTvjjj5aqaGYl68RCPrvKSwAdD3TWlVtukUmHz5Qogl1eECZRdXmmW3z6fBBqy40BpeDyH11S4rcIXCUDqQQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw7tdDdaPkANO/zukvUO45tYDtYv4ZAAsHX4rULc6c20WVoNrpG
	8pz3UTvCaCO+FuTpuaVtXk+8uYogYUp5GHuA7BBrI9/6d3xfgznC
X-Gm-Gg: ASbGncujHpXwebD7/ctqtARxq/XPhuaH/L+qqFt2tHSOlmvf9exknJdnzeEfhe3FjgG
	BIa3rUA9XYhJEnKHWBBj6vAPmVIg9Kukz2QFQpeHMjk96Yx0LS/WgUDOJyKV7yPpoeqJrtjkroe
	fE+UNDbvFOpiPCVihwtBqGJW3vbs0OPIAcKzNUR7CRer2MSr/zzhqlemQI14vTNbGsWiVL38J/n
	cDnpbb3HFZ8qc8hYXUIV/z0ouZuGifpcap4AfkcXWgm7Q4oxMG8SC0csgHCl9mGFULM1NgAyNsf
	aoy7plr+6xDWmx9FJqQMf5NV3n9roGvYZgQRTtpIoCdLT1v1x4grG49JNyTeP06yd7nWcw8OfBu
	U9mkPODUXcW6f
X-Google-Smtp-Source: AGHT+IGI0f0oWVpNg7tVGkpoHA4BuZEzcJvgGOpydcBOqIapcgvSQZaqqHx7a34SYNJMw+t7zyS87w==
X-Received: by 2002:a05:620a:4083:b0:7b6:d5b2:e6d with SMTP id af79cd13be357-7c0cef539efmr1335787185a.35.1740294016626;
        Sat, 22 Feb 2025 23:00:16 -0800 (PST)
Received: from localhost (bras-base-toroon0648w-grc-10-142-198-73-227.dsl.bell.ca. [142.198.73.227])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c0b46649d3sm581990085a.32.2025.02.22.23.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 23:00:16 -0800 (PST)
Date: Sun, 23 Feb 2025 02:01:10 -0500
From: Seyediman Seyedarab <imandevel@gmail.com>
To: Ritvik Gupta <ritvikfoss@gmail.com>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] selftests/mount: Close 'fd' when write fails
Message-ID: <5lkv3sotpv6pvs63gds5crwkrvs5xjtdkjmjcnzrc3c6d5s2wg@gzzfvghkp2qm>
References: <20250222114709.50011-1-ritvikfoss@gmail.com>
 <20250222121249.50588-1-ritvikfoss@gmail.com>
 <zshes4xtyir7zrrybeqj2amrxyctwqnuvx2tqyktv4vsfstxqi@pvdq2rb5m47j>
 <Z7qiOE3EXo8BtdY8@ritvikos>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7qiOE3EXo8BtdY8@ritvikos>

On 25/02/23 09:51AM, Ritvik Gupta wrote:
> Yes, the kernel will handle the 'fd' cleanup automatically, but
> the existing implementation already closes it before exiting.
> However, in case where write fails, its unhandled.
> This patch addresses that gap :)
> 
> Nevertheless it's subjective indeed.
> Thanks for reviewing!
> 
> Regards
> Ritvik

The current implementation doesn't close the fd before calling
the die() function. It only closes fd before returning because
vmaybe_write_file() doesn't necessarily exit the process. It
only exits in failure cases, including failures when closing
the file itself. I think the close() failure path might have
caused some confusion.

Cheers,
Seyediman
